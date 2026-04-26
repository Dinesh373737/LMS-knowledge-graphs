// =============================================================================
// LMS Knowledge Graph — Phase 1
// File: 01_create_nodes.cypher
// Description: Creates all Course and Concept nodes for CN and OS courses
// Run this FIRST before 02_create_relationships.cypher
// =============================================================================

// -----------------------------------------------------------------------------
// STEP 1: Course nodes
// -----------------------------------------------------------------------------
CREATE (:Course {name: "Computer Networks", code: "CN", textbook: "Tanenbaum 5th Ed", total_modules: 8});
CREATE (:Course {name: "Operating Systems", code: "OS", textbook: "Silberschatz 10th Ed", total_modules: 17});

// -----------------------------------------------------------------------------
// STEP 2: Computer Networks — Concept nodes (Tanenbaum Ch 1–8)
// -----------------------------------------------------------------------------

// Chapter 1 — Introduction
CREATE (:Concept {name: "OSI Reference Model", complexity_score: 3, competency_level: "beginner", domain: "Computer Networks", description: "Seven-layer conceptual model for network communication", chapter: 1});
CREATE (:Concept {name: "TCP/IP Reference Model", complexity_score: 3, competency_level: "beginner", domain: "Computer Networks", description: "Four-layer practical model used by the Internet", chapter: 1});
CREATE (:Concept {name: "Protocol Hierarchy", complexity_score: 2, competency_level: "beginner", domain: "Computer Networks", description: "Layered structure of network protocols", chapter: 1});

// Chapter 2 — Physical Layer
CREATE (:Concept {name: "Physical Layer", complexity_score: 3, competency_level: "beginner", domain: "Computer Networks", description: "Transmission of raw bits over a communication channel", chapter: 2});
CREATE (:Concept {name: "Bandwidth and Data Rate", complexity_score: 3, competency_level: "beginner", domain: "Computer Networks", description: "Theoretical limits on channel capacity", chapter: 2});
CREATE (:Concept {name: "Transmission Media", complexity_score: 2, competency_level: "beginner", domain: "Computer Networks", description: "Physical mediums for data transmission including copper, fiber, wireless", chapter: 2});

