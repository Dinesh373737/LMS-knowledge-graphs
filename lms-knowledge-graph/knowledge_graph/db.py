# knowledge_graph/db.py
# Handles the Neo4j connection.
# All other files import `get_driver` from here — never create connections elsewhere.

import os
from neo4j import GraphDatabase
from dotenv import load_dotenv

# Load variables from .env (safe — .env is in .gitignore)
load_dotenv()

NEO4J_URI = os.getenv("NEO4J_URI", "bolt://127.0.0.1:7687")
NEO4J_USER = os.getenv("NEO4J_USER", "neo4j")
NEO4J_PASSWORD = os.getenv("NEO4J_PASSWORD")

if not NEO4J_PASSWORD:
    raise EnvironmentError(
        "NEO4J_PASSWORD is not set. "
        "Create a .env file based on .env.example and set your password there."
    )

_driver = None

def get_driver():
    global _driver
    if _driver is None:
        _driver = GraphDatabase.driver(NEO4J_URI, auth=(NEO4J_USER, NEO4J_PASSWORD))
    return _driver

def close_driver():
    global _driver
    if _driver is not None:
        _driver.close()
        _driver = None