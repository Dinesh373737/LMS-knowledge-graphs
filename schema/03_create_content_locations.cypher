// =============================================================================
// LMS Knowledge Graph — Phase 1
// File: 03_create_content_locations.cypher
// Description: Creates ContentLocation nodes and links them to Concept nodes
//              via TAUGHT_IN relationships.
// Run AFTER 01_create_nodes.cypher and 02_create_relationships.cypher
// =============================================================================

// -----------------------------------------------------------------------------
// STEP 1: Computer Networks ContentLocation nodes (Tanenbaum 5th Ed)
// Page numbers refer to book pages, not PDF pages.
// -----------------------------------------------------------------------------

CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 1, page_start: 29, page_end: 40,  topic: "Protocol Hierarchy"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 1, page_start: 41, page_end: 44,  topic: "OSI Reference Model"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 1, page_start: 45, page_end: 48,  topic: "TCP/IP Reference Model"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 2, page_start: 89, page_end: 93,  topic: "Physical Layer"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 2, page_start: 94, page_end: 94,  topic: "Bandwidth and Data Rate"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 2, page_start: 95, page_end: 104, topic: "Transmission Media"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 193, page_end: 201, topic: "Data Link Layer"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 197, page_end: 199, topic: "Framing"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 201, page_end: 201, topic: "Flow Control"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 202, page_end: 213, topic: "Error Correction"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 209, page_end: 214, topic: "Error Detection"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 3, page_start: 226, page_end: 243, topic: "Sliding Window Protocol"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 4, page_start: 257, page_end: 279, topic: "MAC Sublayer"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 4, page_start: 266, page_end: 279, topic: "CSMA/CD"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 4, page_start: 280, page_end: 298, topic: "Ethernet"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 355, page_end: 361, topic: "Network Layer"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 362, page_end: 391, topic: "Routing Algorithms"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 370, page_end: 372, topic: "Distance Vector Routing"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 373, page_end: 377, topic: "Link State Routing"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 392, page_end: 403, topic: "Congestion Control"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 439, page_end: 441, topic: "IPv4"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 442, page_end: 454, topic: "IP Addressing"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 449, page_end: 454, topic: "NAT"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 455, page_end: 464, topic: "IPv6"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 5, page_start: 465, page_end: 469, topic: "ICMP"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 495, page_end: 507, topic: "Transport Layer"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 500, page_end: 502, topic: "Sockets"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 503, page_end: 506, topic: "Socket Programming"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 512, page_end: 516, topic: "TCP Connection Establishment"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 541, page_end: 551, topic: "UDP"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 552, page_end: 570, topic: "TCP"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 6, page_start: 571, page_end: 580, topic: "TCP Congestion Control"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 7, page_start: 611, page_end: 622, topic: "DNS"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 7, page_start: 683, page_end: 692, topic: "HTTP"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 7, page_start: 683, page_end: 692, topic: "HTTPS"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 8, page_start: 767, page_end: 792, topic: "Cryptography"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 8, page_start: 767, page_end: 792, topic: "Symmetric Key Encryption"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 8, page_start: 793, page_end: 795, topic: "Public Key Encryption"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 8, page_start: 818, page_end: 820, topic: "Firewalls"});
CREATE (:ContentLocation {course: "Computer Networks", type: "PDF", chapter: 8, page_start: 853, page_end: 856, topic: "SSL/TLS"});

// -----------------------------------------------------------------------------
// STEP 2: Operating Systems ContentLocation nodes (Silberschatz 10th Ed)
// -----------------------------------------------------------------------------

CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 1,  page_start: 4,   page_end: 53,  topic: "Operating System Overview"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 2,  page_start: 62,  page_end: 73,  topic: "System Calls"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 3,  page_start: 106, page_end: 109, topic: "Process Concept"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 3,  page_start: 113, page_end: 122, topic: "Process Scheduling"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 3,  page_start: 123, page_end: 131, topic: "Interprocess Communication"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 3,  page_start: 125, page_end: 126, topic: "Shared Memory"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 3,  page_start: 127, page_end: 131, topic: "Message Passing"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 4,  page_start: 160, page_end: 161, topic: "Threads"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 4,  page_start: 160, page_end: 196, topic: "Concurrency"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 4,  page_start: 162, page_end: 165, topic: "Multicore Programming"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 5,  page_start: 200, page_end: 250, topic: "CPU Scheduling Algorithms"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 5,  page_start: 205, page_end: 216, topic: "Round Robin Scheduling"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 5,  page_start: 205, page_end: 216, topic: "Priority Scheduling"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 6,  page_start: 260, page_end: 261, topic: "Critical Section Problem"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 6,  page_start: 270, page_end: 271, topic: "Mutex Locks"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 6,  page_start: 272, page_end: 275, topic: "Semaphores"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 6,  page_start: 276, page_end: 282, topic: "Monitors"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 8,  page_start: 318, page_end: 325, topic: "Deadlock"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 8,  page_start: 327, page_end: 329, topic: "Deadlock Prevention"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 8,  page_start: 330, page_end: 336, topic: "Deadlock Avoidance"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 8,  page_start: 337, page_end: 340, topic: "Deadlock Detection"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 9,  page_start: 349, page_end: 359, topic: "Main Memory Management"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 9,  page_start: 360, page_end: 370, topic: "Paging"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 9,  page_start: 371, page_end: 375, topic: "Page Table"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 10, page_start: 389, page_end: 391, topic: "Virtual Memory"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 10, page_start: 392, page_end: 400, topic: "Demand Paging"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 10, page_start: 401, page_end: 418, topic: "Page Replacement"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 10, page_start: 419, page_end: 424, topic: "Thrashing"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 13, page_start: 529, page_end: 560, topic: "File System Interface"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 14, page_start: 564, page_end: 593, topic: "File System Implementation"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 16, page_start: 621, page_end: 664, topic: "OS Security"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 17, page_start: 667, page_end: 696, topic: "Protection"});
CREATE (:ContentLocation {course: "Operating Systems", type: "PDF", chapter: 17, page_start: 675, page_end: 681, topic: "Access Control"});

// -----------------------------------------------------------------------------
// STEP 3: TAUGHT_IN relationships — link Concepts to ContentLocations
// Run each MATCH separately to avoid timeout
// -----------------------------------------------------------------------------