// Chapter 3 — Data Link Layer
CREATE (:Concept {name: "Data Link Layer", complexity_score: 4, competency_level: "beginner", domain: "Computer Networks", description: "Reliable transmission of frames between adjacent nodes", chapter: 3});
CREATE (:Concept {name: "Framing", complexity_score: 3, competency_level: "beginner", domain: "Computer Networks", description: "Dividing a bit stream into discrete frames", chapter: 3});
CREATE (:Concept {name: "Error Detection", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Techniques to detect errors in transmitted data including CRC and checksums", chapter: 3});
CREATE (:Concept {name: "Error Correction", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Techniques to correct errors without retransmission using redundancy", chapter: 3});
CREATE (:Concept {name: "Flow Control", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Preventing a fast sender from overwhelming a slow receiver", chapter: 3});
CREATE (:Concept {name: "Sliding Window Protocol", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Protocol allowing multiple frames in transit for efficiency", chapter: 3});

// Chapter 4 — MAC Sublayer
CREATE (:Concept {name: "MAC Sublayer", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Medium Access Control — determines who can transmit on a shared channel", chapter: 4});
CREATE (:Concept {name: "CSMA/CD", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Carrier Sense Multiple Access with Collision Detection used in Ethernet", chapter: 4});
CREATE (:Concept {name: "Ethernet", complexity_score: 4, competency_level: "intermediate", domain: "Computer Networks", description: "Most widely used LAN technology", chapter: 4});

// Chapter 5 — Network Layer
CREATE (:Concept {name: "Network Layer", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Routing packets from source to destination across multiple networks", chapter: 5});
CREATE (:Concept {name: "IP Addressing", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Logical addressing scheme for identifying network hosts", chapter: 5});
CREATE (:Concept {name: "IPv4", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "32-bit Internet Protocol version 4 with packet structure and addressing", chapter: 5});
CREATE (:Concept {name: "IPv6", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "128-bit next-generation Internet Protocol", chapter: 5});
CREATE (:Concept {name: "Routing Algorithms", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Algorithms for determining the best path between nodes", chapter: 5});
CREATE (:Concept {name: "Distance Vector Routing", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Routing algorithm where each node shares its routing table with neighbours", chapter: 5});
CREATE (:Concept {name: "Link State Routing", complexity_score: 7, competency_level: "intermediate", domain: "Computer Networks", description: "Routing algorithm where each node broadcasts link state to build a global map", chapter: 5});
CREATE (:Concept {name: "Congestion Control", complexity_score: 7, competency_level: "advanced", domain: "Computer Networks", description: "Mechanisms to prevent network overload", chapter: 5});
CREATE (:Concept {name: "ICMP", complexity_score: 4, competency_level: "intermediate", domain: "Computer Networks", description: "Internet Control Message Protocol for error reporting and diagnostics", chapter: 5});
CREATE (:Concept {name: "NAT", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Network Address Translation — maps private IPs to public IPs", chapter: 5});

// Chapter 6 — Transport Layer
CREATE (:Concept {name: "Transport Layer", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "End-to-end communication services for applications", chapter: 6});
CREATE (:Concept {name: "TCP", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Transmission Control Protocol — reliable, ordered, connection-oriented transport", chapter: 6});
CREATE (:Concept {name: "UDP", complexity_score: 4, competency_level: "beginner", domain: "Computer Networks", description: "User Datagram Protocol — fast, connectionless, unreliable transport", chapter: 6});
CREATE (:Concept {name: "Sockets", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Programming interface for network communication endpoints", chapter: 6});
CREATE (:Concept {name: "Socket Programming", complexity_score: 7, competency_level: "advanced", domain: "Computer Networks", description: "Implementing network applications using the socket API", chapter: 6});
CREATE (:Concept {name: "TCP Connection Establishment", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Three-way handshake process for establishing a TCP connection", chapter: 6});
CREATE (:Concept {name: "TCP Congestion Control", complexity_score: 8, competency_level: "advanced", domain: "Computer Networks", description: "TCP mechanisms like slow start and AIMD to manage network congestion", chapter: 6});

// Chapter 7 — Application Layer
CREATE (:Concept {name: "DNS", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Domain Name System — translates hostnames to IP addresses", chapter: 7});
CREATE (:Concept {name: "HTTP", complexity_score: 4, competency_level: "intermediate", domain: "Computer Networks", description: "HyperText Transfer Protocol for web communication", chapter: 7});
CREATE (:Concept {name: "HTTPS", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Secure HTTP using SSL/TLS encryption", chapter: 7});

// Chapter 8 — Network Security
CREATE (:Concept {name: "Cryptography", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Mathematical techniques for securing communications", chapter: 8});
CREATE (:Concept {name: "Symmetric Key Encryption", complexity_score: 6, competency_level: "intermediate", domain: "Computer Networks", description: "Encryption where same key is used for encryption and decryption", chapter: 8});
CREATE (:Concept {name: "Public Key Encryption", complexity_score: 7, competency_level: "advanced", domain: "Computer Networks", description: "Asymmetric encryption using public/private key pairs", chapter: 8});
CREATE (:Concept {name: "SSL/TLS", complexity_score: 7, competency_level: "advanced", domain: "Computer Networks", description: "Secure Sockets Layer/Transport Layer Security protocol for secure communication", chapter: 8});
CREATE (:Concept {name: "Firewalls", complexity_score: 5, competency_level: "intermediate", domain: "Computer Networks", description: "Network security systems that filter incoming and outgoing traffic", chapter: 8});

// -----------------------------------------------------------------------------
// STEP 3: Operating Systems — Concept nodes (Silberschatz Ch 1–17)
// -----------------------------------------------------------------------------

// Chapter 1–2 — Overview
CREATE (:Concept {name: "Operating System Overview", complexity_score: 2, competency_level: "beginner", domain: "Operating Systems", description: "Role of the OS as intermediary between hardware and user", chapter: 1});
CREATE (:Concept {name: "System Calls", complexity_score: 4, competency_level: "beginner", domain: "Operating Systems", description: "Interface between user programs and OS kernel services", chapter: 2});

// Chapter 3 — Processes
CREATE (:Concept {name: "Process Concept", complexity_score: 3, competency_level: "beginner", domain: "Operating Systems", description: "A program in execution — the fundamental unit of work in an OS", chapter: 3});
CREATE (:Concept {name: "Process Scheduling", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "Deciding which process gets the CPU and for how long", chapter: 3});
CREATE (:Concept {name: "Interprocess Communication", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Mechanisms for processes to communicate and synchronize", chapter: 3});
CREATE (:Concept {name: "Shared Memory", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "IPC where processes share a region of memory", chapter: 3});
CREATE (:Concept {name: "Message Passing", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "IPC where processes communicate by sending and receiving messages", chapter: 3});

// Chapter 4 — Threads
CREATE (:Concept {name: "Threads", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "Lightweight unit of execution within a process", chapter: 4});
CREATE (:Concept {name: "Concurrency", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Multiple computations happening simultaneously", chapter: 4});
CREATE (:Concept {name: "Multicore Programming", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Writing programs that exploit multiple CPU cores", chapter: 4});

// Chapter 5 — CPU Scheduling
CREATE (:Concept {name: "CPU Scheduling Algorithms", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Algorithms for allocating CPU time to processes", chapter: 5});
CREATE (:Concept {name: "Round Robin Scheduling", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "CPU scheduling where each process gets a fixed time quantum in rotation", chapter: 5});
CREATE (:Concept {name: "Priority Scheduling", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "CPU scheduling based on process priority values", chapter: 5});

// Chapter 6 — Synchronization
CREATE (:Concept {name: "Critical Section Problem", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Problem of ensuring mutual exclusion when multiple processes access shared data", chapter: 6});
CREATE (:Concept {name: "Mutex Locks", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "Mutual exclusion lock for protecting critical sections", chapter: 6});
CREATE (:Concept {name: "Semaphores", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Synchronization tool using integer variables and wait/signal operations", chapter: 6});
CREATE (:Concept {name: "Monitors", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "High-level synchronization construct with mutual exclusion built in", chapter: 6});

// Chapter 8 — Deadlocks
CREATE (:Concept {name: "Deadlock", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Situation where processes wait for each other indefinitely", chapter: 8});
CREATE (:Concept {name: "Deadlock Prevention", complexity_score: 7, competency_level: "intermediate", domain: "Operating Systems", description: "Ensuring at least one of the four deadlock conditions cannot hold", chapter: 8});
CREATE (:Concept {name: "Deadlock Avoidance", complexity_score: 8, competency_level: "advanced", domain: "Operating Systems", description: "Dynamically ensuring system never enters unsafe state — Bankers algorithm", chapter: 8});
CREATE (:Concept {name: "Deadlock Detection", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Algorithms to detect when deadlock has occurred", chapter: 8});

// Chapter 9 — Main Memory
CREATE (:Concept {name: "Main Memory Management", complexity_score: 5, competency_level: "intermediate", domain: "Operating Systems", description: "Techniques for allocating and managing physical memory", chapter: 9});
CREATE (:Concept {name: "Paging", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Memory management scheme dividing memory into fixed-size pages", chapter: 9});
CREATE (:Concept {name: "Page Table", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Data structure mapping virtual page numbers to physical frames", chapter: 9});

// Chapter 10 — Virtual Memory
CREATE (:Concept {name: "Virtual Memory", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Technique allowing execution of processes not fully in memory", chapter: 10});
CREATE (:Concept {name: "Demand Paging", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Loading pages into memory only when they are needed", chapter: 10});
CREATE (:Concept {name: "Page Replacement", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Algorithms for selecting which page to swap out when memory is full", chapter: 10});
CREATE (:Concept {name: "Thrashing", complexity_score: 8, competency_level: "advanced", domain: "Operating Systems", description: "Excessive paging causing severe performance degradation", chapter: 10});

// Chapter 13–14 — File Systems
CREATE (:Concept {name: "File System Interface", complexity_score: 4, competency_level: "intermediate", domain: "Operating Systems", description: "User-level view of files including naming, structure, and access", chapter: 13});
CREATE (:Concept {name: "File System Implementation", complexity_score: 7, competency_level: "advanced", domain: "Operating Systems", description: "Internal data structures and algorithms for storing files on disk", chapter: 14});

// Chapter 16–17 — Security and Protection
CREATE (:Concept {name: "OS Security", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Protecting system integrity against threats and unauthorized access", chapter: 16});
CREATE (:Concept {name: "Protection", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Mechanisms controlling access of processes and users to resources", chapter: 17});
CREATE (:Concept {name: "Access Control", complexity_score: 6, competency_level: "intermediate", domain: "Operating Systems", description: "Access matrix and role-based control for resource authorization", chapter: 17});
