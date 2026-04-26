// =============================================================================
// LMS Knowledge Graph — Phase 1
// File: 02_create_relationships.cypher
// Description: Creates all relationships between concept nodes
// Run this AFTER 01_create_nodes.cypher
// Run each batch separately in Neo4j Browser — check count(r) after each one
// =============================================================================

// -----------------------------------------------------------------------------
// BATCH A — CN: Protocol Stack + Physical + Data Link + MAC
// Expected count after this batch: ~16
// -----------------------------------------------------------------------------

// Protocol stack foundation
MATCH (a:Concept {name:"Protocol Hierarchy"}), (b:Concept {name:"OSI Reference Model"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Protocol Hierarchy"}), (b:Concept {name:"TCP/IP Reference Model"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"OSI Reference Model"}), (b:Concept {name:"TCP/IP Reference Model"}) CREATE (a)-[:RELATED_TO]->(b);

// Physical layer
MATCH (a:Concept {name:"Bandwidth and Data Rate"}), (b:Concept {name:"Physical Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Transmission Media"}), (b:Concept {name:"Physical Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Physical Layer"}), (b:Concept {name:"Data Link Layer"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Data link layer
MATCH (a:Concept {name:"Framing"}), (b:Concept {name:"Data Link Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Error Detection"}), (b:Concept {name:"Data Link Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Error Correction"}), (b:Concept {name:"Data Link Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Flow Control"}), (b:Concept {name:"Data Link Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Error Detection"}), (b:Concept {name:"Error Correction"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Flow Control"}), (b:Concept {name:"Sliding Window Protocol"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Data Link Layer"}), (b:Concept {name:"MAC Sublayer"}) CREATE (a)-[:LEADS_TO]->(b);

// MAC sublayer
MATCH (a:Concept {name:"MAC Sublayer"}), (b:Concept {name:"CSMA/CD"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"CSMA/CD"}), (b:Concept {name:"Ethernet"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"MAC Sublayer"}), (b:Concept {name:"Network Layer"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// -----------------------------------------------------------------------------
// BATCH B — CN: Network + Transport + Application + Security
// Expected count after this batch: ~59
// -----------------------------------------------------------------------------

// Network layer
MATCH (a:Concept {name:"IP Addressing"}), (b:Concept {name:"Network Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"IPv4"}), (b:Concept {name:"IP Addressing"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"IPv6"}), (b:Concept {name:"IP Addressing"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"IPv4"}), (b:Concept {name:"IPv6"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Routing Algorithms"}), (b:Concept {name:"Network Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Routing Algorithms"}), (b:Concept {name:"Distance Vector Routing"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Routing Algorithms"}), (b:Concept {name:"Link State Routing"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Distance Vector Routing"}), (b:Concept {name:"Link State Routing"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"ICMP"}), (b:Concept {name:"Network Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"NAT"}), (b:Concept {name:"IP Addressing"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Congestion Control"}), (b:Concept {name:"Network Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Network Layer"}), (b:Concept {name:"Transport Layer"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Transport layer
MATCH (a:Concept {name:"TCP"}), (b:Concept {name:"Transport Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"UDP"}), (b:Concept {name:"Transport Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"UDP"}), (b:Concept {name:"TCP"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"TCP Connection Establishment"}), (b:Concept {name:"TCP"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"TCP Congestion Control"}), (b:Concept {name:"TCP"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Congestion Control"}), (b:Concept {name:"TCP Congestion Control"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Flow Control"}), (b:Concept {name:"TCP"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Sockets"}), (b:Concept {name:"Transport Layer"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"TCP"}), (b:Concept {name:"Sockets"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"UDP"}), (b:Concept {name:"Sockets"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Sockets"}), (b:Concept {name:"Socket Programming"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Transport Layer"}), (b:Concept {name:"DNS"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Transport Layer"}), (b:Concept {name:"HTTP"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Application layer
MATCH (a:Concept {name:"DNS"}), (b:Concept {name:"HTTP"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"HTTP"}), (b:Concept {name:"HTTPS"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Cryptography"}), (b:Concept {name:"HTTPS"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Security
MATCH (a:Concept {name:"Symmetric Key Encryption"}), (b:Concept {name:"Cryptography"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Public Key Encryption"}), (b:Concept {name:"Cryptography"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Symmetric Key Encryption"}), (b:Concept {name:"Public Key Encryption"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Public Key Encryption"}), (b:Concept {name:"SSL/TLS"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"SSL/TLS"}), (b:Concept {name:"HTTPS"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Cryptography"}), (b:Concept {name:"Firewalls"}) CREATE (a)-[:LEADS_TO]->(b);

// -----------------------------------------------------------------------------
// BATCH C — OS: All Operating Systems relationships
// Expected count after this batch: ~90
// -----------------------------------------------------------------------------

// Overview → System Calls → Processes
MATCH (a:Concept {name:"Operating System Overview"}), (b:Concept {name:"System Calls"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"System Calls"}), (b:Concept {name:"Process Concept"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Process management
MATCH (a:Concept {name:"Process Concept"}), (b:Concept {name:"Process Scheduling"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Process Concept"}), (b:Concept {name:"Interprocess Communication"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Shared Memory"}), (b:Concept {name:"Interprocess Communication"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Message Passing"}), (b:Concept {name:"Interprocess Communication"}) CREATE (a)-[:IS_PART_OF]->(b);

// Threads and concurrency
MATCH (a:Concept {name:"Process Concept"}), (b:Concept {name:"Threads"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Threads"}), (b:Concept {name:"Concurrency"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Concurrency"}), (b:Concept {name:"Multicore Programming"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// CPU scheduling
MATCH (a:Concept {name:"Process Scheduling"}), (b:Concept {name:"CPU Scheduling Algorithms"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Round Robin Scheduling"}), (b:Concept {name:"CPU Scheduling Algorithms"}) CREATE (a)-[:IS_PART_OF]->(b);
MATCH (a:Concept {name:"Priority Scheduling"}), (b:Concept {name:"CPU Scheduling Algorithms"}) CREATE (a)-[:IS_PART_OF]->(b);

// Synchronization
MATCH (a:Concept {name:"Concurrency"}), (b:Concept {name:"Critical Section Problem"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Critical Section Problem"}), (b:Concept {name:"Mutex Locks"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Critical Section Problem"}), (b:Concept {name:"Semaphores"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Semaphores"}), (b:Concept {name:"Monitors"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Deadlock
MATCH (a:Concept {name:"Mutex Locks"}), (b:Concept {name:"Deadlock"}) CREATE (a)-[:LEADS_TO]->(b);
MATCH (a:Concept {name:"Semaphores"}), (b:Concept {name:"Deadlock"}) CREATE (a)-[:LEADS_TO]->(b);
MATCH (a:Concept {name:"Deadlock"}), (b:Concept {name:"Deadlock Prevention"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Deadlock Prevention"}), (b:Concept {name:"Deadlock Avoidance"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Deadlock Prevention"}), (b:Concept {name:"Deadlock Detection"}) CREATE (a)-[:RELATED_TO]->(b);

// Memory management
MATCH (a:Concept {name:"System Calls"}), (b:Concept {name:"Main Memory Management"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Main Memory Management"}), (b:Concept {name:"Paging"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Paging"}), (b:Concept {name:"Page Table"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Paging"}), (b:Concept {name:"Virtual Memory"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Virtual Memory"}), (b:Concept {name:"Demand Paging"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Demand Paging"}), (b:Concept {name:"Page Replacement"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Page Replacement"}), (b:Concept {name:"Thrashing"}) CREATE (a)-[:LEADS_TO]->(b);

// File systems
MATCH (a:Concept {name:"File System Interface"}), (b:Concept {name:"File System Implementation"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// Security and protection
MATCH (a:Concept {name:"OS Security"}), (b:Concept {name:"Protection"}) CREATE (a)-[:PREREQUISITE_OF]->(b);
MATCH (a:Concept {name:"Protection"}), (b:Concept {name:"Access Control"}) CREATE (a)-[:PREREQUISITE_OF]->(b);

// -----------------------------------------------------------------------------
// BATCH D — Cross-course relationships (CN ↔ OS)
// Expected final count: ~90
// -----------------------------------------------------------------------------

MATCH (a:Concept {name:"Socket Programming"}), (b:Concept {name:"Interprocess Communication"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Message Passing"}), (b:Concept {name:"Transport Layer"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Threads"}), (b:Concept {name:"Socket Programming"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Concurrency"}), (b:Concept {name:"TCP Congestion Control"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Cryptography"}), (b:Concept {name:"OS Security"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"SSL/TLS"}), (b:Concept {name:"OS Security"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Protection"}), (b:Concept {name:"Firewalls"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Access Control"}), (b:Concept {name:"Firewalls"}) CREATE (a)-[:RELATED_TO]->(b);
MATCH (a:Concept {name:"Shared Memory"}), (b:Concept {name:"Sockets"}) CREATE (a)-[:RELATED_TO]->(b);

// =============================================================================
// VERIFICATION — run after all batches complete
// =============================================================================

// 1. Relationship counts by type
// MATCH ()-[r]->() RETURN type(r) AS type, count(r) AS count ORDER BY type
// Expected: IS_PART_OF ~23, LEADS_TO ~5, PREREQUISITE_OF ~45, RELATED_TO ~17

// 2. No isolated nodes
// MATCH (c:Concept) WHERE NOT (c)-[]-() RETURN c.name, c.domain
// Expected: no rows returned

// 3. Gap detection test
// MATCH (c:Concept {name:"TCP Congestion Control"})<-[:PREREQUISITE_OF*1..3]-(prereq:Concept)
// RETURN prereq.name, prereq.complexity_score ORDER BY prereq.complexity_score ASC
// Expected: Congestion Control (7), Flow Control (5), TCP (6)

// 4. Cross-course query test
// MATCH (c:Concept {name:"Socket Programming"})-[:RELATED_TO]-(related:Concept)
// RETURN related.name, related.domain
// Expected: Interprocess Communication (OS), Threads (OS)
