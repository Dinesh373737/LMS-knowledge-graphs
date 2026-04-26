# Knowledge Graph — LMS Phase 1

**Owner:** Knowledge Graph module  
**Team:** Programming Mechanics — Team 75  
**Courses:** Computer Networks (Tanenbaum 5th Ed) + Operating Systems (Silberschatz 10th Ed)

---

## What's in here

| File | Purpose |
|---|---|
| `01_create_nodes.cypher` | Creates all Course and Concept nodes |
| `02_create_relationships.cypher` | Creates all relationships between nodes |

---

## How to load into Neo4j

1. Install Neo4j Desktop from https://neo4j.com/download
2. Create a new local database (name it `lms-phase1`)
3. Start the database and open Neo4j Browser
4. Paste and run `01_create_nodes.cypher` first
5. Paste and run each BATCH (A, B, C, D) from `02_create_relationships.cypher` **separately**
6. Run the verification queries at the bottom of file 02 to confirm everything loaded correctly

---

## Schema

### Node Types

**Course**
```
name          — full course name
code          — short code (CN / OS)
textbook      — source textbook
total_modules — number of chapters
```

**Concept**
```
name              — concept name (used as unique identifier in queries)
complexity_score  — difficulty 1–10
competency_level  — beginner / intermediate / advanced
domain            — Computer Networks / Operating Systems
description       — one-line explanation
chapter           — source chapter in textbook
```

### Relationship Types

| Relationship | Meaning | Example |
|---|---|---|
| `PREREQUISITE_OF` | Must know A before B | Paging → Virtual Memory |
| `IS_PART_OF` | A is a subtopic of B | TCP → Transport Layer |
| `RELATED_TO` | Connected, no strict dependency | TCP ↔ UDP |
| `LEADS_TO` | A naturally progresses to B | Deadlock → Deadlock Prevention |

---

## Stats (Phase 1)

- Total nodes: 75 (73 Concepts + 2 Courses)
- Total relationships: 90
- CN concepts: 40
- OS concepts: 33
- Cross-course relationships: 9

---

## Queries used by other layers

### Gap Detection (Assessment Critic agent)
```cypher
MATCH (c:Concept {name: $concept_name})<-[:PREREQUISITE_OF*1..3]-(prereq:Concept)
RETURN prereq.name, prereq.complexity_score
ORDER BY prereq.complexity_score ASC
```

### Concept Neighborhood (Socratic Tutor agent)
```cypher
MATCH (c:Concept {name: $concept_name})-[r]-(neighbor:Concept)
RETURN neighbor.name, neighbor.domain, type(r) AS relationship
```

### Skill Gap (Personalization layer)
```cypher
MATCH (c:Concept {domain: $course})
WHERE c.competency_level IN $known_levels
RETURN c.name, c.complexity_score, c.chapter
ORDER BY c.complexity_score ASC
```

### Module Concepts (Active Recall)
```cypher
MATCH (c:Concept {domain: $course, chapter: $chapter})
RETURN c.name, c.complexity_score, c.competency_level
ORDER BY c.complexity_score ASC
```