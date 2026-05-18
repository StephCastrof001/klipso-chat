# Query: product manager built RAG chatbot platform case study architecture decisions

## 1. Building HR Policy Chatbot with RAG Architecture
**URL:** https://www.linkedin.com/posts/tarunkrgupta_aiproductmanagement-rag-llmevaluation-activity-7453803210634420224-qIti



---

## 2. I made 60K+ building RAG projects in 3 months. Here's ...
**URL:** https://www.reddit.com/r/Rag/comments/1m890yk/i_made_60k_building_rag_projects_in_3_months/



---

## 3. Building an Advanced RAG Chatbot with Multi-Modal Document Processing — Part 1: Problem Analysis and Solution Architecture | by Abhishek Tiwary | Medium
**URL:** https://medium.com/@abhishek.01.09/building-an-advanced-rag-chatbot-with-multi-modal-document-processing-part-1-problem-analysis-dffd06498d8a

[Sitemap](https://medium.com/sitemap/sitemap.xml)

[Open in app](https://play.google.com/store/apps/details?id=com.medium.reader&referrer=utm_source%3DmobileNavBar&source=post_page---top_nav_layout_nav-----------------------------------------)

Sign up

[Sign in](https://medium.com/m/signin?operation=login&redirect=https%3A%2F%2Fmedium.com%2F%40abhishek.01.09%2Fbuilding-an-advanced-rag-chatbot-with-multi-modal-document-processing-part-1-problem-analysis-dffd06498d8a&source=post_page---top_nav_layout_nav-----------------------global_nav------------------)

[Medium Logo](https://medium.com/?source=post_page---top_nav_layout_nav-----------------------------------------)

Get app

[Write](https://medium.com/m/signin?operation=register&redirect=https%3A%2F%2Fmedium.com%2Fnew-story&source=---top_nav_layout_nav-----------------------new_post_topnav------------------)

[Search](https://medium.com/search?source=post_page---top_nav_layout_nav-----------------------------------------)

Sign up

[Sign in](https://medium.com/m/signin?operation=login&redirect=https%3A%2F%2Fmedium.com%2F%40abhishek.01.09%2Fbuilding-an-advanced-rag-chatbot-with-multi-modal-document-processing-part-1-problem-analysis-dffd06498d8a&source=post_page---top_nav_layout_nav-----------------------global_nav------------------)

![Unknown user](https://miro.medium.com/v2/resize:fill:32:32/1*dmbNkD5D-u45r44go_cf0g.png)

# **Building an Advanced RAG Chatbot with Multi-Modal Document Processing — Part 1: Problem Analysis and Solution Architecture**

[![Abhishek Tiwary](https://miro.medium.com/v2/resize:fill:32:32/0*PWoM3wo9n4fTMzLB.jpg)](https://medium.com/@abhishek.01.09?source=post_page---byline--dffd06498d8a---------------------------------------)

[Abhishek Tiwary](https://medium.com/@abhishek.01.09?source=post_page---byline--dffd06498d8a---------------------------------------)

Follow

22 min read

·

Aug 13, 2025

5

[Listen](https://medium.com/m/signin?actionUrl=https%3A%2F%2Fmedium.com%2Fplans%3Fdimension%3Dpost_audio_button%26postId%3Ddffd06498d8a&operation=register&redirect=https%3A%2F%2Fmedium.com%2F%40abhishek.01.09%2Fbuilding-an-advanced-rag-chatbot-with-multi-modal-document-processing-part-1-problem-analysis-dffd06498d8a&source=---header_actions--dffd06498d8a---------------------post_audio_button------------------)

Share

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:700/1*GVELv1ltGy9DPFTP1HD_XA.png)

**_Figure - 1_**

## **Introduction**

In the rapidly evolving landscape of artificial intelligence, the ability to process and understand multi-modal documents — combining text, images, and tables — has become crucial for building intelligent systems. Traditional RAG (Retrieval-Augmented Generation) systems have long struggled with the complexity of real-world documents that contain rich visual and structural information alongside textual content.

This technical blog series explores the development of a sophisticated RAG chatbot that leverages the Model Context Protocol (MCP), AWS Bedrock, and advanced document processing techniques to create a truly intelligent document analysis system. In Part 1, we examine the fundamental challenges facing traditional RAG systems and present our comprehensive solution architecture that addresses these limitations through innovative technology integration.

### **Evolution from LangGraph to MCP Architecture**

Building upon our previous work with \[ [LangGraph and AWS Bedrock AgentCore](https://medium.com/@abhishek.01.09/building-an-enterprise-grade-agentic-rag-chatbot-with-langgraph-and-aws-bedrock-agentcore-69789499f56e)\] (where I developed an enterprise-grade agentic RAG chatbot with persistent memory and observability, this project represents a significant architectural evolution. While our previous implementation used LangGraph’s state-based workflow management with AgentCore for conversational memory, this new system adopts the Model Context Protocol (MCP) for more modular, scalable tool integration.

The key advancement lies in moving from a monolithic workflow approach to a distributed, tool-based architecture that enables:

- **Modular AI Tool Integration:** MCP’s standardized protocol allows seamless integration of specialized AI capabilities
- **Multi-Modal Document Understanding:** Advanced processing of text, images, and tables in complex documents
- **Intelligent Query Routing:** Automatic routing between local knowledge base and real-time web search
- **Scalable Architecture:** Server-client separation for better performance and maintainability

Our system goes beyond traditional text-based RAG implementations by incorporating AI-powered image analysis, intelligent table processing, and adaptive query routing. By utilizing cutting-edge technologies like unstructured.io for high-resolution document extraction and Claude-3 Sonnet for visual content analysis, we’ve created a system that can understand and reason about complex documents in ways previously impossible.

## **Problem Statement**

Imagine walking into a world-class research library, only to discover that all the books have been stripped of their diagrams, charts, and illustrations, leaving behind only plain text. The carefully designed layouts that help readers understand complex concepts have been flattened into linear streams of words. The visual elements that make technical manuals comprehensible, the charts that reveal data patterns, and the flowcharts that explain processes have all vanished. This is the reality that most organizations face when trying to extract knowledge from their document repositories using traditional RAG systems.

### **The Document Blindness Crisis**

Traditional RAG systems suffer from a fundamental form of “document blindness” — they can read words but cannot see meaning. When a financial analyst uploads an annual report filled with performance charts, market analysis graphs, and strategic diagrams, these systems extract only the surrounding text, completely ignoring the visual insights that often contain the most critical information. It’s like having a research assistant who can transcribe every word of a scientific paper but skips over all the experimental data visualizations, molecular diagrams, and statistical charts that actually prove the research findings.

This limitation becomes particularly devastating in technical fields where visual information is not supplementary but essential. Engineering documentation relies heavily on technical diagrams to explain component relationships and assembly procedures. Medical research papers use complex visualizations to demonstrate treatment efficacy and biological processes. Financial reports depend on charts and graphs to communicate performance trends and market analysis. When RAG systems ignore these visual elements, they’re essentially discarding the most valuable and informative parts of the documents.

### **The Integration Isolation Problem**

Even when systems attempt to handle different content types, they typically treat them as isolated islands of information rather than interconnected elements of a cohesive narrative. This approach is like having a team of specialists — a text reader, an image viewer, and a data analyst — who work in separate rooms and never communicate with each other. The text specialist might read about a “significant increase in performance metrics,” while the chart analyst sees the actual 40% improvement graph, but neither understands how their information relates to the other’s findings.

This isolation becomes particularly problematic in complex documents where understanding depends on the relationship between different content types. A technical manual might describe a procedure in text while showing the visual steps in accompanying diagrams and providing specification details in reference tables. Traditional systems process these elements separately, losing the critical connections that make the information actionable.

### **The Static Knowledge Trap**

Perhaps the most limiting aspect of traditional RAG systems is their static nature — they’re like libraries that never acquire new books and have no connection to the outside world. These systems can only answer questions about information that was available when they were last updated, leaving users stranded when they need current information or insights about recent developments.

This limitation creates a particularly frustrating user experience. Imagine asking a research assistant about “recent developments in renewable energy policy” only to receive information from six months ago, or inquiring about “current market trends” and getting outdated data that no longer reflects reality. Traditional RAG systems lack the intelligence to recognize when a query requires current information versus established knowledge, and they have no mechanism to automatically search external sources when their local knowledge is insufficient.

The routing problem extends beyond simple currency issues. These systems cannot distinguish between queries that require deep, domain-specific expertise (best served by carefully curated local knowledge) and questions that need broad, current information (better answered through web search). They treat all queries the same way, often providing irrelevant or outdated responses when users need timely, contextual information.

### **The Scale and Performance Bottleneck**

As organizations grow and their document repositories expand, traditional RAG systems begin to buckle under the weight of inefficient processing and poor architectural decisions. It’s like trying to manage a growing library with the same manual filing system that worked when you had a few dozen books — the approach that seemed adequate for small-scale operations becomes a significant bottleneck as complexity increases.

These systems typically lack intelligent caching mechanisms, meaning they repeatedly process the same documents without learning from previous work. Every time a user uploads a complex technical manual, the system starts from scratch, wasting computational resources and time. The performance issues become particularly acute when dealing with large, complex documents that contain multiple content types, often taking hours to process comprehensive reports with no way to resume if the process fails partway through.

## **The Challenges and Our Technology Solutions**

Building an advanced multi-modal RAG system is like constructing a sophisticated orchestra where each instrument must play in perfect harmony. The journey began with recognizing five fundamental challenges that traditional RAG systems face, and then carefully selecting technologies that could address each challenge while working seamlessly together.

### **Challenge 1: High-Quality Multi-Modal Extraction — Solved with unstructured.io and Advanced Document Processing**

The first challenge we encountered was extracting meaningful content from complex documents while preserving the intricate relationships between text, images, and tables. Traditional PDF parsers often treat documents as flat text streams, completely missing the rich visual and structural information that makes documents truly valuable. We needed a solution that could understand documents the way humans do — recognizing that a diagram explains the adjacent text, that tables contain structured data requiring special handling, and that the spatial layout of elements carries semantic meaning.

This led us to **\*\*unstructured.io\*\***, a revolutionary document processing library that treats documents as multi-modal entities rather than simple text containers. Unlike conventional parsers that strip away formatting and visual elements, unstructured.io’s “hi\_res” strategy employs advanced OCR and layout detection algorithms to preserve document structure and identify different content types automatically. In the real world, law firms use this technology to process thousands of legal documents during discovery, maintaining the critical relationships between evidence photos, witness statements, and legal precedents. Financial institutions leverage it to analyze annual reports where charts and tables are as important as the narrative text.

To complement unstructured.io’s capabilities, we integrated **\*\*pdfplumber\*\*** as our specialized table extraction engine. While unstructured.io excels at overall document understanding, pdfplumber brings surgical precision to tabular data extraction, maintaining cell relationships and table structure that are crucial for accurate data analysis. This dual approach ensures we capture every piece of valuable information, whether it’s embedded in complex layouts or structured in precise tables.

### **Challenge 2: AI-Powered Content Analysis — Addressed with Claude-3 Sonnet’s Vision Capabilities**

Once we could extract multi-modal content, the next challenge was understanding what it all meant. A technical diagram isn’t just pixels and lines — it represents processes, relationships, and knowledge that must be made searchable and understandable. Similarly, tables aren’t just rows and columns — they contain patterns, trends, and insights that traditional text-based systems completely miss.

This challenge led us to **Claude-3 Sonnet**, Anthropic’s most advanced vision-capable model. Sonnet doesn’t just see images — it understands them with remarkable sophistication. When analyzing a technical diagram, it identifies components, explains relationships, describes processes, and extracts key insights that make the visual content as searchable as text. Healthcare providers use Sonnet to analyze medical images and generate detailed reports, while engineering companies leverage it to interpret complex technical drawings and specifications.

### **Challenge 3: Intelligent Query Routing — Solved with Claude-3 Haiku and Hybrid Search Strategy**

The third challenge was perhaps the most architecturally significant: determining whether a user’s query should be answered from our local knowledge base or from real-time web search. Traditional RAG systems are static — they can only answer questions about their pre-indexed content, leaving users stranded when they need current information or topics outside the knowledge base.

We solved this with **Claude-3 Haiku**, a model optimized for speed and efficiency, perfect for the split-second routing decisions our system requires. Haiku analyzes each incoming query against a configurable knowledge base of topics, understanding not just keywords but intent and context. Customer support companies use Haiku for real-time chat routing, ensuring complex technical questions reach specialists while simple queries get immediate automated responses.

Our routing system is complemented by **Tavily API**, a search service designed specifically for AI applications. Unlike traditional search APIs that return raw web results, Tavily provides curated, high-quality information optimized for AI processing. News organizations use Tavily for real-time information aggregation, while financial firms leverage it for gathering current market intelligence.

### **Challenge 4: Scalable Architecture Design — Addressed with Model Context Protocol (MCP)**

The fourth challenge was architectural: how do you build a system that can handle multiple concurrent users while maintaining performance and enabling easy extension with new capabilities? Traditional monolithic approaches become bottlenecks as complexity grows, while microservices can become unwieldy without proper coordination.

Our solution was to adopt the **Model Context Protocol (MCP)**, an emerging standard that represents a paradigm shift in AI system architecture. MCP provides a standardized way to connect AI models with external tools and data sources, enabling true modularity and scalability. Large corporations are beginning to adopt MCP for standardizing their AI tool integration, recognizing that the future of AI systems lies in composable, interoperable components rather than monolithic applications.

We implemented our MCP server using **FastMCP**, a high-performance implementation optimized for enterprise-scale deployments. FastMCP supports Server-Sent Events (SSE) for real-time communication and includes comprehensive debugging capabilities that proved invaluable during development.

### **Challenge 5: Context Preservation and Performance — Solved with ChromaDB and AWS Bedrock**

The final challenge was maintaining semantic relationships between different content types while ensuring efficient storage, retrieval, and processing. Multi-modal documents create complex webs of relationships that must be preserved throughout the processing pipeline, and the system must perform these operations at scale without sacrificing speed or accuracy.

For vector storage and semantic search, we chose **ChromaDB**, a database designed specifically for AI applications. Unlike traditional databases adapted for vector operations, ChromaDB is built from the ground up for embedding storage and similarity search. E-commerce platforms use ChromaDB for product recommendations, while knowledge management systems leverage it for intelligent document discovery.

The intelligence behind our embeddings comes from **AWS Bedrock**, Amazon’s managed AI service that provides enterprise-grade access to foundation models. Bedrock eliminates the complexity of managing GPU clusters and model serving infrastructure while providing the security and compliance certifications required for enterprise deployment. Within Bedrock, we use **Titan Embeddings** to generate high-quality vector representations that understand not just keywords but meaning and context.

Tying everything together is **Streamlit**, our choice for the user interface layer. Streamlit’s Python-native approach means our entire stack uses a single programming language, eliminating context switching and integration complexity. Companies like Uber use Streamlit for internal analytics dashboards, proving its enterprise readiness while enabling rapid development cycles.

## **Technology Stack Deep Dive**

### **Model Context Protocol (MCP) — The Architectural Foundation**

At the heart of our system lies the Model Context Protocol, a revolutionary approach that fundamentally changes how AI applications are architected. Think of MCP as the conductor of our technological orchestra, ensuring that every component communicates seamlessly while maintaining the flexibility to evolve independently. Unlike traditional monolithic AI systems where capabilities are tightly coupled, MCP creates a standardized language that allows different AI tools to work together without losing their individual strengths.

Our MCP implementation transforms what could have been a complex, interdependent system into an elegant collection of specialized services. The protocol serves as more than just a communication layer; it’s the foundation that enables our system to scale horizontally, adapt to new requirements, and maintain reliability even as individual components are updated or replaced. This architectural choice reflects our understanding that the future of AI systems lies not in building larger monoliths, but in creating intelligent, composable ecosystems.

- **MCP Server: The Intelligent Tooling Ecosystem**

Our MCP server represents a paradigm shift from traditional API servers to an intelligent tooling ecosystem. Rather than hosting simple endpoints, our server orchestrates six sophisticated AI tools, each designed as a specialized expert in its domain. The AI-Enhanced PDF Extractor Tool exemplifies this approach, combining unstructured.io’s advanced parsing capabilities with Claude-3 Sonnet’s vision intelligence to transform static documents into rich, multi-modal content. This tool doesn’t just extract text; it understands document structure, preserves spatial relationships, and generates intelligent explanations of visual elements.

The AI-Enhanced DOCX Extractor Tool brings similar sophistication to Word documents, handling the complex challenge of embedded content analysis while maintaining the integrity of tables and images. These extractors work in harmony with our Route Question Tool, which implements a sophisticated decision-making process that analyzes query intent and context to determine the optimal information source. This routing intelligence represents a fundamental advancement over static RAG systems, enabling dynamic adaptation to user needs.

Our Generate Answer Tool and Grade Relevance Tool work as a quality assurance partnership, ensuring that responses are not only contextually appropriate but also grounded in reliable sources. The Web Search Tool completes this ecosystem by providing real-time access to current information, seamlessly integrating external knowledge with our local expertise. Together, these tools create a comprehensive AI capability that exceeds the sum of its parts.

- **MCP Client: The Orchestration Intelligence**

The MCP client serves as the intelligent conductor of our document processing symphony, managing complex workflows that span multiple specialized tools while maintaining system coherence and performance. This client represents sophisticated orchestration logic that coordinates document processing workflows based on file type complexity, content characteristics, and processing requirements. Rather than following rigid pipelines, the client adapts its approach based on real-time analysis of document structure and user needs.

The client’s query processing pipeline implements adaptive routing with comprehensive fallback mechanisms, ensuring users receive relevant information regardless of query complexity or data source availability. This intelligence extends to vector store management, where the client handles the intricate process of document chunking, embedding generation, and similarity search operations while maintaining semantic relationships across different content types.

Perhaps most importantly, the client implements robust error handling and recovery strategies that ensure system resilience. When individual tools encounter issues, the client gracefully degrades functionality while maintaining core capabilities, ensuring users always receive meaningful responses even when optimal processing isn’t possible. The MCP architecture’s modularity means each tool can be independently developed, tested, and deployed, while the server-client separation enables horizontal scaling and load distribution that traditional monolithic systems cannot achieve.

### **AWS Bedrock — The Enterprise AI Foundation**

AWS Bedrock serves as our enterprise-grade AI foundation, providing the computational intelligence that powers our multi-modal understanding capabilities. Bedrock represents more than just model access; it’s a comprehensive AI infrastructure that eliminates the complexity of managing GPU clusters, model serving, and scaling challenges while providing the security and compliance certifications essential for enterprise deployment.

Within this managed environment, Claude-3 Haiku emerges as our speed specialist, optimized for the split-second routing decisions that keep our system responsive. Haiku’s efficiency makes it perfect for high-frequency operations like query classification and initial response generation, where speed and cost-effectiveness are paramount. Its consistent output formatting and reliable JSON responses ensure our routing logic remains robust and predictable.

Claude-3 Sonnet represents the analytical powerhouse of our system, bringing sophisticated vision capabilities and complex reasoning to bear on multi-modal content. Sonnet’s ability to understand technical diagrams, analyze complex tables, and generate comprehensive explanations transforms static visual content into searchable, understandable knowledge. This model’s technical accuracy and detailed analysis capabilities make it indispensable for processing the complex documents our users depend on.

Titan Embeddings completes our Bedrock integration by generating high-quality vector representations that capture semantic meaning beyond simple keyword matching. These embeddings understand context, domain-specific terminology, and conceptual relationships, enabling our similarity search to find relevant content even when queries use different terminology than the source documents.

### **unstructured.io — The Document Understanding Engine**

unstructured.io represents a fundamental breakthrough in document processing technology, moving beyond traditional text extraction to true document understanding. The library’s “hi\_res” strategy employs advanced OCR and layout detection algorithms that preserve the spatial relationships and structural elements that give documents their meaning. This approach recognizes that documents are more than collections of words; they’re carefully structured information artifacts where layout, formatting, and visual elements carry semantic significance.

## Get Abhishek Tiwary’s stories in your inbox

Join Medium for free to get updates from this writer.

Subscribe

Subscribe

Remember me for faster sign in

The library’s element classification capabilities automatically identify and categorize different content types within documents, distinguishing between headers, body text, tables, images, and other structural elements. This classification enables our system to apply appropriate processing strategies to each content type, ensuring that tables receive tabular analysis, images get visual interpretation, and text maintains its contextual relationships. In our implementation, unstructured.io serves as the primary engine for PDF document parsing and content extraction, handling the complex challenge of maintaining document fidelity while enabling downstream AI processing.

### **ChromaDB — The Semantic Memory System**

ChromaDB represents our choice for semantic memory, designed from the ground up for AI applications rather than adapted from traditional database architectures. This vector database understands the unique requirements of embedding storage and similarity search, providing optimized performance for high-dimensional vector operations that form the backbone of semantic search.

The database’s AI-native design means it handles the complexities of vector similarity calculations, metadata filtering, and persistent storage with the efficiency that modern AI applications demand. ChromaDB’s Python integration provides a seamless development experience that aligns with our technology stack, while its simple setup and management reduce operational complexity compared to traditional database solutions. In our system, ChromaDB stores the vector representations of all processed document chunks, creating a semantic index that enables intelligent content retrieval based on meaning rather than keyword matching.

### **Streamlit — The Rapid Development Interface**

Streamlit serves as our user interface foundation, chosen for its unique ability to create sophisticated web applications using pure Python. This framework eliminates the traditional complexity of web development, allowing us to focus on AI functionality rather than frontend intricacies. Streamlit’s component-based architecture provides pre-built widgets for file uploads, chat interfaces, and real-time data visualization that align perfectly with our multi-modal document processing requirements.

The framework’s real-time update capabilities ensure that users see immediate feedback as documents are processed and queries are answered, creating an engaging experience that keeps users informed about system status. Streamlit’s session state management handles the complexities of maintaining user context across interactions, while its caching mechanisms optimize performance for repeated operations. The framework’s Python-native approach means our entire technology stack uses a single programming language, eliminating context switching and reducing integration complexity.

## **High-Level Architecture Block Diagram**

Press enter or click to view image in full size

![](https://miro.medium.com/v2/resize:fit:700/1*xnnaL9t20v2oAJ3nZdqKAw.png)

## **Solution Approach**

Our solution approach can be likened to building a world-class research library combined with a team of expert librarians, translators, and research assistants. Just as a modern library doesn’t simply store books but creates an intelligent ecosystem for knowledge discovery, our system transforms static documents into a living, searchable knowledge base that understands context, meaning, and user intent.

### **1\. Advanced Document Processing Pipeline — The Master Archivist’s Workshop**

Imagine a master archivist who doesn’t just file documents but truly understands their content, structure, and hidden meanings. Our document processing pipeline operates like this expert archivist’s workshop, where every document undergoes a meticulous transformation process that preserves not just the words, but the relationships, visual elements, and contextual significance that make information truly valuable.

The pipeline begins with unstructured.io’s “hi\_res” strategy, which functions like having a team of expert document analysts who understand that a technical manual isn’t just text on pages, but a carefully orchestrated combination of instructions, diagrams, and data tables that must work together. This approach recognizes that when an engineer reads a maintenance manual, they need to see how the text instructions relate to the accompanying diagrams and reference the relevant specification tables.

Our automatic image extraction and indexing system works like a specialized photography department in our archival workshop. Every visual element is carefully catalogued, numbered, and prepared for analysis, ensuring that no diagram, chart, or illustration is lost in the digitization process. This systematic approach means that when a user later searches for information about a specific process, they’ll find not just the textual description but also the visual representations that make the concept clear.

The intelligent caching system operates like an institutional memory that learns from each processing session. Just as an experienced librarian remembers which books have been processed and can quickly direct researchers to the right resources, our caching system ensures that once a document has been analyzed and enhanced with AI insights, that valuable work is preserved and instantly available for future queries.

### **2\. AI-Powered Content Analysis — The Expert Translation Service**

Our AI-powered content analysis functions like having a team of world-class translators who don’t just convert languages, but translate complex visual and tabular information into clear, searchable narratives. Claude-3 Sonnet serves as our master translator, capable of looking at a technical diagram and explaining not just what it shows, but what it means, how it works, and why it matters.

When Sonnet analyzes an image, it’s like having an expert in the relevant field examine the visual content and provide a comprehensive explanation that captures both the obvious and subtle details. A flowchart becomes a step-by-step process explanation, a technical diagram transforms into a detailed component analysis, and a data visualization evolves into insights about trends and relationships. This translation process makes visual information as searchable and useful as traditional text.

The table processing capability works similarly to having a data analyst who can look at any spreadsheet or table and immediately understand its purpose, identify key patterns, and explain the relationships between different data points. Rather than leaving users to interpret raw tabular data, our system provides natural language explanations that highlight the most important insights and make complex data accessible to anyone.

### **3\. Intelligent Query Routing — The Expert Reference Librarian System**

Our intelligent query routing system operates like having the world’s most knowledgeable reference librarian who instantly knows whether your question is best answered from the library’s specialized collection or requires current information from external sources. This system represents a fundamental advancement over traditional approaches, creating a dynamic decision-making process that adapts to each user’s specific information needs.

The automatic query analysis functions like an expert librarian who can listen to your question and immediately understand not just what you’re asking, but what type of information you really need. When someone asks about “the latest developments in AI regulation,” the system recognizes this requires current information and routes to web search. When they ask about “machine learning fundamentals,” it understands this is best served by our curated knowledge base of technical documentation.

Our hybrid information retrieval strategy works like having access to both a specialized research library and a team of current affairs researchers. The primary vectorstore search acts as our specialized collection, where domain experts have carefully curated and organized the most valuable resources. When this collection doesn’t contain relevant information, our intelligent fallback system automatically connects to real-time web search, ensuring users always receive comprehensive answers regardless of whether the information exists in our local collection.

### **4\. Scalable MCP Architecture — The Modular Expert Network**

Our MCP architecture functions like creating a network of specialized expert consultants who can work independently yet collaborate seamlessly when needed. Rather than building a monolithic system where all capabilities are interdependent, we’ve created a modular ecosystem where each component excels in its specific domain while contributing to the overall intelligence of the system.

The modular tool-based design works like having a consulting firm where each expert can be engaged independently for their specific expertise, yet they all follow the same professional standards and communication protocols. This means we can enhance, update, or scale individual capabilities without disrupting the entire system, much like how a consulting firm can add new specialists or upgrade existing expertise without reorganizing the entire organization.

Our async processing approach functions like having a team of experts who can work on multiple projects simultaneously without blocking each other’s progress. When one specialist is analyzing a complex document, others can continue handling different queries, ensuring that system performance remains optimal even under heavy load. The comprehensive error handling works like having experienced project managers who can adapt to unexpected challenges while keeping projects on track, ensuring users always receive meaningful responses even when optimal processing isn’t possible.

## **Extension to Industrial Use Cases**

Our advanced RAG system represents more than just a technological achievement; it’s a transformative solution that addresses real-world challenges across diverse industries. Like a master key that opens doors to previously inaccessible information, our multi-modal document processing capabilities unlock the hidden value in complex documents that have long frustrated organizations seeking to leverage their knowledge assets.

**Healthcare & Medical Research — Advancing Patient Care Through Intelligent Document Analysis**

In the healthcare sector, our system functions like having a team of medical librarians and research analysts who never sleep, continuously processing and understanding the vast corpus of medical knowledge. Medical literature analysis becomes dramatically more powerful when our system can simultaneously understand research text, interpret complex medical diagrams, analyze statistical tables, and extract insights from medical imaging reports. Imagine a researcher investigating a rare disease who can instantly access not just textual descriptions but also visual representations of symptoms, treatment protocols shown in flowcharts, and statistical outcomes presented in complex tables.

Clinical documentation processing transforms how healthcare providers manage patient information. Our system can analyze patient records that combine textual notes with diagnostic images, lab result tables, and treatment timelines, creating comprehensive patient profiles that support better clinical decision-making. In drug discovery, pharmaceutical researchers can leverage our system to analyze research documents that integrate molecular diagrams, clinical trial data visualizations, and complex statistical analyses, accelerating the path from research to treatment.

### **Financial Services — Transforming Risk Assessment and Regulatory Compliance**

The financial services industry operates in a world where visual data representation is as critical as textual analysis. Our system serves as an intelligent financial analyst who can simultaneously read annual reports, interpret performance charts, analyze risk matrices, and understand complex financial tables. When processing regulatory filings, the system doesn’t just extract text but understands the relationships between narrative explanations and supporting financial visualizations, creating comprehensive insights that support better investment decisions and risk assessment.

Compliance documentation becomes manageable when our system can process regulatory documents that combine procedural text with compliance flowcharts, requirement matrices, and organizational diagrams. Financial institutions can finally leverage their vast repositories of complex documents, transforming static compliance materials into dynamic, searchable knowledge bases that support real-time decision-making and regulatory reporting.

### **Manufacturing & Engineering — Revolutionizing Technical Knowledge Management**

Manufacturing and engineering organizations possess some of the most complex multi-modal documents in any industry. Our system functions like having a master engineer who can instantly understand technical manuals that combine detailed specifications, assembly diagrams, and procedural instructions. Quality control processes are enhanced when inspection reports that include measurement data, compliance tables, and visual documentation can be processed as integrated knowledge rather than separate information silos.

Product development accelerates when R&D documents containing prototype images, test result visualizations, and design specifications can be analyzed holistically. Engineers can query complex technical knowledge bases using natural language and receive comprehensive answers that draw from textual descriptions, technical diagrams, and specification tables, dramatically reducing the time required to access critical technical information.

### **Legal & Compliance — Streamlining Complex Legal Analysis**

The legal profession has long struggled with documents that combine complex textual clauses with organizational charts, procedural flowcharts, and detailed requirement matrices. Our system serves as an intelligent legal research assistant who can analyze contracts that integrate textual terms with visual representations of organizational structures and process flows. Patent research becomes more efficient when applications containing technical diagrams, detailed specifications, and complex claims can be processed as unified documents rather than fragmented information sources.

### **Education & Research — Enhancing Academic Knowledge Discovery**

Academic institutions possess vast repositories of research materials that combine textual analysis with complex figures, data tables, and experimental visualizations. Our system functions like having a research librarian who can instantly understand and connect information across diverse academic materials. Research papers that integrate theoretical discussions with experimental diagrams and statistical analyses can be processed as comprehensive knowledge sources rather than fragmented information.

### **Government & Public Sector — Improving Public Service Through Intelligent Document Processing**

Government organizations manage some of the most complex and diverse document collections in any sector. Our system serves as an intelligent policy analyst who can process government documents that combine statistical data with organizational charts and procedural diagrams. Public records management becomes more efficient when documents containing forms, tables, and administrative diagrams can be processed as integrated information systems rather than separate data sources.

## **Conclusion**

In Part 1 of this technical blog series, we have explored the fundamental challenges that traditional RAG systems face when dealing with real-world, multi-modal documents and presented our comprehensive solution architecture that addresses these limitations through innovative technology integration.

### **Key Insights from Part 1**

1\. **Problem Identification**: Traditional RAG systems suffer from “document blindness,” treating complex multi-modal documents as simple text streams and losing critical visual and structural information that often contains the most valuable insights.

2\. **Technology Integration**: Our solution combines cutting-edge technologies including the Model Context Protocol (MCP), AWS Bedrock’s foundation models, unstructured.io’s advanced document processing, and intelligent query routing to create a truly comprehensive document understanding system.

3\. **Architectural Innovation**: The adoption of MCP represents a paradigm shift from monolithic to modular AI system architecture, enabling scalability, maintainability, and independent component evolution.

4\. **Industrial Applicability**: The solution addresses real-world challenges across diverse industries, from healthcare and finance to manufacturing and government, demonstrating broad practical value.

### **Looking Ahead to Part 2**

In Part 2 of this series, we will dive deep into the technical implementation details, exploring the system design, code architecture, and detailed explanations of how each component works together to create this sophisticated multi-modal RAG system. We’ll examine the actual code implementations, design patterns, and technical decisions that bring this solution to life.

The journey from identifying problems to implementing solutions represents the essence of innovative engineering — understanding not just what needs to be built, but why it matters and how it can transform the way organizations interact with their knowledge assets.

## **References**

1\. **Model Context Protocol (MCP)**: [https://modelcontextprotocol.io/](https://modelcontextprotocol.io/)

2\. **AWS Bedrock Documentation**: [https://docs.aws.amazon.com/bedrock/](https://docs.aws.amazon.com/bedrock/)

3\. **Anthropic Claude Models**: [https://www.anthropic.com/claude](https://www.anthropic.com/claude)

4\. **unstructured.io Documentation**: [https://unstructured-io.github.io/unstructured/](https://unstructured-io.github.io/unstructured/)

5\. **LangChain Framework**: [https://python.langchain.com/](https://python.langchain.com/)

6\. **ChromaDB Vector Database**: [https://docs.trychroma.com/](https://docs.trychroma.com/)

7\. **Streamlit Documentation**: [https://docs.streamlit.io/](https://docs.streamlit.io/)

8\. **Tavily Search API**: [https://tavily.com/](https://tavily.com/)

9\. **FastMCP Implementation**: [https://github.com/jlowin/fastmcp](https://github.com/jlowin/fastmcp)

10\. **RAG Best Practices**: [https://arxiv.org/abs/2312.10997](https://arxiv.org/abs/2312.10997)

_\*This is Part 1 of a comprehensive technical blog series on building advanced RAG systems with multi-modal document processing capabilities. Part 2 will focus on the detailed technical implementation, system design, and code architecture that brings this solution to life.\*_

[Agentic Rag](https://medium.com/tag/agentic-rag?source=post_page-----dffd06498d8a---------------------------------------)

[Bedrock](https://medium.com/tag/bedrock?source=post_page-----dffd06498d8a---------------------------------------)

[Mcp Protocol](https://medium.com/tag/mcp-protocol?source=post_page-----dffd06498d8a---------------------------------------)

[Unstructured](https://medium.com/tag/unstructured?source=post_page-----dffd06498d8a---------------------------------------)

[Data Extraction](https://medium.com/tag/data-extraction?source=post_page-----dffd06498d8a---------------------------------------)

[![Abhishek Tiwary](https://miro.medium.com/v2/resize:fill:48:48/0*PWoM3wo9n4fTMzLB.jpg)](https://medium.com/@abhishek.01.09?source=post_page---post_author_info--dffd06498d8a---------------------------------------)

[![Abhishek Tiwary](https://miro.medium.com/v2/resize:fill:64:64/0*PWoM3wo9n4fTMzLB.jpg)](https://medium.com/@abhishek.01.09?source=post_page---post_author_info--dffd06498d8a---------------------------------------)

Follow

[**Written by Abhishek Tiwary**](https://medium.com/@abhishek.01.09?source=post_page---post_author_info--dffd06498d8a---------------------------------------)

[8 followers](https://medium.com/@abhishek.01.09/followers?source=post_page---post_author_info--dffd06498d8a---------------------------------------)

· [2 following](https://medium.com/@abhishek.01.09/following?source=post_page---post_author_info--dffd06498d8a---------------------------------------)

Senior Solution Architect, Amazon Web Services

Follow

[Help](https://help.medium.com/hc/en-us?source=post_page-----dffd06498d8a---------------------------------------)

[Status](https://status.medium.com/?source=post_page-----dffd06498d8a---------------------------------------)

[About](https://medium.com/about?autoplay=1&source=post_page-----dffd06498d8a---------------------------------------)

[Careers](https://medium.com/jobs-at-medium/work-at-medium-959d1a85284e?source=post_page-----dffd06498d8a---------------------------------------)

[Press](mailto:pressinquiries@medium.com)

[Blog](https://blog.medium.com/?source=post_page-----dffd06498d8a---------------------------------------)

[Privacy](https://policy.medium.com/medium-privacy-policy-f03bf92035c9?source=post_page-----dffd06498d8a---------------------------------------)

[Rules](https://policy.medium.com/medium-rules-30e5502c4eb4?source=post_page-----dffd06498d8a---------------------------------------)

[Terms](https://policy.medium.com/medium-terms-of-service-9db0094a1e0f?source=post_page-----dffd06498d8a---------------------------------------)

[Text to speech](https://speechify.com/medium?source=post_page-----dffd06498d8a---------------------------------------)

reCAPTCHA

Recaptcha requires verification.

protected by **reCAPTCHA**

---

## 4. RAG for Product Managers: Your Competitive Weapon
**URL:** https://productschool.com/blog/artificial-intelligence/rag-product-managers

# RAG for Product Managers: Your Competitive Weapon

![Carlos headshot](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F4ZoV5NIycuAmDdRkqLufWJ%2F421859a77b958b656cb9289ea046ce24%2FCarlos_headshot.jpeg%3Ff%3Dface%26fm%3Dwebp&w=3840&q=100)

[Carlos Gonzalez de Villaumbrosia](https://productschool.com/product-leaders/carlos-gonzalez-de-villaumbrosia "Carlos Gonzalez de Villaumbrosia ")

CEO at Product School

November 09, 2025 \- 21 min read

[![Share on LinkedIn](https://productschool.com/_next/static/media/linkedin.3724f130.svg)](http://www.linkedin.com/sharing/share-offsite/?url=%2Fblog%2Fartificial-intelligence%2Frag-product-managers&title=RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon&source=%2Fblog%2Fartificial-intelligence%2Frag-product-managers)[![Share on Twitter](https://productschool.com/_next/static/media/twitter.eb1d8abb.svg)](http://twitter.com/intent/tweet?text=Check%20out%20this%20content%20from%20Product%20School:%20RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon&url=%2Fblog%2Fartificial-intelligence%2Frag-product-managers&via=productschool)[![Share on Facebook](https://productschool.com/_next/static/media/facebook.66dbd2ad.svg)](http://www.facebook.com/share.php?u=%2Fblog%2Fartificial-intelligence%2Frag-product-managers&title=RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon)
![Share](https://productschool.com/_next/static/media/share.27c704b2.svg)

Nearly 80% of a product manager’s time is spent searching for and preparing data rather than using it to make decisions (1).

That’s a problem RAG (Retrieval Augmented Generation) promises to solve. Instead of relying on static reports or half-baked dashboards, RAG pulls live data from trusted sources and feeds it directly into AI models.

The result? Answers rooted in real context, not just generic algorithmically determined text. For [AI product managers](https://productschool.com/blog/artificial-intelligence/guide-ai-product-manager "AI product managers"), that shift could mean faster strategy, sharper insights, and fewer blind spots.

### AI PRD Template

Plan, strategize, and align stakeholders around the key requirements unique to AI products.

Your Email

Get the template

By sharing your email, you agree to our [Privacy Policy](https://productschool.com/privacy "Privacy Policy") and [Terms of Service](https://productschool.com/terms "Terms of Service")

![AI PRD Illustration](https://images.ctfassets.net/6nwv0fapso8r/5nKzVorluws0nHkY6BKQYZ/339b266f54c32d8ae1b5cf0094e0dd2e/AI_PRD_Illustration.svg)

## What Is Retrieval-Augmented Generation (RAG)?

Retrieval-Augmented Generation (RAG) is an approach that pairs a generative AI model (like an LLM) with an external knowledge source to produce more relevant, factual, and context-specific outputs.

In simpler terms, RAG lets the AI model “open a book” or query a database _at the moment of answering a question_ so that its response includes real information beyond what it learned during training. This means the AI isn’t limited to its stale training data. It can pull in fresh, authoritative data from your company’s knowledge base, [PRD documents](https://productschool.com/blog/product-strategy/product-template-requirements-document-prd "PRD documents"), or even the web, before it generates an answer.

Contrast this with a vanilla LLM usage. A normal LLM generates answers only from its internal parameters (its pre-trained knowledge). With RAG, we insert a retrieval step in the middle of the process, so the model has additional context to work with.

As Boston Consulting Group explains (2), RAG

> works by giving a GenAI model access to trusted content, often in unstructured formats such as internal documents or knowledge bases, at the moment it’s asked a question. This real-time retrieval helps ensure that the response is accurate, current, and grounded in the information an organization controls.

In essence, RAG is a way to optimize an LLM’s output by referencing a reliable external knowledge source, without needing to retrain the model.

Crucially for [product managers](https://productschool.com/blog/career-development/what-does-product-manager-do "product managers"), RAG offers a shortcut to customizing AI for your domain. Rather than spending weeks or months fine-tuning a model on your proprietary data (which is costly and needs constant re-training), RAG allows you to _inject that data at query time_.

It delivers many benefits of a custom-trained model but with far less expense and latency. Your AI features can provide highly specific outputs without extensive fine-tuning, essentially giving you some advantages of a bespoke model in a fraction of the time.

## RAG Is How Product Managers Make an AI a bit Smarter

Imagine you’ve just launched an AI-powered chatbot in your product. A customer asks about a brand-new feature, but the chatbot responds with a generic or outdated answer. Frustrating, right?

The bot sounds confident, but it’s missing the mark. It doesn’t _know_ your latest product updates or internal data. As a [technical product manager](https://productschool.com/blog/career-development/technical-product-manager-role "technical product manager"), you might wonder: Can’t our AI be smarter about our own knowledge?

This is where _Retrieval-Augmented Generation_, or RAG, shoulders itself into an equation.

Every AI product manager building AI features today encounters the limitations of large language models (LLMs). These models are trained on vast data, but they’re essentially “frozen” after training. They don’t automatically know anything beyond their training data’s cutoff date.

They also tend to hallucinate. They make up answers when unsure, often with unwarranted confidence. One AWS expert quipped that you can think of an LLM as

> an over-enthusiastic new employee who refuses to stay informed with current events but will always answer every question with absolute confidence.

That’s not the behavior we want in our products. RAG is emerging as a solution to these challenges. It’s a technique that gives AI access to up-to-date, relevant knowledge on the fly so that the AI’s responses are grounded in real information. It’s part of every AI product manager’s role to know and get used to RAG.

![AI Product Manager Skills](https://images.ctfassets.net/6nwv0fapso8r/6FVpToa4hIizLOnfwHUXrt/3f5caf4bdabc6386db486779918cad9f/Critical_AI_Product_Manager_Skills.svg)

In this guide, we’ll dive deep into what RAG is, how it works, and why it matters for you as a [product leader](https://productschool.com/blog/leadership/product-leadership "product leader"). We’ll explore real use cases, walk through the benefits and challenges, and examine the future opportunities RAG unlocks.

By the end, you should have a clear understanding of RAG and practical insight into how it can enhance your [AI product strategy](https://productschool.com/blog/artificial-intelligence/ai-product-strategy "AI product strategy") (and even help achieve those key objectives, or [OKRs](https://productschool.com/blog/product-strategy/product-okrs "OKRs"), you’re aiming for).

## How RAG Works

Understanding how RAG works under the hood helps you talk with engineers and make better product calls.

At a high level, RAG has two phases: (1) ingesting and indexing knowledge, and (2) retrieving relevant information at query time to augment the model’s generation. Let’s break it down in plain language.

### 1\. Ingestion (building the knowledge library)

First, the system gathers and prepares the external knowledge your [AI tool](https://productschool.com/blog/artificial-intelligence/ai-tools-for-product-managers "AI tool") will use. This can be FAQs, help center articles, technical docs, user manuals, support tickets, or database records. Models can’t search raw text efficiently, so the data gets processed into an index.

A common approach is to split documents into chunks and convert them into numerical vectors (embeddings) that capture semantic meaning. Think of it like stocking a library and building a smart catalog. Each piece of information sits on a “shelf” with a detailed index so it can be found fast.

This index often lives in a vector database optimized for similarity search. By the end of ingestion, your RAG system has a searchable knowledge store (the “shelves” are stocked and cataloged).

### 2\. Retrieval and augmentation (query-time search and synthesis)

When a user or another part of your app asks a question, say, “How do I integrate our product with Salesforce?” — the system searches the indexed knowledge base before the model answers.

The search is usually semantic: the query is turned into a vector and matched against stored vectors to find the most relevant text chunks.

In the librarian analogy, it’s like scanning the catalog and pulling the few pages most likely to contain the answer. If an employee asks, “How much annual leave do I have?”, the system might retrieve the HR leave policy and that employee’s remaining balance.

These retrieved snippets are then added to the LLM’s prompt. In practice, you prepend or append the excerpts as context. This step (often called prompt augmentation) lets the model see the user’s question plus the reference text it should rely on.

### 3\. Generation (producing the answer)

With the query and retrieved context in hand, the LLM generates its answer. Because it now has the right facts at its fingertips, the response can be specific, accurate, and up to date. It’s drawing not only on general knowledge but also on the exact details from your knowledge base.

The output can include citations or references to source documents, much like a [user research](https://productschool.com/blog/user-experience/product-management-skills-user-research "user research") report. For example, an answer about Salesforce integration might say, “According to our documentation, you can set it up by doing X, Y, Z,” with those steps pulled from a help center article behind the scenes.

To make this concrete, consider a real-world example. Intercom Fin, an AI support bot, uses RAG to deliver accurate help.

If a customer asks, “How do I set up the Salesforce integration?”, Fin searches the company docs for the setup steps and may also check the customer’s account details (like plan level) to tailor the answer. It then feeds that context to an LLM, which writes a helpful, personalized reply. It uses the exact instructions from the docs.

### Piecing it all together

From a product architecture perspective, implementing RAG means piecing together a few components: a data ingestion pipeline (to build and update the knowledge store), a vector search system or other retriever, and the LLM. Emerging [AI agent](https://productschool.com/blog/artificial-intelligence/ai-agents-product-managers "AI agent ") frameworks (like [LangChain](https://www.langchain.com/ "LangChain") or [LlamaIndex](https://www.llamaindex.ai/ "LlamaIndex")) help orchestrate these steps, so your team doesn’t have to reinvent the pipeline.

The heavy lift is usually retrieval. It ensures your AI can efficiently search thousands of [product documents](https://productschool.com/blog/skills/product-managers-documentation "product documents") or records for the right nuggets. Once in place, you have an AI that “consults the expert materials” before answering. For [AI product managers](https://productschool.com/blog/artificial-intelligence/guide-ai-product-manager "AI product managers"), that means your AI features can finally speak with the authority and accuracy of your best internal resources.

## Why RAG Matters for Product Managers

If you’re a [product manager venturing into AI](https://productschool.com/blog/artificial-intelligence/guide-ai-product-manager "product manager venturing into AI"), you might ask: _Is RAG just a technical detail, or does it impact my product outcomes?_ In reality, RAG can make the difference between an AI feature that delights users versus one that frustrates them.

Here’s why a solid grasp of RAG is becoming a must-have for [product leadership](https://productschool.com/blog/product-fundamentals/what-is-product-leadership "product leadership"):

- **Keeps answers accurate and current** RAG prevents AI from giving outdated or fabricated responses by grounding answers in real, up-to-date information. This helps maintain user trust and directly supports goals like higher customer satisfaction and stronger engagement.

- **Leverages proprietary knowledge** Out-of-the-box AI models don’t know your product, your policies, or your customers. RAG lets you inject that data at query time without retraining, which means you can deliver personalized, context-aware features faster and at lower cost.

- **Reduces hallucinations and boosts reliability** When an AI invents answers, users lose confidence. RAG reduces hallucinations by tethering the model to real data and often enables source citations, which makes responses more transparent and easier for users to trust.

- **Speeds up iteration and adaptability** Instead of retraining a model every time your product updates, you can refresh the knowledge base and instantly update what the AI knows. This agility lets product teams adapt features to new markets, policies, or releases with minimal delay.

- **Provides more control and governance** Because you decide which sources the AI can access, you can enforce scope, accuracy, and compliance. RAG-based systems are easier to align with security policies and reduce risks of the AI going off-script with sensitive topics.


In short, RAG matters because it aligns AI capabilities with business reality. It makes AI features _actually useful_ in context, which is the whole point. Whether your [product goal](https://productschool.com/blog/product-strategy/product-goal "product goal") is to cut customer support load by 20%, drive up [user retention](https://productschool.com/blog/product-strategy/user-retention "user retention") with a killer smart assistant, or provide your sales team with instant intel, RAG is likely to be a part of the solution.

![Generative AI Basics for B2B PMs | former Google Group PM - YouTube thumbnail](https://img.youtube.com/vi_webp/VHZr8_VVjEw/hqdefault.webp)Watch

## Real-World Use Cases for RAG

RAG might sound abstract until you see it in action. In fact, many [AI-powered tools](https://productschool.com/blog/artificial-intelligence/ai-tools-for-product-managers "AI-powered tools") you encounter are already using retrieval techniques under the hood. Let’s explore some real-world use cases and examples that illustrate how RAG can be applied in product settings:

### Customer support chatbots and knowledge base assistants

One of the most popular applications of RAG is in customer support.

Traditional chatbots often failed to satisfy users because they either provided generic answers or required extensive if-then scripting for each possible question. With RAG, support bots can actually understand a user’s question and fetch the right answer from a knowledge base or documentation automatically.

[Intercom’s Fin](https://fin.ai/ "Intercom’s Fin") (as mentioned earlier) is a great example. Instead of pre-programming every Q&A, Fin uses RAG to search company docs and even check account data on the fly, then the LLM crafts a response using those details.

This means when a customer asks something specific like _“How do I reset my password?”_ or _“What’s included in the Premium plan?”_, the bot is giving an answer sourced from the latest help article or the user’s account info.

Businesses have reported that these RAG-powered assistants significantly improve resolution rates and customer satisfaction because responses are accurate and personalized.

Beyond text chatbots, the same concept powers in-app help features or voice assistants. For instance, imagine a voice assistant in a SaaS product that can answer, “What does this error code mean?” by pulling up the relevant support doc paragraph in real time. Or a knowledge base search bar that accepts natural language (“How do I integrate with Spotify?”) and gives a direct answer rather than a list of articles.

These are RAG at work. By sourcing [product documentation](https://productschool.com/blog/skills/product-managers-documentation "product documentation") and even a user’s history, RAG-enabled support tools generate contextually rich, helpful answers. This use case is often a quick win for product teams: you likely already have a trove of support content and user data; RAG simply leverages it more intelligently.

### Enterprise knowledge search and internal tools

In large [product-led organizations](https://productschool.com/blog/product-strategy/product-led-organization "product-led organizations") or [agile organizations](https://productschool.com/blog/leadership/agile-organization "agile organizations"), employees spend a huge amount of time looking for information. They scan company policies, project documents, past decisions, you name it.

RAG is being used to build internal enterprise search and assistant tools that make this vastly more efficient. For example, [Glean](https://www.glean.com/ "Glean") (a workplace search product) uses RAG techniques to let employees query across all their company’s data sources in natural language.

If someone asks, _“What’s our return-to-office policy?”_, Glean will:

- Search through connected sources like HR documents, emails, Slack threads, etc.

- Find the relevant snippets from perhaps an HR policy PDF and a company-wide announcement email, and

- Feed those to an LLM that synthesizes a clear, concise answer.


The employee not only gets the answer (“The policy is X”), but often with citations or links to the original documents for verification. This is a textbook RAG flow. It demonstrates how powerful it is in knowledge management.

[Product managers](https://productschool.com/blog/career-development/what-does-product-manager-do "Product managers") working on internal tools or B2B SaaS can harness RAG in similar ways. Think of any scenario where users need to search or analyze heterogeneous data.

An AI assistant for sales teams could pull in the latest CRM data, recent call transcripts, and product specs to answer a question like “What are the top pain points mentioned by health industry clients last quarter?” The RAG system might retrieve notes from Salesforce and support tickets tagged with “healthcare” and generate a summary of common issues.

In essence, RAG can break down data silos by aggregating information from across sources and presenting exactly what the user needs. Companies have applied this to things like [user onboarding](https://productschool.com/blog/product-strategy/user-onboarding "user onboarding") assistants (answering new employees’ questions by searching internal wikis), or IT helpdesk agents (troubleshooting by retrieving relevant dev docs, past incident reports, etc.).

The key outcome is faster access to institutional knowledge, which boosts productivity and decision-making quality across the board.

### Personalized content generation and recommendations

Another exciting use case is leveraging RAG for generating content that is tailored to a specific context or user.

One example is in sales and marketing tools. [Amplemarket](https://www.amplemarket.com/ "Amplemarket"), for instance, provides AI-generated sales emails. When a salesperson wants to reach out to a new lead, Amplemarket uses RAG to pull in details about the lead’s industry, the product’s value props, relevant case studies, etc. Then the AI writes a personalized outreach email using that information.

If the prospect is a healthcare company, the system might retrieve a snippet about the product’s HIPAA compliance and weave that into the email for relevance. The salesperson ends up with a draft email that feels hand-written for that prospect. That’s something that would be nearly impossible with a generic model that doesn’t have access to those specifics.

Similarly, RAG can enhance recommendation engines and dynamic content in products. A media app could use RAG to generate on-the-fly article summaries or recommendations by retrieving a user’s past reading history and the latest articles.

Or consider e-commerce: an AI assistant could answer complex product questions ( _“Does this laptop support external 4K monitors at 60Hz?”_) by searching through product manuals and Q&A forums. That’s much more helpful than a generic “I’m not sure” that a typical bot might respond with.

Even creative tools are using RAG. For example, an AI writing assistant can fetch relevant facts or quotes from a knowledge base as you write, ensuring the content is accurate and enriched with real data. All these cases boil down to using retrieval to ground the generative AI’s output in _whatever context matters at that moment_, be it the user’s profile, the latest news, or a specific knowledge domain.

### Product research and decision support for teams

This use case flips the script. It’s less about AI features _in_ your product and more about AI assisting the [product team](https://productschool.com/blog/leadership/product-teams-core-platform-growth-first "product team") itself. [Technical product managers](https://productschool.com/blog/career-development/technical-product-manager-role "Technical product managers") and [product analysts](https://productschool.com/blog/career-development/product-analyst "product analysts") spend a lot of time researching market trends, user feedback, competitor updates, etc.

RAG systems can serve as a kind of smart [user research](https://productschool.com/blog/user-experience/product-management-skills-user-research "user research") assistant to speed up these tasks.

For example, you could query an internal RAG-powered tool with: _“Summarize the top feature requests from our enterprise customers in the past month”_. The system might retrieve all relevant customer feedback from sources like support tickets, survey responses, sales call transcripts, and then the LLM summarizes the common themes for you.

This can surface insights that inform your [outcome-based roadmap](https://productschool.com/blog/product-strategy/outcome-based-roadmap "outcome-based roadmap") in a fraction of the time it would take to manually sift through data. In fact, [product managers](https://productschool.com/blog/career-development/what-does-product-manager-do "product managers") can reference customer feedback and user behavior data via RAG to help decide on future developments. Instead of relying on intuition or a few anecdotes, you have the AI aggregating _all_ the data and giving you evidence-based suggestions.

[Market research](https://productschool.com/blog/skills/product-management-skills-market-research "Market research") and [product analysis](https://productschool.com/blog/product-fundamentals/product-analysis "product analysis") is another domain: a PM could ask, _“What new features did Competitor X launch recently and how were they received?”_, and a RAG agent could scrape recent news, press releases, and perhaps social media sentiment to produce a concise report.

An analyst could use RAG for financial and market research by pulling in up-to-date figures from the web or internal databases, going beyond the training cutoff of their base model.

Essentially, RAG lets the AI tap into live information sources (social media feeds, news sites, real-time databases) which means your AI can keep you informed about _current_ developments, not just historical data.

This is incredibly useful in fast-moving industries. Teams are already experimenting with using RAG-based agents in competitive intelligence, where the AI periodically checks various info sources and alerts the team with a summary. Just imagine an [AI product strategy](https://productschool.com/blog/artificial-intelligence/ai-product-strategy "AI product strategy") assistant that briefs you every morning with “Things that happened in our market ecosystem in the last 24 hours.”

## Challenges of Implementing RAG

> You have to be able to get to the data that will go into that AI prompt, and that’s a major challenge for many large companies.

— [Glen Coates](https://productschool.com/product-leaders/glen-coates "Glen Coates"), VP of Product at Shopify, on [The Product Podcast](https://productschool.com/resources/product-podcast/Glen-coates-Ai-first-products "The Product Podcast")

Therefore, before you rush to sprinkle RAG over every feature, it’s important to understand the challenges and pitfalls. Like any technology, RAG comes with trade-offs and implementation considerations that [AI product managers](https://productschool.com/blog/artificial-intelligence/guide-ai-product-manager "AI product managers") should weigh:

- **Data quality and trustworthiness** RAG only works as well as the data it pulls from. Outdated or inaccurate sources will produce incorrect outputs. A process for curating and updating the knowledge base is critical.

- **Complexity of integration** Ingesting and indexing unstructured data is resource-heavy. Structured data may be easier, but it requires API connectors that add engineering effort. Covering too many sources quickly becomes unmanageable.

- **Chunking strategy** The way data is chunked directly affects retrieval accuracy. Chunks that are too large risk irrelevant context; too small, and key meaning gets lost. Choosing the right chunking method—semantic, recursive, or hybrid—is essential for high-quality retrieval and grounding.

- **Ambiguity in queries** User questions can be vague, and retrieval may miss or misinterpret intent. Hybrid search and classifiers help, but [product teams](https://productschool.com/blog/leadership/product-teams-core-platform-growth-first "product teams") need to set clear limits and fail gracefully when no solid answer exists.

- **Latency and performance** Every retrieval and generation step adds time. Large indexes, multiple data sources, or overly complex prompts can slow response times. Optimizing for latency (through caching, vector pruning, or query batching) is key to a usable [product experience](https://productschool.com/blog/user-experience/product-experience "product experience").

- **Maintaining context** Retrieving too little text risks losing nuance; too much can overwhelm the model. Balancing context length and ensuring consistency across follow-ups is an ongoing design challenge.

- **Bias and privacy risks** RAG can surface biased data or expose sensitive information if not carefully scoped. Knowledge stores need encryption, strict access controls, and proper permission handling to protect user data.

- **Licensing and IP concerns** If retrieval includes third-party content, copyright and fair use issues arise. Teams should favor proprietary or licensed data, attribute sources where possible, and involve legal early.

- **Evaluation and monitoring** Evaluating RAG performance is complex because correctness depends on both retrieval and generation. Teams should define clear evaluation criteria (precision, recall, factuality, and helpfulness) and conduct regular audits. For deeper guidance, see our [AI Evals](https://productschool.com/blog/artificial-intelligence/ai-evals-product-managers "AI Evals") guide on how to measure and improve RAG system quality.


Despite these challenges, many teams find that the benefits of RAG far outweigh the difficulties, especially as tools and best practices rapidly improve.

The key is going in with eyes open: plan for these hurdles, iterate gradually, and keep user impact in focus. By addressing challenges like data quality, system performance, and security up front, you set your [AI product strategy](https://productschool.com/blog/artificial-intelligence/ai-product-strategy "AI product strategy") (and your team) up for success rather than unpleasant surprises.

## Opportunities and Future of RAG

RAG is a relatively new approach in the AI toolkit, and it’s evolving quickly. For forward-looking product managers, there are exciting opportunities on the horizon that could make RAG even more powerful and easier to implement. Here are some trends and future directions to keep an eye on:

- **Standardization and off-the-shelf solutions** RAG is moving toward common patterns and turnkey tools. Open-source libraries and managed services will make integration easier, faster, and less resource-heavy.

- [Agentic AI and autonomous agents](https://productschool.com/blog/artificial-intelligence/ai-agents-product-managers "Agentic AI and autonomous agents") RAG will underpin AI systems that not only answer questions but also act, reason, and chain tasks. This opens the door to product features like AI project managers or sales assistants that proactively gather and apply information.

- **LLMs optimized for RAG** Models are emerging that are fine-tuned for retrieval+generation workflows. These deliver faster, more accurate answers with citations, and may reduce costs compared to large, general-purpose models.

- **Multimodal and advanced retrieval** Future RAG won’t just work with text. It will pull from images, videos, charts, and complex data formats. Better retrieval algorithms will also make answers more accurate and context-aware.

- **Integration into AI product strategy** Users will expect every product to have a knowledgeable AI companion. RAG makes that possible by grounding assistants in app-specific data and user context, directly impacting [user retention](https://productschool.com/blog/product-strategy/user-retention "user retention"), engagement, and [product adoption](https://productschool.com/blog/product-strategy/product-adoption "product adoption").


### Advanced AI Agents Certification

Design and implement adaptive, multi-agent AI systems with memory, collaboration, and risk safeguards. Deploy production-ready AI agents at scale.

[Enroll now](https://productschool.com/certifications/advanced-ai-agents "Enroll now")

![advanced ai agents badge](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F1d1zwZc8wkBmIbEuGewfjP%2Fc7e0878cd14225ea0662f6db297c0914%2Fadvanced_ai_agents.png&w=3840&q=85)

RAG addresses fundamental needs in how AI systems handle information, and thus is likely to become a standard part of the AI development stack.

Just as no web app today is built without considering search or database queries, no AI feature in a few years will be built without considering retrieval augmentation for grounding.

The positive news is that each month, it’s getting easier to implement and more capable. We expect to see more “plug-and-play” RAG services, more intelligent agents using RAG, and a continued blurring of lines between retrieving information and taking actions.

For product managers, staying updated on these trends will help you time your moves: when to push for that new AI assistant feature, when to upgrade your tech stack, and how to articulate the value to stakeholders.

## Which AI Is Best for Product Management?

Here’s a down-to-earth breakdown of the [top AI tools and platforms for product managers](https://productschool.com/blog/artificial-intelligence/ai-tools-for-product-managers "top AI tools and platforms for product managers") and how they can actually help in your day-to-day.

- [ChatGPT](https://chatgpt.com/ "ChatGPT")– The Conversation-Starting AIA versatile generative assistant that helps PMs brainstorm ideas, structure data, outline launch plans, and draft content efficiently.

- [Google Gemini](https://gemini.google.com/ "Google Gemini")– Your Conversational AI ChatbotA powerful chatbot capable of providing industry insights, generating various types of content, and offering multilingual support.

- [Chatbot Prompting Template](https://productschool.com/resources/templates/ai-prompt "Chatbot Prompting Template") – A free template from Product School that helps PMs craft precise prompts for tools like ChatGPT or Gemini—boosting the quality of the results.

- [AI User Flow Template](https://productschool.com/resources/templates/ai-user-flow "AI User Flow Template") – Another free template guiding you through building intuitive, trustworthy AI user flows—from entry point to output.

- [AI Product Requirements Document (PRD) Template](https://productschool.com/resources/templates/ai-prd "AI Product Requirements Document (PRD) Template") – A free, structured PRD template tailored for AI features. It guides you through LLM-specific considerations such as risk, data, prompting, and testing.

- [Missive](https://missiveapp.com/ "Missive ")– Streamlined Communication for Product Teams. A team inbox platform that unifies emails, SMS, and social media, with AI-powered features for summarizing messages and automating responses.


If you want to explore more options beyond these six, you can check out the [full list of AI tools for product managers](https://productschool.com/blog/artificial-intelligence/ai-tools-for-product-managers "full list of AI tools for product managers"). It covers a wider range of solutions designed to support everything from ideation and roadmapping to customer insights and team collaboration.

## Retrieval-Augmented AI Products

Retrieval-Augmented Generation is the technique that can lift your product’s intelligence from generic to genuinely useful. Instead of letting models guess, RAG grounds them in your data so answers stay accurate, current, and context-aware.

Understanding RAG means you can shape AI features that align with your [product strategy](https://productschool.com/blog/product-strategy/product-strategy "product strategy"), collaborate better with engineers, and challenge vague AI roadmaps by asking the right question: _where does the knowledge come from?_ It turns information you already own into a competitive advantage.

Yes, it comes with challenges but those are solvable with the same discipline you already apply to building great products. Start small, learn fast, and expand. Over time, RAG can power not just support bots but also research assistants, [product-led onboarding flows](https://productschool.com/blog/product-strategy/product-led-onboarding "product-led onboarding flows"), and personalized recommendations across your product ecosystem.

### Level up on your AI knowledge

Based on insights from top Product Leaders from companies like Google, Grammarly, and Shopify, this guide ensures seamless AI adoption for sustainable growth.

[Download Guide](https://productschool.com/resources/enterprise/ai-guide "Download Guide")

![AI guide thumbnail](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F4KEO2Rl1I0h8vpPUwTfWlC%2F57a294ed3bb77563afe85f48557a19b3%2Fai_guide_thumbnail.png&w=3840&q=85)

* * *

(1):  https://blogs.idc.com/2018/08/23/time-crunch-equalizing-time-spent-on-data-management-vs-analytics/

(2): https://www.bcg.com/capabilities/artificial-intelligence/retrieval-augmented-generation

(3): https://aws.amazon.com/what-is/retrieval-augmented-generation

Updated: October 27, 2025

## Enjoyed the article? You might like this too

[![Thumbnail: How to Excel as an AI Product Manager](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F79d1peDfoNgmuNBOjSv2X9%2F8f6c3f17cfeb34ff1b8057e3149f9484%2FAI_PM_-_s.png&w=3840&q=85)\\
\\
![Product School Logo](https://productschool.com/_next/static/media/ps-logo-sm.97710223.svg)\\
\\
Artificial Intelligence\\
\\
**Tree of Thoughts Prompting: A PM’s Practical Guide**\\
\\
Are you an AI product manager or want to become one? This guide cuts through the noise and shows where the PM role is really heading with AI.](https://productschool.com/blog/artificial-intelligence/tree-of-thoughts-prompting) [![Agentic Architecture How Modern AI Systems Actually Work](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F5N09TBLDgaBmw6L5MTMUw3%2F0fc477d0e91016cfba2989224590a870%2FAgentic_Architecture__How_Modern_AI_Systems_Actually_Work.png&w=3840&q=85)\\
\\
![Product School Logo](https://productschool.com/_next/static/media/ps-logo-sm.97710223.svg)\\
\\
Artificial Intelligence\\
\\
**Agentic Architecture: How Modern AI Systems Actually Work**\\
\\
Agentic architecture explained for AI product managers: what it is and how it differs from orchestration in modern multi-agent AI systems.](https://productschool.com/blog/artificial-intelligence/agentic-architecture) [![Prototyping Prompts to Ship Better MVPs in Days](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F343vMuaAYtwCmX9W9rRw7A%2Fa4d043e68020edf5cd3098bd781aefac%2FPrototyping_Prompts_to_Ship_Better_MVPs_in_Days.png&w=3840&q=85)\\
\\
![Product School Logo](https://productschool.com/_next/static/media/ps-logo-sm.97710223.svg)\\
\\
Artificial Intelligence\\
\\
**Prototyping Prompts to Ship Better MVPs in Days**\\
\\
Steal these prototyping prompts for tools like Bolt and Lovable to generate UI, flows, mock data, and scenario tests fast. Built for AI product managers.](https://productschool.com/blog/artificial-intelligence/prototyping-prompts) [![AI Agent Orchestration Patterns for Reliable Products](https://productschool.com/_next/image?url=https%3A%2F%2Fimages.ctfassets.net%2F6nwv0fapso8r%2F6frHTI9W1kB9WSwnf1Hm8R%2F7960c3bfd7e40f3395e2e7827e83a0d3%2FAI_Agent_Orchestration_Patterns_for_Reliable_Products.png&w=3840&q=85)\\
\\
![Product School Logo](https://productschool.com/_next/static/media/ps-logo-sm.97710223.svg)\\
\\
Artificial Intelligence\\
\\
**AI Agent Orchestration Patterns for Reliable Products**\\
\\
Learn AI agent orchestration patterns used in production, how they impact performance, safety, latency, and cost, and how to choose the right one.](https://productschool.com/blog/artificial-intelligence/ai-agent-orchestration-patterns)

Subscribe to The Product Blog

## Discover where Product is heading next

Share this post

[![Share this Product School's content on your LinkedIn page](https://productschool.com/_next/static/media/linkedin_dark.1443ee2e.svg)](http://www.linkedin.com/sharing/share-offsite/?url=%2Fblog%2Fartificial-intelligence%2Frag-product-managers&title=RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon&source=%2Fblog%2Fartificial-intelligence%2Frag-product-managers) [![Share this Product School's content on Twitter](https://productschool.com/_next/static/media/twitter_dark.d08b48ff.svg)](http://twitter.com/intent/tweet?text=Check%20out%20this%20%23prodmgmt%20article%20on%20%40productschool%20blog%3A%20RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon&url=%2Fblog%2Fartificial-intelligence%2Frag-product-managers) [![Share this Product School's content on your Facebook page](https://productschool.com/_next/static/media/facebook_dark.14b1492f.svg)](http://www.facebook.com/share.php?u=%2Fblog%2Fartificial-intelligence%2Frag-product-managers&title=RAG%20for%20Product%20Managers%3A%20Your%20Competitive%20Weapon)

Your Email

Subscribe

By sharing your email, you agree to our [Privacy Policy](https://productschool.com/privacy "Privacy Policy") and [Terms of Service](https://productschool.com/terms "Terms of Service")

---

## 5. How We Built a GraphRAG Chatbot for Enterprise Intelligence - RUBICON
**URL:** https://www.rubicon-world.com/cases/graphrag-neo4j-enterprise-chatbot

[![](data:image/svg+xml,<svg display="block" role="presentation" viewBox="0 0 173 48" xmlns="http://www.w3.org/2000/svg"><path d="M 35.136 48 L 27.016 41.632 L 35.136 35.28 Z M 34.944 34.656 L 26.504 41.248 L 18.063 34.656 L 26.504 28.048 Z M 26.008 27.664 L 17.871 34.016 L 17.871 21.296 Z M 59.588 15.984 C 62.482 15.984 64.834 17.993 64.834 20.906 C 64.834 23.145 63.42 24.84 61.43 25.482 L 65.755 31.836 L 65.755 31.968 L 63.288 31.968 L 59.061 25.762 L 53.421 25.762 L 53.421 31.984 L 51.135 31.984 L 51.135 15.984 Z M 72.55 25.38 C 72.55 28.495 74.528 29.826 77.3 29.826 C 80.072 29.826 82.001 28.495 82.001 25.38 L 82.001 15.984 L 84.255 15.984 L 84.255 25.38 C 84.255 30.118 80.915 31.984 77.268 31.984 C 73.636 31.984 70.296 30.102 70.296 25.38 L 70.296 15.984 L 72.55 15.984 Z M 98.117 15.984 C 100.86 15.984 102.651 17.908 102.651 20.342 C 102.651 21.937 101.895 23.088 100.762 23.729 C 102.47 24.19 103.802 25.539 103.802 27.66 C 103.802 30.291 101.764 31.984 99.267 31.984 L 89.656 31.984 L 89.656 15.984 Z M 111.302 31.984 L 109.017 31.984 L 109.017 15.984 L 111.302 15.984 Z M 124.673 15.984 C 127.982 15.984 130.443 17.681 131.562 19.921 L 129.676 21.009 C 128.924 19.281 127.118 18.112 124.753 18.112 C 121.109 18.112 118.934 20.737 118.934 23.984 C 118.934 27.232 121.172 29.856 124.816 29.856 C 127.23 29.856 129.037 28.705 129.788 26.961 L 131.674 28.049 C 130.571 30.288 128.093 31.984 124.753 31.984 C 119.894 31.984 116.696 28.464 116.696 23.984 C 116.697 19.489 119.83 15.985 124.673 15.984 Z M 144.433 15.984 C 149.276 15.984 152.649 19.569 152.649 23.984 C 152.649 28.4 149.276 31.984 144.433 31.984 C 139.589 31.984 136.216 28.4 136.216 23.984 C 136.216 19.569 139.589 15.985 144.433 15.984 Z M 170.448 28.313 L 170.448 15.984 L 172.734 15.984 L 172.734 31.984 L 170.679 31.984 L 160.63 19.688 L 160.63 31.984 L 158.344 31.984 L 158.344 15.984 L 160.399 15.984 Z M 144.433 18.112 C 140.772 18.113 138.439 20.689 138.438 23.984 C 138.438 27.28 140.772 29.856 144.433 29.856 C 148.093 29.856 150.427 27.264 150.427 23.984 C 150.427 20.689 148.093 18.112 144.433 18.112 Z M 91.939 29.765 L 99.168 29.765 C 100.581 29.765 101.518 28.811 101.518 27.396 C 101.517 25.966 100.581 24.996 99.168 24.996 L 91.939 24.996 Z M 34.944 20.672 L 26.504 27.264 L 18.063 20.672 L 26.504 14.064 Z M 53.421 23.605 L 59.489 23.605 C 61.183 23.605 62.548 22.585 62.548 20.89 C 62.548 19.194 61.183 18.174 59.489 18.174 L 53.421 18.174 Z M 91.939 22.907 L 98.035 22.907 C 99.448 22.907 100.384 21.954 100.384 20.523 C 100.384 19.11 99.448 18.172 98.035 18.172 L 91.939 18.172 Z M 8.137 13.68 L 0 20.032 L 0 7.312 Z M 35.136 20.032 L 27.016 13.68 L 35.136 7.312 Z M 17.072 6.688 L 8.632 13.28 L 0.191 6.688 L 8.632 0.08 Z M 34.944 6.688 L 26.504 13.28 L 18.063 6.688 L 26.504 0.08 Z M 17.568 6.288 L 9.527 0 L 25.625 0 Z" fill="rgb(9, 9, 56)" height="48.00000014038086px" id="xQ5vVHKqO" width="172.73399414062501px"/></svg>)](https://www.rubicon-world.com/)

Solutions

Industries

[Our work](https://www.rubicon-world.com/cases)

[About us](https://www.rubicon-world.com/about)

[CONTACT US](https://www.rubicon-world.com/contact)

GraphRAG chatbot

## How We Built a GraphRAG Chatbot for Enterprise Intelligence

How RUBICON's Two Layer Fixed Entity Architecture eliminated data bottlenecks for a multi team enterprise, delivering a conversational AI system that gives leadership instant project clarity, without hallucinations.

![Case study image showcase](https://framerusercontent.com/images/VTqAfEskRllARcMPtQSMTGuYqCA.png?lossless=1&width=2096&height=2096)

#### Overview

Leadership at a growing enterprise was losing hours every week to a single problem: before any meaningful team check in could happen, a manager had to manually hunt through meeting notes, chat logs, and status documents just to build enough context to ask the right questions. Critical information lived in dozens of unstructured sources like Slack threads, meeting transcripts, and internal wikis, and nobody had a unified view of what was actually happening across projects.

We were brought in to eliminate that bottleneck entirely.

The standard playbook for this kind of problem is vector search: embed your documents, run similarity queries, feed results to an LLM. But when we mapped out the actual questions leadership needed to answer, things like _"Who owns the at risk deliverables this sprint?"_ or _"What did the infrastructure team commit to last Thursday?"_, we realized flat vector search couldn't reliably traverse the **relationships** between people, projects, and timelines. The answers required multi hop reasoning across structured organizational data.

So we built **Chief Bot**: an enterprise AI chatbot powered by a **Neo4j knowledge graph** and a **Graph based RAG (Retrieval Augmented Generation)** architecture. The key design decision, and the one this article focuses on, was adopting a **Two Layer Fixed Entity Architecture** instead of standard LLM driven entity extraction. This choice eliminated the hallucination and entity duplication problems that plague most GraphRAG implementations, while keeping costs an order of magnitude lower.

The result is a conversational interface where leadership asks natural language questions and gets precise, cited answers grounded in verified organizational data. In seconds, not hours.

#### Why "Two Layer Fixed Entity Architecture" Is Our Hero

Before settling on our final architecture, we piloted the project using standard automated LLM graph builders, tools like Neo4j's LLM Knowledge Graph Builder that scan unstructured sources and auto generate entities. These tools offer rapid graph generation, but the results were unsuitable for executive level decision making. The LLM frequently hallucinated nonexistent organizational roles, created duplicate nodes for the same person, and produced cluttered databases that made reliable information retrieval impossible.

We needed a different approach. Here's where we landed and why.

### How Standard GraphRAG Falls Short

In a typical GraphRAG pipeline, you use an LLM to extract entities and relationships from every document. This sounds elegant, but in practice it creates three compounding problems:

Massive token costs.Every document gets processed through an LLM for entity extraction, relationship classification, and deduplication. For a midsize organization, this can cost thousands of dollars per ingestion cycle.

Entity duplication and drift.The LLM might extract "Sarah Chen," "S. Chen," and "Sarah (Infrastructure Lead)" as three separate nodes. Multiply this across hundreds of documents and your graph becomes unreliable.

No ground truth.If the LLM fabricates a relationship, say linking the wrong person to a project, there's no structural safeguard to catch it. The error propagates into every future query.

### Our Two Layer Solution

By switching to a two layer approach, we established a "Ground Truth" that ensures 100% accuracy in core organizational relationships:

Layer 1, The Fixed Entity Layer (FEL1):Instead of letting an AI guess the company structure, we manually created a verified "skeleton" of known entities (Persons, Roles, Projects, Departments) from structured, authoritative sources. This is the deterministic backbone of the graph. No LLM touches this layer.

Layer 2, The Document Layer (DL2):Unstructured text chunks like meeting transcripts, status reports, and chat logs are attached to this fixed skeleton via cosine similarity mapping. Every piece of raw data gets a precise "home" in the graph, linked to the correct verified entity.

The critical constraint here is that every document chunk must attach to an existing Fixed Entity node. There are no orphan chunks floating in the graph. If a meeting transcript mentions "Sarah's infrastructure update," it gets linked to the verified \`Sarah > Infrastructure Department > Project Atlas\` path, not to an LLM hallucinated "Sarah Infrastructure" entity.

### Eliminating Hallucinations and Graph Bloat

This two layer framework effectively eliminates graph bloat, which is the accumulation of redundant entities and noisy data that typically degrades LLM performance over time. Because the LLM is restricted to querying a pre-validated, fixed schema, it cannot hallucinate nonexistent connections or get lost in duplicate nodes. When a leader asks a complex question, the answer is grounded in a verified organizational relationship, not a probabilistic guess.

Comparison: Standard GraphRAG vs. Our Two Layer Fixed Entity Architecture

![](https://framerusercontent.com/images/36Pe4TrRUZayRJxWeHYNBxhAY.png)

#### Challenges

### Business Challenges

Balancing High Precision with Low Operational Costs.Standard GraphRAG methods can be prohibitively expensive due to high LLM token usage during graph construction, leading to both high costs and unreliable entity duplication. We needed to deliver a high precision tool without spending a fortune on LLM driven entity extraction, and that's the direct motivation behind adopting the Two Layer Fixed Entity Architecture.

Transitioning from Search to Reasoning.Moving beyond standard vector search meant demonstrating to stakeholders, with concrete examples, that a graph based approach would provide structurally accurate answers to relational questions that flat document search simply cannot handle.

Securing Executive Alignment through Transparency.To gain C level trust, we couldn't treat the AI as a "black box." Leadership needed to see _how_ the system arrived at its answers, which led us to build a Developer Transparency Mode that exposes the Cypher logic behind every response.

### Technical Challenges

Structured Extraction from Unstructured Data.The primary hurdle was extracting structured relationships from a single, large unstructured document into a dual layer graph consisting of Fixed Entities and Document Chunks, without introducing errors at the extraction stage.

Entity Duplication and Resolution.To avoid the cluttered and uncontrollable databases common in LLM generated graphs, we enforced a strict fixed ontology, ensuring every document chunk mapped precisely to the correct verified node.

Natural Language to Cypher Translation.The LLM needed to accurately translate conversational questions into valid Neo4j Cypher queries without hallucinating nonexistent node types or relationships. We constrained this by providing the exact graph schema as context at query time.

Multi Hop Query Performance.As relationship depth increased, we had to optimize query performance to make sure that traversing multiple graph hops (person to project to department to related documents) didn't introduce unacceptable latency.

Scalability Without Schema Redesign.The PoC needed to be architected so that scaling from a single document to hundreds of sources wouldn't require ripping out the data model.

#### Solutions

We engineered Chief Bot to serve as a single source of truth for the company's complex project portfolio. By shifting from a static reporting model to an interactive, Graph based RAG architecture, we enabled stakeholders to extract real time insights from both structured and unstructured data through a conversational interface.

### Data Engineering & Integrity

The core of the solution is a multilayered data ingestion framework built around the Two Layer Fixed Entity Architecture described above:

The Deterministic Core (FEL1). We performed a manual, high precision extraction of foundational project data from the client's primary documents. This "Ground Truth" layer populates the Neo4j knowledge graph, ensuring that primary relationships between projects, leads, and timelines are 100% accurate and verifiable.

The Contextual Layer (DL2, Modular Processing). We developed a suite of specialized functions to process fluid data sources like meeting transcripts, progress reports, and status updates. These modules perform text chunking, vector embedding generation, and cosine similarity mapping to link new information to existing Fixed Entity nodes. The modular architecture is designed for full automation in future phases, while currently supporting manual verification before data is committed to the knowledge base.

### AI Reasoning & Transparent Interface

The system functions as a Natural Language-to-Graph Query engine. We integrated a leading Large Language Model (LLM) via a secure API to interpret free-form user questions, transform them into precise database queries, and return human-like responses. The solution preserves conversation history, allowing users to ask follow-up questions and drill down into specific project details without losing the thread of the discussion.

To bridge the gap between complex AI logic and stakeholder trust, we implemented Explainable AI (XAI) through a dedicated Developer Transparency Mode. This module exposes the system’s underlying “thought process”, providing real-time visibility into the active context state, the transformed database query, and the raw data results. By demystifying the model's reasoning, we transformed the chatbot from a “black box” into a verifiable, high-integrity decision-support tool.

#### Results

The Chief Bot proof of concept successfully transitioned the company from static data storage to active leadership intelligence. Here's what it delivered:

Leadership prep time dropped from hours to seconds.A manager can now ask _"Who is handling the most at risk deliverables this sprint?"_ and get a precise, cited answer without opening a single document. The graph traverses from project nodes to lead nodes to document chunks, assembling the context that previously required manual synthesis across multiple data sources.

Zero entity duplication across the entire knowledge graph.Because the organizational backbone was predefined and verified in the Fixed Entity Layer, the system maintained a clean, consistent graph. This eliminates the accuracy degradation that typically plagues GraphRAG systems as more documents are ingested over time.

Deep drill down through multi turn conversations without context loss.The system preserves full conversation history, so users can move from broad queries to specific follow ups to lateral pivots, all without reestablishing context. This replaced the old workflow of switching between apps, files, and chat threads just to piece together a complete picture.

A validated, scalable path from PoC to production.The Fixed Entity Layer provides a stable structural backbone that doesn't change with every new document ingestion. New unstructured data attaches to existing verified nodes, so the system can scale from dozens to thousands of documents without schema redesign or accuracy degradation.

This sets the stage for a larger vision: a future where every internal document, Slack thread, and project brief isn't just noise, but a searchable, strategic asset that helps leadership lead with total clarity.

## Lessons

No architecture is without tradeoffs. Here's what we'd share with anyone evaluating a similar approach:

Fixed entities trade flexibility for reliability.If a new department or project lead appears, someone has to manually add them to the Fixed Entity Layer before the system can reference them. For a fast moving startup, this could be a bottleneck. For an enterprise with established org charts, it's actually a feature since the system stays aligned with official structure by design.

Natural language to Cypher is fragile at the edges.Straightforward questions ("Who leads Project Atlas?") translate reliably. Ambiguous or compound questions ("Compare the velocity of all teams that had leadership changes last quarter") sometimes produce incorrect Cypher. We mitigated this with schema constraints and few shot prompting, but it remains the area with the most room for improvement.

We deliberately limited the PoC data scope.We ingested one primary document to validate the architecture. The modular ingestion pipeline is designed for automated multi source ingestion (Slack, Jira, Google Docs), but that integration is Phase 2 work. We chose to prove the reasoning layer first before scaling the data layer.

Any AI system is only as good as the data it's built on.Chief Bot's accuracy depends entirely on the quality, completeness, and freshness of the documents ingested into the knowledge graph. Incomplete meeting notes or outdated project records produce incomplete answers. No amount of architectural sophistication changes that. This is why we designed the ingestion pipeline to be modular: so the client can continuously expand and refine their data sources over time.

#### Technology stack

Neo4j, OpenAI API, FastAPI + Uvicorn, React + Vite, Python

[RAG Architecture](https://www.rubicon-world.com/tags/rag-architecture)

[Fixed Entity Architecture](https://www.rubicon-world.com/tags/fixed-entity-architecture)

[Knowledge Graph](https://www.rubicon-world.com/tags/knowledge-graph)

[Python](https://www.rubicon-world.com/tags/python)

[AI Chatbot](https://www.rubicon-world.com/tags/ai-chatbot)

[GraphRAG](https://www.rubicon-world.com/tags/graphrag)

[Neo4j](https://www.rubicon-world.com/tags/neo4j)

[Graph Database](https://www.rubicon-world.com/tags/graph-database)

[Enterprise AI](https://www.rubicon-world.com/tags/enterprise-ai)

## Explore more cases

[![Case study image showcase](https://framerusercontent.com/images/aPWIHZv0Hu6KFleY6Y63wSGiZxk.png?lossless=1&width=2096&height=2096)\\
\\
**Automating Human Services Case Management with Azure**](https://www.rubicon-world.com/cases/automating-human-services-case-management-with-azure)

[![Case study image showcase](https://framerusercontent.com/images/ypPK4BYeoVrVZTnyQ5dZVDm3fQ.png?width=2096&height=2096)\\
\\
**Building a HIPAA-Aligned Data Intelligence Platform on Azure and Databricks**](https://www.rubicon-world.com/cases/building-a-hipaa-aligned-data-intelligence-platform-on-azure-and-databricks)

##### Contact us to enhance your business through a foundation of innovation, security, and sustainability.

[CONTACT US](https://www.rubicon-world.com/contact)

[![](data:image/svg+xml,<svg display="block" role="presentation" viewBox="0 0 173 48" xmlns="http://www.w3.org/2000/svg"><path d="M 35.136 48 L 27.016 41.632 L 35.136 35.28 Z M 34.944 34.656 L 26.504 41.248 L 18.063 34.656 L 26.504 28.048 Z M 26.009 27.664 L 17.872 34.016 L 17.872 21.296 Z M 59.589 15.984 C 62.483 15.984 64.835 17.993 64.835 20.906 C 64.835 23.145 63.42 24.84 61.431 25.482 L 65.756 31.836 L 65.756 31.968 L 63.289 31.968 L 59.063 25.762 L 53.422 25.762 L 53.422 31.984 L 51.136 31.984 L 51.136 15.984 Z M 72.551 25.38 C 72.551 28.495 74.528 29.826 77.301 29.826 C 80.073 29.826 82.003 28.495 82.003 25.38 L 82.003 15.984 L 84.256 15.984 L 84.256 25.38 C 84.256 30.118 80.916 31.984 77.269 31.984 C 73.637 31.984 70.297 30.102 70.297 25.38 L 70.297 15.984 L 72.551 15.984 Z M 98.118 15.984 C 100.861 15.984 102.652 17.908 102.652 20.342 C 102.652 21.936 101.897 23.088 100.764 23.729 C 102.472 24.19 103.803 25.539 103.803 27.66 C 103.803 30.291 101.765 31.984 99.269 31.984 L 89.657 31.984 L 89.657 15.984 Z M 111.304 31.984 L 109.018 31.984 L 109.018 15.984 L 111.304 15.984 Z M 124.674 15.984 C 127.983 15.984 130.444 17.681 131.563 19.921 L 129.678 21.009 C 128.926 19.281 127.12 18.112 124.754 18.112 C 121.109 18.112 118.936 20.737 118.936 23.984 C 118.936 27.232 121.174 29.856 124.818 29.856 C 127.232 29.856 129.038 28.704 129.789 26.961 L 131.676 28.049 C 130.573 30.289 128.095 31.984 124.754 31.984 C 119.894 31.984 116.697 28.464 116.697 23.984 C 116.697 19.489 119.831 15.984 124.674 15.984 Z M 144.434 15.984 C 149.277 15.984 152.65 19.569 152.65 23.984 C 152.65 28.4 149.277 31.984 144.434 31.984 C 139.59 31.984 136.218 28.4 136.218 23.984 C 136.218 19.569 139.59 15.984 144.434 15.984 Z M 170.449 28.313 L 170.449 15.984 L 172.735 15.984 L 172.735 31.984 L 170.68 31.984 L 160.631 19.688 L 160.631 31.984 L 158.345 31.984 L 158.345 15.984 L 160.4 15.984 Z M 144.434 18.112 C 140.773 18.112 138.44 20.689 138.439 23.984 C 138.439 27.28 140.773 29.856 144.434 29.856 C 148.094 29.856 150.429 27.264 150.429 23.984 C 150.428 20.689 148.094 18.112 144.434 18.112 Z M 91.94 29.765 L 99.17 29.765 C 100.582 29.764 101.519 28.81 101.519 27.396 C 101.518 25.966 100.582 24.996 99.17 24.996 L 91.94 24.996 Z M 34.944 20.672 L 26.504 27.264 L 18.063 20.672 L 26.504 14.064 Z M 53.422 23.605 L 59.49 23.605 C 61.184 23.605 62.549 22.585 62.549 20.89 C 62.549 19.194 61.184 18.174 59.49 18.174 L 53.422 18.174 Z M 91.94 22.907 L 98.036 22.907 C 99.449 22.907 100.386 21.954 100.386 20.523 C 100.386 19.11 99.449 18.172 98.036 18.172 L 91.94 18.172 Z M 8.137 13.68 L 0 20.032 L 0 7.312 Z M 35.136 20.032 L 27.016 13.68 L 35.136 7.312 Z M 17.072 6.688 L 8.632 13.28 L 0.192 6.688 L 8.632 0.08 Z M 34.944 6.688 L 26.504 13.28 L 18.063 6.688 L 26.504 0.08 Z M 17.568 6.288 L 9.527 0 L 25.625 0 Z" fill="rgb(255, 255, 255)" height="48.00000014038086px" id="y_gzzqZQT" width="172.73500122070314px"/></svg>)](https://www.rubicon-world.com/)

[Facebook link](https://www.facebook.com/rubicondev)[Instagram link](https://www.instagram.com/rubicondev/)[LinkedIn link](https://ba.linkedin.com/company/rubicon-world)

ISO 27001:2022

ISO 9001:2015

DATABRICKS PARTNER

![Ecovadis colored logo](https://framerusercontent.com/images/63fnw4BoAY4DbDCLzJtDCxq4g4.png?width=96&height=96)

ECOVADIS TOP 35%

4.9 (10 reviews)

Company

[About us](https://www.rubicon-world.com/about)

[Our work](https://www.rubicon-world.com/cases)

[Blog](https://www.rubicon-world.com/blog)

[Careers](https://www.rubicon-world.com/careers)

[Contact](https://www.rubicon-world.com/contact)

[Quality and Information Security Policy](https://www.rubicon-world.com/quality-and-information-security-policy)

ENGAGEMENT MODELS

[End to end digital product development](https://www.rubicon-world.com/engagement-models/end-to-end-digital-product-development)

[Dedicated teams](https://www.rubicon-world.com/engagement-models/dedicated-teams)

[Consulting services](https://www.rubicon-world.com/engagement-models/consulting-services)

Services

[Consulting & strategy](https://www.rubicon-world.com/services/consulting-strategy)

[Digital platform product development](https://www.rubicon-world.com/services/digital-platform-product-development)

[Software engineering and development](https://www.rubicon-world.com/services/software-engineering-and-development)

[Data engineering](https://www.rubicon-world.com/services/data-engineering)

[Analytics business intelligence](https://www.rubicon-world.com/services/analytics-business-intelligence)

[AI & machine learning solutions](https://www.rubicon-world.com/services/ai-and-machine-learning-solutions)

[AI agents](https://www.rubicon-world.com/services/ai-agents)

[Workshops](https://www.rubicon-world.com/services/workshops)

[Cloud Development](https://www.rubicon-world.com/services/cloud-development)

[Mobile Development](https://www.rubicon-world.com/services/mobile-development)

[User Experience Design](https://www.rubicon-world.com/services/user-experience-design)

[QA software testing](https://www.rubicon-world.com/services/qa-software-testing)

ACCELERATORS

[Sustainability accelerator](https://www.rubicon-world.com/accelerators/sustainability-accelerator)

[Consumer audio accelerator](https://www.rubicon-world.com/accelerators/consumer-audio-accelerator)

Industries

[Chemical](https://www.rubicon-world.com/industries/chemical)

[Consumer goods](https://www.rubicon-world.com/industries/consumer-goods)

[Banking fintech](https://www.rubicon-world.com/industries/banking-fintech)

[Healthcare](https://www.rubicon-world.com/industries/healthcare)

[Life sciences](https://www.rubicon-world.com/industries/life-sciences)

[Manufacturing](https://www.rubicon-world.com/industries/manufacturing)

[Consumer audio](https://www.rubicon-world.com/industries/consumer-audio)

[Retail](https://www.rubicon-world.com/industries/retail)

Workshops

[Design sprint](https://www.rubicon-world.com/workshops/design-sprint)

[Lean inception](https://www.rubicon-world.com/workshops/lean-inception)

[Event storming](https://www.rubicon-world.com/workshops/event-storming)

@

2026

RUBICON. All rights reserved

[Terms of Service](https://www.rubicon-world.com/legal/terms-of-service)

[Privacy policy](https://www.rubicon-world.com/legal/privacy-policy)

[Cookie policy](https://www.rubicon-world.com/legal/cookie-policy)

Cookie Settings

We use cookies to personalize content, run ads, and analyze traffic. Read our [Cookie Policy](https://www.rubicon-world.com/legal/cookie-policy).

---