MATCH (c:Concept {name:"Protocol Hierarchy"}), (l:ContentLocation {topic:"Protocol Hierarchy"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"OSI Reference Model"}), (l:ContentLocation {topic:"OSI Reference Model"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"TCP/IP Reference Model"}), (l:ContentLocation {topic:"TCP/IP Reference Model"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Physical Layer"}), (l:ContentLocation {topic:"Physical Layer"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Bandwidth and Data Rate"}), (l:ContentLocation {topic:"Bandwidth and Data Rate"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Transmission Media"}), (l:ContentLocation {topic:"Transmission Media"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Data Link Layer"}), (l:ContentLocation {topic:"Data Link Layer"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Framing"}), (l:ContentLocation {topic:"Framing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Flow Control"}), (l:ContentLocation {topic:"Flow Control"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Error Correction"}), (l:ContentLocation {topic:"Error Correction"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Error Detection"}), (l:ContentLocation {topic:"Error Detection"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Sliding Window Protocol"}), (l:ContentLocation {topic:"Sliding Window Protocol"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"MAC Sublayer"}), (l:ContentLocation {topic:"MAC Sublayer"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"CSMA/CD"}), (l:ContentLocation {topic:"CSMA/CD"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Ethernet"}), (l:ContentLocation {topic:"Ethernet"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Network Layer"}), (l:ContentLocation {topic:"Network Layer"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Routing Algorithms"}), (l:ContentLocation {topic:"Routing Algorithms"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Distance Vector Routing"}), (l:ContentLocation {topic:"Distance Vector Routing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Link State Routing"}), (l:ContentLocation {topic:"Link State Routing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Congestion Control"}), (l:ContentLocation {topic:"Congestion Control"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"IPv4"}), (l:ContentLocation {topic:"IPv4"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"IP Addressing"}), (l:ContentLocation {topic:"IP Addressing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"NAT"}), (l:ContentLocation {topic:"NAT"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"IPv6"}), (l:ContentLocation {topic:"IPv6"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"ICMP"}), (l:ContentLocation {topic:"ICMP"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Transport Layer"}), (l:ContentLocation {topic:"Transport Layer"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Sockets"}), (l:ContentLocation {topic:"Sockets"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Socket Programming"}), (l:ContentLocation {topic:"Socket Programming"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"TCP Connection Establishment"}), (l:ContentLocation {topic:"TCP Connection Establishment"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"UDP"}), (l:ContentLocation {topic:"UDP"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"TCP"}), (l:ContentLocation {topic:"TCP"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"TCP Congestion Control"}), (l:ContentLocation {topic:"TCP Congestion Control"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"DNS"}), (l:ContentLocation {topic:"DNS"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"HTTP"}), (l:ContentLocation {topic:"HTTP"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"HTTPS"}), (l:ContentLocation {topic:"HTTPS"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Cryptography"}), (l:ContentLocation {topic:"Cryptography"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Symmetric Key Encryption"}), (l:ContentLocation {topic:"Symmetric Key Encryption"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Public Key Encryption"}), (l:ContentLocation {topic:"Public Key Encryption"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Firewalls"}), (l:ContentLocation {topic:"Firewalls"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"SSL/TLS"}), (l:ContentLocation {topic:"SSL/TLS"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Operating System Overview"}), (l:ContentLocation {topic:"Operating System Overview"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"System Calls"}), (l:ContentLocation {topic:"System Calls"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Process Concept"}), (l:ContentLocation {topic:"Process Concept"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Process Scheduling"}), (l:ContentLocation {topic:"Process Scheduling"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Interprocess Communication"}), (l:ContentLocation {topic:"Interprocess Communication"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Shared Memory"}), (l:ContentLocation {topic:"Shared Memory"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Message Passing"}), (l:ContentLocation {topic:"Message Passing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Threads"}), (l:ContentLocation {topic:"Threads"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Concurrency"}), (l:ContentLocation {topic:"Concurrency"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Multicore Programming"}), (l:ContentLocation {topic:"Multicore Programming"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"CPU Scheduling Algorithms"}), (l:ContentLocation {topic:"CPU Scheduling Algorithms"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Round Robin Scheduling"}), (l:ContentLocation {topic:"Round Robin Scheduling"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Priority Scheduling"}), (l:ContentLocation {topic:"Priority Scheduling"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Critical Section Problem"}), (l:ContentLocation {topic:"Critical Section Problem"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Mutex Locks"}), (l:ContentLocation {topic:"Mutex Locks"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Semaphores"}), (l:ContentLocation {topic:"Semaphores"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Monitors"}), (l:ContentLocation {topic:"Monitors"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Deadlock"}), (l:ContentLocation {topic:"Deadlock"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Deadlock Prevention"}), (l:ContentLocation {topic:"Deadlock Prevention"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Deadlock Avoidance"}), (l:ContentLocation {topic:"Deadlock Avoidance"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Deadlock Detection"}), (l:ContentLocation {topic:"Deadlock Detection"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Main Memory Management"}), (l:ContentLocation {topic:"Main Memory Management"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Paging"}), (l:ContentLocation {topic:"Paging"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Page Table"}), (l:ContentLocation {topic:"Page Table"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Virtual Memory"}), (l:ContentLocation {topic:"Virtual Memory"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Demand Paging"}), (l:ContentLocation {topic:"Demand Paging"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Page Replacement"}), (l:ContentLocation {topic:"Page Replacement"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Thrashing"}), (l:ContentLocation {topic:"Thrashing"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"File System Interface"}), (l:ContentLocation {topic:"File System Interface"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"File System Implementation"}), (l:ContentLocation {topic:"File System Implementation"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"OS Security"}), (l:ContentLocation {topic:"OS Security"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Protection"}), (l:ContentLocation {topic:"Protection"}) CREATE (c)-[:TAUGHT_IN]->(l);
MATCH (c:Concept {name:"Access Control"}), (l:ContentLocation {topic:"Access Control"}) CREATE (c)-[:TAUGHT_IN]->(l);

// =============================================================================
// VERIFICATION
// =============================================================================

// 1. Check ContentLocation node count — should be 73
// MATCH (l:ContentLocation) RETURN count(l)

// 2. Check TAUGHT_IN count — should be 73
// MATCH ()-[r:TAUGHT_IN]->() RETURN count(r)

// 3. Test RAG agent query — "Where is TCP Congestion Control taught?"
// MATCH (c:Concept {name:"TCP Congestion Control"})-[:TAUGHT_IN]->(l:ContentLocation)
// RETURN l.course, l.type, l.chapter, l.page_start, l.page_end
// Expected: Computer Networks | PDF | Chapter 6 | p571–580

// 4. Test full path query — gap detection + content location together
// MATCH (c:Concept {name:"TCP Congestion Control"})<-[:PREREQUISITE_OF*1..2]-(prereq:Concept)-[:TAUGHT_IN]->(loc:ContentLocation)
// RETURN prereq.name, loc.course, loc.chapter, loc.page_start, loc.page_end
// Expected: Congestion Control (Ch5 p392-403), TCP (Ch6 p552-570)
