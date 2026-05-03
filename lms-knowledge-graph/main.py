# main.py
# Run this to verify all query functions work correctly against your Neo4j instance.
# Usage: python main.py

from knowledge_graph.queries import (
    get_content_location,
    get_prerequisites,
    get_concept_neighbors,
    get_module_concepts,
    get_skippable_concepts,
    get_cross_course_connections,
    get_concept
)
from knowledge_graph.db import close_driver
import json

def test(label, result):
    print(f"\n{'='*60}")
    print(f"TEST: {label}")
    print('='*60)
    print(json.dumps(result, indent=2))

if __name__ == "__main__":
    try:
        # 1. Gap detection
        test(
            "get_prerequisites('TCP Congestion Control')",
            get_prerequisites("TCP Congestion Control")
        )

        # 2. Concept neighborhood
        test(
            "get_concept_neighbors('TCP')",
            get_concept_neighbors("TCP")
        )

        # 3. Module concepts
        test(
            "get_module_concepts('Computer Networks', 6)",
            get_module_concepts("Computer Networks", 6)
        )

        # 4. Skill gap
        test(
            "get_skippable_concepts('Computer Networks', 'advanced')",
            get_skippable_concepts("Computer Networks", "advanced")
        )

        # 5. Cross-course connections
        test(
            "get_cross_course_connections('Socket Programming')",
            get_cross_course_connections("Socket Programming")
        )

        # 6. Single concept
        test(
            "get_concept('Paging')",
            get_concept("Paging")
        )
        # 7. Content location
        test(
            "get_content_location('TCP Congestion Control')",
            get_content_location("TCP Congestion Control")
        )

        test(
            "get_content_location('Paging')",
            get_content_location("Paging")
        )

    finally:
        close_driver()
        print("\n\nAll tests done. Driver closed.")