# knowledge_graph/queries.py
# All query functions for the LMS knowledge graph.
# Each function takes simple Python arguments and returns plain dicts/lists.
# No Cypher knowledge needed by the caller.

from knowledge_graph.db import get_driver


# ─────────────────────────────────────────────────────────────
# 1. GAP DETECTION
# Used by: Assessment Critic agent
# "Student failed X — what prerequisites are they likely missing?"
# ─────────────────────────────────────────────────────────────

def get_prerequisites(concept_name: str, depth: int = 3) -> list[dict]:
    """
    Returns all prerequisite concepts up to `depth` hops back.
    Ordered from simplest to most complex.
    """
    # Build query with depth baked in — Neo4j doesn't support
    # runtime parameters for variable path lengths
    query = f"""
        MATCH (c:Concept {{name: $name}})<-[:PREREQUISITE_OF*1..{depth}]-(prereq:Concept)
        RETURN prereq.name AS name,
               prereq.complexity_score AS complexity_score,
               prereq.competency_level AS competency_level,
               prereq.domain AS domain
        ORDER BY prereq.complexity_score ASC
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, name=concept_name)
        return [dict(record) for record in result]


# ─────────────────────────────────────────────────────────────
# 2. CONCEPT NEIGHBORHOOD
# Used by: Socratic Tutor agent
# "What concepts surround X so I can ask guided questions?"
# ─────────────────────────────────────────────────────────────

def get_concept_neighbors(concept_name: str) -> dict:
    """
    Returns all directly connected concepts and their relationship type.
    Splits results into prerequisites, leads_to, related, and is_part_of
    so the Socratic Tutor knows which direction to guide the student.

    Example:
        get_concept_neighbors("TCP")
        → {
            "prerequisites": [...],
            "leads_to": [...],
            "related": [...],
            "parts": [...]
          }
    """
    query = """
        MATCH (c:Concept {name: $name})-[r]-(neighbor:Concept)
        RETURN neighbor.name AS name,
               neighbor.domain AS domain,
               neighbor.complexity_score AS complexity_score,
               neighbor.competency_level AS competency_level,
               type(r) AS relationship,
               startNode(r).name AS from_node
        ORDER BY neighbor.complexity_score ASC
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, name=concept_name)
        records = [dict(record) for record in result]

    # Organise into buckets for the tutor
    neighbors = {
        "concept": concept_name,
        "prerequisites": [],
        "leads_to": [],
        "related": [],
        "parts": []
    }

    for r in records:
        rel = r["relationship"]
        is_incoming = r["from_node"] != concept_name

        if rel == "PREREQUISITE_OF":
            if is_incoming:
                neighbors["prerequisites"].append(r)
            else:
                neighbors["leads_to"].append(r)
        elif rel == "IS_PART_OF":
            neighbors["parts"].append(r)
        elif rel == "RELATED_TO":
            neighbors["related"].append(r)

    return neighbors


# ─────────────────────────────────────────────────────────────
# 3. MODULE CONCEPTS
# Used by: Active Recall layer
# "Student just finished Chapter X of Course Y — what concepts
#  should they be able to recall?"
# ─────────────────────────────────────────────────────────────

def get_module_concepts(course: str, chapter: int) -> list[dict]:
    """
    Returns all concepts from a specific chapter of a course.
    Ordered from simplest to most complex — Active Recall
    uses this to check the student's spoken summary against.

    Example:
        get_module_concepts("Computer Networks", 6)
        → [{"name": "UDP", ...}, {"name": "TCP", ...}, ...]
    """
    query = """
        MATCH (c:Concept {domain: $course, chapter: $chapter})
        RETURN c.name AS name,
               c.complexity_score AS complexity_score,
               c.competency_level AS competency_level,
               c.description AS description
        ORDER BY c.complexity_score ASC
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, course=course, chapter=chapter)
        return [dict(record) for record in result]


# ─────────────────────────────────────────────────────────────
# 4. SKILL GAP PERSONALIZATION
# Used by: Skill-Gap Personalization layer
# "This student is advanced — what content can they skip?"
# ─────────────────────────────────────────────────────────────

def get_skippable_concepts(course: str, known_level: str) -> list[dict]:
    """
    Returns concepts a student can skip based on their competency level.
    Logic: if student is "intermediate", they can skip all "beginner" concepts.
           if student is "advanced", they can skip "beginner" and "intermediate".

    Example:
        get_skippable_concepts("Computer Networks", "advanced")
        → [{"name": "OSI Reference Model", ...}, {"name": "UDP", ...}, ...]
    """
    level_map = {
        "beginner": [],
        "intermediate": ["beginner"],
        "advanced": ["beginner", "intermediate"]
    }
    skippable_levels = level_map.get(known_level, [])

    if not skippable_levels:
        return []

    query = """
        MATCH (c:Concept {domain: $course})
        WHERE c.competency_level IN $levels
        RETURN c.name AS name,
               c.complexity_score AS complexity_score,
               c.competency_level AS competency_level,
               c.chapter AS chapter
        ORDER BY c.complexity_score ASC
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, course=course, levels=skippable_levels)
        return [dict(record) for record in result]


# ─────────────────────────────────────────────────────────────
# 5. CROSS-COURSE CONNECTIONS
# Used by: RAG Search agent
# "What does this CN concept connect to in OS, or vice versa?"
# ─────────────────────────────────────────────────────────────

def get_cross_course_connections(concept_name: str) -> list[dict]:
    """
    Returns concepts from the OTHER course that are related to this concept.
    Used by the RAG agent to surface cross-subject connections.

    Example:
        get_cross_course_connections("Socket Programming")
        → [{"name": "Interprocess Communication", "domain": "Operating Systems", ...},
           {"name": "Threads", "domain": "Operating Systems", ...}]
    """
    query = """
        MATCH (c:Concept {name: $name})-[:RELATED_TO]-(other:Concept)
        WHERE other.domain <> c.domain
        RETURN other.name AS name,
               other.domain AS domain,
               other.complexity_score AS complexity_score,
               other.competency_level AS competency_level,
               other.description AS description
        ORDER BY other.complexity_score ASC
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, name=concept_name)
        return [dict(record) for record in result]


# ─────────────────────────────────────────────────────────────
# 6. CONCEPT DETAIL
# Used by: any agent that needs full info on a single concept
# ─────────────────────────────────────────────────────────────

def get_concept(concept_name: str) -> dict | None:
    """
    Returns all properties of a single concept node.
    Returns None if concept doesn't exist.

    Example:
        get_concept("Paging")
        → {"name": "Paging", "complexity_score": 6, "domain": "Operating Systems", ...}
    """
    query = """
        MATCH (c:Concept {name: $name})
        RETURN c.name AS name,
               c.complexity_score AS complexity_score,
               c.competency_level AS competency_level,
               c.domain AS domain,
               c.description AS description,
               c.chapter AS chapter
    """
    driver = get_driver()
    with driver.session() as session:
        result = session.run(query, name=concept_name)
        record = result.single()
        return dict(record) if record else None