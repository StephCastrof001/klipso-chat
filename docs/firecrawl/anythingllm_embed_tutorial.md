# Query: AnythingLLM embed widget production setup tutorial

## 1. Overview ~ AnythingLLM
**URL:** https://docs.anythingllm.com/setup/embedder-configuration/overview

[🚀 AnythingLLM v1.12.1 is live! Update now →](https://anythingllm.com/download)

AnythingLLM Setup

Embedder Setup

Overview

![Embedder Configuration](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Fheader-image.png&w=3840&q=100)

# Embedder Configuration

Embedding models are specific types of models that turn text into vectors, which can be stored and searched in a vector database - which is the foundation of RAG.

️💡

**Tip:**

Embedding models are set system-wide and cannot be configured atomically per-workspace like LLMs can.

## Supported Embedding Model Providers [Permalink for this section](https://docs.anythingllm.com/setup/embedder-configuration/overview\#supported-embedding-model-providers)

️⚠️

**HEADS UP!**

Once you select your embedding model provider and begin uploading and embedding documents it is best to not change it.

While you can change embedders, doing so will mean you will have to delete your uploaded documents and re-embed them so the new embedder can re-embed them.

AnythingLLM supports many embedding model providers out of the box with very little, if any setup.

You can modify your embedding provider and model at any time in AnythingLLM. However doing so can result in broken queries and needing to re-embed uploaded and stored documents.

### Local Embedding Model Providers [Permalink for this section](https://docs.anythingllm.com/setup/embedder-configuration/overview\#local-embedding-model-providers)

[![AnythingLLM Built-in (default)](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Fbuilt-in%2Fheader-image.png&w=3840&q=100)Built-in (default)→](https://docs.anythingllm.com/setup/embedder-configuration/local/built-in) [![Ollama](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Follama%2Fheader-image.png&w=3840&q=100)Ollama→](https://docs.anythingllm.com/setup/embedder-configuration/local/ollama) [![LM Studio](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Flmstudio%2Fheader-image.png&w=3840&q=100)LM Studio→](https://docs.anythingllm.com/setup/embedder-configuration/local/lmstudio) [![Local AI](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Flocalai%2Fheader-image.png&w=3840&q=100)Local AI→](https://docs.anythingllm.com/setup/embedder-configuration/local/localai)

### Cloud Model Providers [Permalink for this section](https://docs.anythingllm.com/setup/embedder-configuration/overview\#cloud-model-providers)

[![OpenAI](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Fcloud%2Fopenai%2Fheader-image.png&w=3840&q=100)OpenAI→](https://docs.anythingllm.com/setup/embedder-configuration/cloud/openai) [![Azure OpenAI](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Fcloud%2Fazure-openai%2Fheader-image.png&w=3840&q=100)Azure OpenAI→](https://docs.anythingllm.com/setup/embedder-configuration/cloud/azure-openai) [![Cohere](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Fcloud%2Fcohere%2Fheader-image.png&w=3840&q=100)Cohere→](https://docs.anythingllm.com/setup/embedder-configuration/cloud/cohere)

Last updated on April 10, 2026

[System Prompt Variables](https://docs.anythingllm.com/features/system-prompt-variables "System Prompt Variables") [AnythingLLM Default](https://docs.anythingllm.com/setup/embedder-configuration/local/built-in "AnythingLLM Default")

---

## 2. AnythingLLM: Complete Guide to Setup, RAG, and Use Cases | DataCamp
**URL:** https://www.datacamp.com/blog/anythingllm

[![Promo | 50% Off](https://media.datacamp.com/cms/languageeng-left.png)\\
\\
**Last chance! **50% off** DataCamp Premium** \\
\\
Sale ends in\\
\\
4d11h38m37s\\
\\
Buy Now](https://www.datacamp.com/promo/learn-data-ai-skills-may-26)

[Skip to main content](https://www.datacamp.com/blog/anythingllm#main)

A common question in the self-hosted AI space is how to chat with private documents without sending them to a cloud API.

AnythingLLM is a popular answer. It handles everything (document upload, embedding, search, and chat) in one interface and connects to a wide range of LLM providers. It lets you build private AI workflows without depending on cloud services.

In this guide, I will explain what AnythingLLM is, walk through its architecture, show you how to install it with [Docker](https://www.datacamp.com/tutorial/docker-for-data-science-introduction) and [Ollama](https://www.datacamp.com/tutorial/docker-ollama-run-llms-locally), and demonstrate a working [Retrieval-Augmented Generation (RAG)](https://www.datacamp.com/blog/what-is-retrieval-augmented-generation-rag) pipeline. I will also compare it against Open WebUI and ChatGPT.

## What Is AnythingLLM?

AnythingLLM is an open-source application built by [Mintplex Labs](https://github.com/Mintplex-Labs/anything-llm) under the MIT license. It has an active GitHub community and frequent releases, and is widely used in the self-hosted AI space.

Here's what it does: it turns your documents into context that a [large language model (LLM)](https://www.datacamp.com/blog/what-is-an-llm-a-guide-on-large-language-models) can use during conversations. You upload files, the system processes and stores them, and then the LLM can answer questions based on your data. The project has grown fast, with an active Discord community and monthly updates that add new LLM providers and features.

Two things to understand upfront. First, AnythingLLM is not a model itself. It's a bridge connecting you to external LLM providers, whether local (like Ollama) or cloud-based (like OpenAI or Anthropic).

Second, the platform organizes everything into workspaces. Think of these as separate rooms for different projects. Each workspace has its own documents and conversations that stay isolated unless you explicitly configure them to share.

![AnythingLLM workspace interface showing the chat panel and document sidebar.](https://media.datacamp.com/cms/df00d6333626404148220b2c23f1f2b3.png)

_AnythingLLM workspace interface with documents. Image by Author._

### AnythingLLM on desktop vs. Docker

The desktop app (macOS, Windows, Linux) is for single users running everything locally. It comes with a built-in LLM engine, CPU-based embedder, and bundled LanceDB. One-click install, no configuration needed.

The Docker version is built for teams and servers. It adds proper access control with Admin, Manager, and Default roles, plus embeddable chat widgets for websites and white-labeling. If you need team access or public-facing chat widgets, Docker is your only option.

|     |     |     |
| --- | --- | --- |
| **Feature** | **Desktop** | **Docker** |
| Multi-user support | No | Yes (Admin, Manager, Default roles) |
| Built-in LLM engine | Yes | No (connect to external providers) |
| Embeddable chat widgets | No | Yes |
| White-labeling | No | Yes |
| Setup complexity | One-click install | Requires Docker knowledge |

## Core Features of AnythingLLM

Now that you know what AnythingLLM is and how to choose between Desktop and Docker, let's walk through the features that make it useful for document-based AI workflows.

### Document ingestion

Works with PDF, DOCX, TXT, Markdown, CSV, XLSX, PPTX, HTML, 50+ code file types, and audio files (using [Whisper](https://www.datacamp.com/tutorial/converting-speech-to-text-with-the-openAI-whisper-API) transcription). You can also pull content directly from GitHub repos, YouTube transcripts, Confluence pages, and websites using the built-in scraper.

### Vector database

LanceDB comes built in and needs zero setup. If you need enterprise features, you can switch to Chroma, Milvus, Pinecone, Qdrant, Weaviate, Zilliz, AstraDB, or PGVector.

### Multiple LLM support

Supports a wide range of providers, including Ollama, LM Studio, OpenAI, Anthropic, Azure OpenAI, Google Gemini, AWS Bedrock, Groq, and DeepSeek. You pick models per workspace, so one workspace can use a local Ollama model for sensitive stuff while another uses GPT-4o through OpenAI.

### AI agents

Type `@agent` in any chat to activate the no-code agent builder. It has built-in skills for searching documents, summarization, and web scraping. Agent Flows gives you a visual canvas for chaining together API calls, LLM instructions, and file operations. It also supports [Model Context Protocol (MCP)](https://www.datacamp.com/tutorial/mcp-model-context-protocol) for connecting external tools.

### API access

The developer API lives at`/api/docs`(Swagger docs). You can programmatically manage workspaces, embed documents, and send chat messages.

## How AnythingLLM Works (Architecture Overview)

The application has three parts: the frontend (React/ViteJS) gives you the interface you see and interact with. The server (Express backend) handles all the LLM interactions, vector database work, and API requests. It uses SQLite for storing configuration. The collector is a separate service that parses and processes your uploaded documents. When you upload a PDF, the collector extracts the text, then the server chunks, embeds, and stores it.

### The RAG pipeline

The pipeline works in two phases.

Ingestion: Your documents go to the collector, which extracts the text. The server then splits this text into chunks (up to 1,000 characters with a small overlap to keep context). Each chunk gets converted into a vector by the embedding model, then stored in the vector database. A`vector-cache/`folder reduces unnecessary re-embedding in many cases.

Query: Your question gets converted into a vector using the same embedding model. Then the system searches for the most similar chunks (usually four to six). After filtering by similarity score, the matching text gets added to the LLM prompt along with your question and chat history. The LLM reads all of this (system instructions, retrieved context, your question, and previous messages) and generates its answer.

![Flowchart of the AnythingLLM RAG pipeline from document upload to LLM response.](https://media.datacamp.com/cms/2ee718c0ecca04a2091ad268aaf8aa07.png)

_AnythingLLM RAG pipeline architecture overview. Image by Author._

## Installing AnythingLLM with Docker

As you'll see in the FAQ, AnythingLLM is lightweight: around 2GB RAM, a 2-core CPU, and about 5GB of storage. Running a local LLM alongside it requires more (a 7B model typically needs 8GB+ RAM/VRAM). For this tutorial, I use a 3B model that works on limited hardware. Make sure Docker is installed and running before starting. Windows users also need WSL.

### Step 1: Install Ollama and pull models

Download Ollama from [ollama.com/download](https://ollama.com/download), then pull a chat model and an embedding model:

```bash
ollama pull llama3.2:3b
ollama pull nomic-embed-text
ollama serve

Powered By
```

I use `llama3.2:3b` because it runs well on machines with limited VRAM (like an RTX 3050 with 6GB). For better quality, try `llama3.2:8b`or [deepseek-r1:7b](https://www.datacamp.com/tutorial/deepseek-r1-ollama) if your hardware allows. Check out our guide on [running LLMs locally](https://www.datacamp.com/tutorial/run-llms-locally-tutorial) for more model options.

### Step 2: Create the Docker Compose file

```bash
mkdir anythingllm-setup && cd anythingllm-setup
touch .env

Powered By
```

Create `docker-compose.yml`:

```yaml
services:
  anythingllm:
    image: mintplexlabs/anythingllm:latest
    container_name: anythingllm
    ports:
      - "3001:3001"
    cap_add:
      - SYS_ADMIN
    volumes:
      - anythingllm_storage:/app/server/storage
      - ./.env:/app/server/.env
    environment:
      - STORAGE_DIR=/app/server/storage
    extra_hosts:
      - "host.docker.internal:host-gateway"
    restart: unless-stopped

volumes:
  anythingllm_storage:

Powered By
```

A few things to note about this configuration. The `cap_add: SYS_ADMIN` flag is required for the built-in PuppeteerJS web scraper, which uses a sandboxed Chromium browser.

The `extra_hosts` line solves the most common Docker networking issue: it allows the container to reach Ollama running on your host machine. Without this, any attempt to connect to `localhost:11434` from inside the container will fail because Docker containers have their own network namespace.

I use a named Docker volume (`anythingllm_storage`) instead of a bind mount for better cross-platform compatibility, especially on Windows and macOS, where bind mount permissions can be problematic.

### Step 3: Launch and configure

Wait about 30 seconds for the container to initialize, then open `http://localhost:3001`. You will see the first-run setup wizard. But first, run this command:

```bash
docker compose up -d

Powered By
```

![AnythingLLM first-run setup wizard after Docker installation.](https://media.datacamp.com/cms/5389f43240d5ef13e699bfba02648ded.png)

_AnythingLLM initial setup wizard on Docker. Image by Author._

**During the setup wizard, select Ollama as both the LLM and embedding provider, set the base URL to `http://host.docker.internal:11434`, choose `llama3.2:3b` as the chat model, and`nomic-embed-text` as the embedder. Keep LanceDB as the default vector database.**

Anything\_LLM\_1

![Video Thumbnail](https://fast.wistia.net/embed/medias/p0ft33mfnv/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/8ba71bd3612ebf59e4d295d6c7a38814f8568a28.webp?image_crop_resized=960x540)

Click for sound

0:22

Configuring Ollama as the LLM provider. Video by Author.

For the Desktop alternative, download the app from [anythingllm.com](https://anythingllm.com/). It bundles everything and works immediately with zero configuration. Ideal for personal use, but as mentioned earlier, it lacks the multi-user and enterprise features available in Docker.

## Connecting LLM Providers

Beyond Ollama, you can connect cloud providers through Settings (as mentioned in FAQ 1, this is useful if your hardware is limited).

### OpenAI

Pick OpenAI as your LLM provider, enter your API key from [platform.openai.com](https://platform.openai.com/), and choose a model (GPT-4o, GPT-4o-mini, etc.). Your account needs billing set up, or it won't work (and the error message won't be clear).

### Anthropic

Enter your key from [console.anthropic.com](https://console.anthropic.com/). All Claude models work for chat, but Anthropic doesn't have embedding models, so you still need a separate embedder like Ollama's `nomic-embed-text`.

### Ollama configuration

If you configured Ollama during installation as shown above, you are already set. For other setups, use `http://host.docker.internal:11434` on Windows/macOS, or `http://172.17.0.1:11434` on Linux. If Ollama is unreachable, set `OLLAMA_HOST=0.0.0.0:11434` before starting it.

## Using AnythingLLM for Document Chat

Click "New Workspace" in the sidebar and name it. Upload files using the sidebar upload button or drag-and-drop.

**AnythingLLM supports two document modes. Attaching (drag into chat) puts the full text into the conversation, but only for that specific chat thread. The model sees everything, but you're limited by token capacity. Embedding (the standard RAG approach) breaks the document into chunks, converts them to vectors, and stores them in the workspace. Once embedded, documents work across all your chats in that workspace. For most cases, embedding is the better choice. Click "Move to Workspace" to start the embedding process.**

AnythingLLM\_2

![Video Thumbnail](https://fast.wistia.net/embed/medias/uilay94kwz/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/856a14e9a4cbd7f02e9b0bc1b4792f622de4d728.webp?image_crop_resized=960x540)

Click for sound

0:34

Uploading and embedding documents in a workspace. Video by Author.

### Tuning retrieval quality

Type your question and the system automatically finds relevant chunks and sends them to the LLM. If the answers aren't good, here are the key settings to adjust:

#### Similarity threshold

As mentioned in FAQ 5, start with "No Restriction" if you're having issues, then gradually raise it to filter out noise.

#### Max context snippets

The default is four to six chunks. Bump this up to 10 or 12 for models with large context windows like Claude.

#### Search preference

"Accuracy Optimized" on LanceDB turns on reranking, which improves results but may introduce additional latency depending on the model and hardware.

#### Document pinning

Pin critical documents to skip chunking entirely. The full text gets added to every query (assuming it fits within token limits).

AnythingLLM\_3

![Video Thumbnail](https://fast.wistia.net/embed/medias/5x3ml9ke68/swatch)

![Video Thumbnail](https://embed-ssl.wistia.com/deliveries/d4897851c9f4dc5c60eab9a4373a580f4e35e1fa.webp?image_crop_resized=960x540)

Click for sound

0:46

Document chat response with RAG context. Video by Author.

## AnythingLLM vs. Open WebUI

Both tools are solid, but they're built for different users.

|     |     |     |
| --- | --- | --- |
| **Dimension** | **AnythingLLM** | **Open WebUI** |
| **Primary audience** | Business users, small teams | Developers, technical users |
| **Desktop app** | Yes (macOS, Windows, Linux) | No (web-based only) |
| **Setup complexity** | Desktop: one-click; Docker: straightforward | Requires Docker or server setup |
| **RAG implementation** | Built-in with multi-vector DB support, reranking | Extensive RAG, plugin-based extensibility |
| **Multi-user** | Docker only; three RBAC roles | Limited collaboration features |
| **Plugin ecosystem** | Growing; custom skills via Node.js | More mature and extensive |
| **License** | MIT | Modified BSD-3-Clause with branding protection since v0.6.6 |

AnythingLLM tends to fit teams that prioritize workspace management and embeddable widgets, while [Open WebUI](https://github.com/open-webui/open-webui) tends to fit users who want a larger plugin ecosystem and more developer-oriented extensibility. Some teams run both: Open WebUI for devs who want fine-grained control, and AnythingLLM for business users who need quick document workspaces.

## AnythingLLM vs. ChatGPT

This comparison is about priorities, not which tool is "better."

|     |     |     |
| --- | --- | --- |
| **Dimension** | **AnythingLLM** | **ChatGPT** |
| **Data privacy** | Full ownership with local models | Data sent to OpenAI servers |
| **Cost** | Free (self-hosted); cloud from $50/month | Free tier; Plus $20/month; Pro $200/month |
| **Customization** | Any LLM, embedder, vector DB, agents | Limited to OpenAI models |
| **Offline capability** | Yes (with local models) | No |
| **Setup effort** | Requires installation | Zero setup, browser-based |
| **Document chat** | Full RAG control (thresholds, chunking, reranking) | File uploads with usage limits |

ChatGPT emphasizes a fully hosted experience and strong default model quality, while AnythingLLM emphasizes privacy, flexibility, and control over RAG settings. You can also connect GPT-4o to AnythingLLM via the OpenAI API. That gives you ChatGPT-quality models with AnythingLLM's workspace and RAG features.

## AnythingLLM Use Cases

Here's where AnythingLLM works best:

### Internal knowledge bases

Employees can ask questions about company docs instead of digging through folders. Upload your policies, procedures, and documentation, then let people search in natural language.

### Research workflows

Academics can search across hundreds of papers instantly. Embed your research library and surface relevant findings without manual keyword searches.

### Private enterprise deployments

Healthcare, finance, and legal teams can use AI while keeping all data on their own servers. Common in regulated industries where data must stay on-premises.

### Developer testing

Try different LLMs (Ollama, OpenAI, Claude) on the same documents by switching models per workspace. No infrastructure changes needed.

### Customer chat widgets

Embed a chat interface on your website using Docker. Configure domain allowlists and per-session limits for public use.

### Meeting transcription

The Meeting Assistant feature works like cloud note-taking tools but runs locally. Requires around 16GB RAM for smooth operation.

## Limitations

As discussed earlier, Desktop and Docker have different features, which confuse new users.

RAG quality needs tuning (I covered the main settings earlier) because the similarity search is math-based and doesn't truly understand the meaning.

The plugin system is smaller than Open WebUI's, and building custom agent skills requires knowledge of Node.js.

Finally, there's no built-in fine-tuning. You can only customize through system prompts, temperature, and token limits.

## AnythingLLM Security and Privacy

Local deployment keeps all data on your device. (I have more details in the third FAQ down below.) When using cloud providers, only prompts and retrieved context are sent during inference. Vectors and embeddings stay on your server. Be deliberate about which workspaces use cloud versus local models.

The Docker version includes Simple SSO via `SIMPLE_SSO_ENABLED`, which creates temporary access tokens. API keys give full access with no granular permissions, so treat them like admin passwords and change them regularly. If you expose AnythingLLM to the internet, put an [Nginx](https://www.datacamp.com/tutorial/nginx-docker) reverse proxy with SSL in front of it (the app doesn't handle HTTPS on its own). Telemetry can be disabled with `DISABLE_TELEMETRY=true` in your `.env` file.

## Conclusion

AnythingLLM solves a real problem in the self-hosted AI space. It gives you an interface for chatting with your documents, connects to almost any LLM provider, and keeps your data under your control. As discussed earlier, pick Desktop for personal use or Docker for team deployments.

Like any tool, it has trade-offs. RAG quality depends on how you configure it, and the Desktop/Docker feature differences can confuse newcomers.

As a next step, check out our [AI Fundamentals](https://www.datacamp.com/tracks/ai-fundamentals) track or our tutorial on [building local AI with Docker and n8n](https://www.datacamp.com/tutorial/local-ai).

* * *

![Khalid Abdelaty's photo](https://media.datacamp.com/cms/screenshot-2025-12-19-at-12.46.02pm.png?w=128)

Author

Khalid Abdelaty

[LinkedIn](https://www.linkedin.com/in/khalidabdelaty)

I’m a data engineer and community builder who works across data pipelines, cloud, and AI tooling while writing practical, high-impact tutorials for DataCamp and emerging developers.

## FAQs

### Can I run this on my old laptop without a GPU?

**Yes! AnythingLLM itself is lightweight: around 2GB RAM, a 2-core CPU, and about 5GB of storage. The heavy part is running the LLM locally through Ollama. If your hardware is limited, connect to a cloud provider like OpenAI or Groq instead. You get the same workspace and RAG features, but inference happens in the cloud. In other words, AnythingLLM manages the workflow, and you choose whether the model runs locally or in the cloud.**

### What happens if I change my vector database later?

**Plan ahead on this one. There's no automatic migration between vector databases. Switching from LanceDB to Pinecone means re-embedding all documents. Your original files stay safe, but the vectors need regenerating. Practical note: stick with LanceDB unless you have a specific enterprise need. It is typically low-configuration and suitable for many small-team deployments.**

### Is my data really private if I use OpenAI for the LLM?

**Here's the key point: your documents and embeddings never leave your server. But when you ask questions, the retrieved text chunks and your prompt are sent to OpenAI's API for inference. For truly sensitive data, use Ollama instead. Everything stays local. For general work docs, AnythingLLM with OpenAI is still more private than uploading files directly to ChatGPT.**

### Can my team share one AnythingLLM setup?

**Yes, but only with the Docker version. It supports multi-user with three roles: Admin, Manager, and Default. The Desktop app is single-user only. Important: multi-user mode is designed as a one-way configuration change. Decide if you need team access before enabling it.**

### Why does it sometimes ignore my documents when answering?

**Usually three reasons: similarity threshold too high, vague queries, or non-English documents with the default English embedder. Quick fix: try "No Restriction" on the threshold first. If your docs aren't in English, switch to a multilingual embedding model available in Ollama (for example one of the e5-based models) for much better results.**

Topics

[Artificial Intelligence](https://www.datacamp.com/blog/category/ai) [Large Language Models](https://www.datacamp.com/blog/category/large-language-models)

Learn with DataCamp

Course

### [Understanding Artificial Intelligence](https://www.datacamp.com/courses/understanding-artificial-intelligence)

2 hr

394.5K

Learn the basic concepts of Artificial Intelligence, such as machine learning, deep learning, NLP, generative AI, and more.

[See DetailsRight Arrow](https://www.datacamp.com/courses/understanding-artificial-intelligence) [Start Course](https://www.datacamp.com/users/sign_up?redirect=%2Fcourses%2Funderstanding-artificial-intelligence%2Fcontinue)

Course

### [Generative AI for Business](https://www.datacamp.com/courses/generative-ai-for-business)

1 hr

54.9K

Learn the role Generative Artificial Intelligence plays today and will play in the future in a business environment.

[See DetailsRight Arrow](https://www.datacamp.com/courses/generative-ai-for-business) [Start Course](https://www.datacamp.com/users/sign_up?redirect=%2Fcourses%2Fgenerative-ai-for-business%2Fcontinue)

Course

### [Large Language Models for Business](https://www.datacamp.com/courses/large-language-models-for-business)

1 hr

16K

Learn about Large Language Models (LLMs) and how they are reshaping the business world.

[See DetailsRight Arrow](https://www.datacamp.com/courses/large-language-models-for-business) [Start Course](https://www.datacamp.com/users/sign_up?redirect=%2Fcourses%2Flarge-language-models-for-business%2Fcontinue)

[See MoreRight Arrow](https://www.datacamp.com/category/artificial-intelligence)

Related

[Tutorial\\
\\
**Docker Ollama: Run LLMs Locally for Privacy and Zero Cost**](https://www.datacamp.com/tutorial/docker-ollama-run-llms-locally)

Set up Ollama in Docker to run local LLMs like Llama and Mistral. Keep your data private, eliminate API costs, and build AI apps that work offline.

![Dario Radečić's photo](https://media.datacamp.com/legacy/v1727011788/image_1_753fadb04d.png?w=48)

Dario Radečić

[Tutorial\\
\\
**RAG With Llama 3.1 8B, Ollama, and Langchain: Tutorial**](https://www.datacamp.com/tutorial/llama-3-1-rag)

Learn to build a RAG application with Llama 3.1 8B using Ollama and Langchain by setting up the environment, processing documents, creating embeddings, and integrating a retriever.

![Ryan Ong's photo](https://media.datacamp.com/legacy/v1716384390/ryan_ong_6374f19892.jpg?w=48)

Ryan Ong

[Tutorial\\
\\
**vLLM: Setting Up vLLM Locally and on Google Cloud for CPU**](https://www.datacamp.com/tutorial/vllm)

Learn how to set up and run vLLM (Virtual Large Language Model) locally using Docker and in the cloud using Google Cloud.

![François Aubry's photo](https://media.datacamp.com/legacy/v1725454842/IMG_20231023_WA_0003_db9e8a0738.jpg?w=48)

François Aubry

[Tutorial\\
\\
**LiteLLM: A Guide With Practical Examples**](https://www.datacamp.com/tutorial/litellm)

Learn what LiteLLM is and how to use it for unified API calls to various LLM providers, covering basic API usage, error handling, fallbacks, streaming, structured outputs, and cost tracking.

[![Bex Tuychiev's photo](https://media.datacamp.com/legacy/v1686304521/Bex_Tuychiev_1fa6cc0c26.jpg?w=48)](https://www.datacamp.com/portfolio/bexgboost)

Bex Tuychiev

[Tutorial\\
\\
**How to Set Up and Run Gemma 3 Locally With Ollama**](https://www.datacamp.com/tutorial/gemma-3-ollama)

Learn how to install, set up, and run Gemma 3 locally with Ollama and build a simple file assistant on your own device.

![François Aubry's photo](https://media.datacamp.com/legacy/v1725454842/IMG_20231023_WA_0003_db9e8a0738.jpg?w=48)

François Aubry

[Tutorial\\
\\
**How to Run Llama 3 Locally With Ollama and GPT4ALL**](https://www.datacamp.com/tutorial/run-llama-3-locally)

Run LLaMA 3 locally with GPT4ALL and Ollama, and integrate it into VSCode. Then, build a Q&A retrieval system using Langchain and Chroma DB.

[![Abid Ali Awan's photo](https://media.datacamp.com/legacy/v1658155691/Abid_Ali_Awan_415cc44670.jpg?w=48)](https://www.datacamp.com/portfolio/kingabzpro)

Abid Ali Awan

[See More](https://www.datacamp.com/blog/category/ai) [See More](https://www.datacamp.com/blog/category/ai)

---

## 3. AnythingLLM Default Embedder ~ AnythingLLM
**URL:** https://docs.anythingllm.com/setup/embedder-configuration/local/built-in

[🚀 AnythingLLM v1.12.1 is live! Update now →](https://anythingllm.com/download)

AnythingLLM Setup

Embedder Setup

Local

AnythingLLM Default

![AnythingLLM Default Embedder](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Fbuilt-in%2Fheader-image.png&w=3840&q=100)

# AnythingLLM Default Embedder

️⚠️

**Heads up!**

This embedding model will download (25mb) on the very first embed **and** runs on CPU. You should have at least 2GB of RAM available to ensure the process does not bottleneck.

AnythingLLM ships with a built-in embedder model that runs on CPU.

The model is the popular [all-MiniLM-L6-v2 (opens in a new tab)](https://huggingface.co/sentence-transformers/all-MiniLM-L6-v2) model, which is primarily trained on English documents.

![AnythingLLM Default Embedder](https://docs.anythingllm.com/_next/image?url=%2Fimages%2Fanythingllm-setup%2Fembedder-configuration%2Flocal%2Fbuilt-in%2Fdefault-embedder.png&w=3840&q=100)

Last updated on April 14, 2026

[Overview](https://docs.anythingllm.com/setup/embedder-configuration/overview "Overview") [LM Studio](https://docs.anythingllm.com/setup/embedder-configuration/local/lmstudio "LM Studio")

---

## 4. Embedded Chat Widgets ~ AnythingLLM
**URL:** https://docs.useanything.com/features/chat-widgets

[🚀 AnythingLLM v1.12.1 is live! Update now →](https://anythingllm.com/download)

Feature Overview

Embedded Chat Widgets

![AnythingLLM Embedded Chat Widgets](https://docs.useanything.com/_next/image?url=%2Fimages%2Ffeatures%2Fchat-widgets%2Fheader-image.png&w=3840&q=100)

# Embedded Chat Widgets

️💡

**DOCKER VERSION ONLY!**

These settings are only available in the Docker version of AnythingLLM

![Embedded Chat Widget](https://docs.useanything.com/_next/image?url=%2Fimages%2Ffeatures%2Fchat-widgets%2Fchat-widget.png&w=3840&q=100)

AnythingLLM allows you to create embedded chat widgets that can be easily integrated into any website using a simple `<script>` tag. These embedded chat widgets provide a convenient way for users to interact with your chatbot directly from your website.

## Configuration Options [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#configuration-options)

When creating an embedded chat widget, you have several configuration options available to customize its behavior and appearance.

![Embedded Chat Options 1](https://docs.useanything.com/_next/image?url=%2Fimages%2Ffeatures%2Fchat-widgets%2Fconfiguration-options.png&w=3840&q=100)

### Workspace [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#workspace)

The workspace setting determines which workspace your chat window will be based on. All defaults will be inherited from the selected workspace unless overridden by the specific configuration options.

### Allowed Chat Method [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#allowed-chat-method)

You can set how your chatbot should operate using the allowed chat method. There are two options:

- **Chat**: The chatbot will respond to all questions regardless of context.
- **Query**: The chatbot will only respond to chats related to documents in the workspace.

### Restrict Requests from Domains [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#restrict-requests-from-domains)

This filter allows you to block any requests that come from domains other than the specified list. Leaving this field empty means anyone can use your embedded chat widget on any site.

![Embedded Chat Options 2](https://docs.useanything.com/_next/image?url=%2Fimages%2Ffeatures%2Fchat-widgets%2Fdomain-blacklist.png&w=3840&q=100)

### Max Chats per Day [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#max-chats-per-day)

You can limit the number of chats this embedded chat widget can process in a 24-hour period. Setting this value to zero means unlimited chats per day.

### Max Chats per Session [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#max-chats-per-session)

You can limit the number of chats a session user can send with this embedded chat widget in a 24-hour period. Setting this value to zero means unlimited chats per session.

### Enable Dynamic Model Use [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#enable-dynamic-model-use)

By enabling dynamic model use, you allow the setting of the preferred LLM model to override the workspace default.

### Enable Dynamic LLM Temperature [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#enable-dynamic-llm-temperature)

Enabling dynamic LLM temperature allows the setting of the LLM temperature to override the workspace default.

### Enable Prompt Override [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#enable-prompt-override)

By enabling prompt override, you allow the setting of the system prompt to override the workspace default.

## Embedding the Chat Widget [Permalink for this section](https://docs.useanything.com/features/chat-widgets\#embedding-the-chat-widget)

![Embedded Chat Code](https://docs.useanything.com/_next/image?url=%2Fimages%2Ffeatures%2Fchat-widgets%2Fembed-code.png&w=3840&q=100)

After creating an embedded chat widget, you will be provided with a link that you can publish on your website using a simple `<script>` tag. This allows you to easily integrate the chat widget into your website's HTML code.

Last updated on April 14, 2026

[Chat Modes](https://docs.useanything.com/features/chat-modes "Chat Modes") [Event Logs](https://docs.useanything.com/features/event-logs "Event Logs")

---

## 5. anythingllm-embed/README.md at main · Mintplex-Labs/anythingllm-embed · GitHub
**URL:** https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md

[Skip to content](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#start-of-content)

You signed in with another tab or window. [Reload](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md) to refresh your session.You signed out in another tab or window. [Reload](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md) to refresh your session.You switched accounts on another tab or window. [Reload](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md) to refresh your session.Dismiss alert

{{ message }}

[Mintplex-Labs](https://github.com/Mintplex-Labs)/ **[anythingllm-embed](https://github.com/Mintplex-Labs/anythingllm-embed)** Public

- [Notifications](https://github.com/login?return_to=%2FMintplex-Labs%2Fanythingllm-embed) You must be signed in to change notification settings
- [Fork\\
92](https://github.com/login?return_to=%2FMintplex-Labs%2Fanythingllm-embed)
- [Star\\
158](https://github.com/login?return_to=%2FMintplex-Labs%2Fanythingllm-embed)


## Collapse file tree

## Files

main

Search this repository(forward slash)` forward slash/`

/

# README.md

Copy path

Blame

More file actions

Blame

More file actions

## Latest commit

[![timothycarambat](https://avatars.githubusercontent.com/u/16845892?v=4&size=40)](https://github.com/timothycarambat)[timothycarambat](https://github.com/Mintplex-Labs/anythingllm-embed/commits?author=timothycarambat)

[Merge branch 'main' into main](https://github.com/Mintplex-Labs/anythingllm-embed/commit/658946388453b7e3edd63f4b5f5a655e3d465111)

last yearApr 27, 2025

[6589463](https://github.com/Mintplex-Labs/anythingllm-embed/commit/658946388453b7e3edd63f4b5f5a655e3d465111) · last yearApr 27, 2025

## History

[History](https://github.com/Mintplex-Labs/anythingllm-embed/commits/main/README.md)

Open commit details

[View commit history for this file.](https://github.com/Mintplex-Labs/anythingllm-embed/commits/main/README.md) History

124 lines (72 loc) · 6.54 KB

/

# README.md

Top

## File metadata and controls

- Preview

- Code

- Blame


124 lines (72 loc) · 6.54 KB

[Raw](https://github.com/Mintplex-Labs/anythingllm-embed/raw/refs/heads/main/README.md)

Copy raw file

Download raw file

Outline

Edit and raw actions

# AnythingLLM Embedded Chat Widget

[Permalink: AnythingLLM Embedded Chat Widget](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#anythingllm-embedded-chat-widget)

**This is a submodule of [AnythingLLM](https://github.com/Mintplex-Labs/anything-llm) \- the all-in-one AI Application**

**Please report any issues or feature requests to the [main repo](https://github.com/Mintplex-Labs/anything-llm)**

Warning

The core AnythingLLM team publishes a pre-built version of the script that is bundled
with the main application. You can find [it in the main repo here.](https://github.com/Mintplex-Labs/anything-llm/tree/master/frontend/public/embed)
You should only be working in this repo if you are wanting to build your own custom embed widget for AnythingLLM

This folder of AnythingLLM contains the source code for how the embedded version of AnythingLLM works to provide a public facing interface of your workspace.

The AnythingLLM Embedded chat widget allows you to expose a workspace and its embedded knowledge base as a chat bubble via a `<script>` or `<iframe>` element that you can embed in a website or HTML.

### Security

[Permalink: Security](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#security)

- Users will _not_ be able to view or read context snippets like they can in the core AnythingLLM application
- Users are assigned a random session ID that they use to persist a chat session.
- **Recommended** You can limit both the number of chats an embedding can process **and** per-session.

_by using the AnythingLLM embedded chat widget you are responsible for securing and configuration of the embed as to not allow excessive chat model abuse of your instance_

### Developer Setup

[Permalink: Developer Setup](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#developer-setup)

- `cd embed` from the root of the repo
- `yarn` to install all dev and script dependencies
- `yarn dev` to boot up an example HTML page to use the chat embed widget.

While in development mode (`yarn dev`) the script will rebuild on any changes to files in the `src` directory. Ensure that the required keys for the development embed are accurate and set.

`yarn build` will compile and minify your build of the script. You can then host and link your built script wherever you like.

## Integrations & Embed Types

[Permalink: Integrations & Embed Types](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#integrations--embed-types)

### `<script>` tag HTML embed

[Permalink: <script> tag HTML embed](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#script-tag-html-embed)

The primary way of embedding a workspace as a chat widget is via a simple `<script>`

```
<!--
An example of a script tag embed
REQUIRED data attributes:
  data-embed-id // The unique id of your embed with its default settings
  data-base-api-url // The URL of your anythingLLM instance backend
-->
<script
  data-embed-id="5fc05aaf-2f2c-4c84-87a3-367a4692c1ee"
  data-base-api-url="http://localhost:3001/api/embed"
  src="http://localhost:3000/embed/anythingllm-chat-widget.min.js"
></script>
```

## `<script>` Customization Options

[Permalink: <script> Customization Options](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#script-customization-options)

**LLM Overrides**

- `data-prompt` — Override the chat window with a custom system prompt. This is not visible to the user. If undefined it will use the embeds attached workspace system prompt.

- `data-model` — Override the chat model used for responses. This must be a valid model string for your AnythingLLM LLM provider. If unset it will use the embeds attached workspace model selection or the system setting.

- `data-temperature` — Override the chat model temperature. This must be a valid value for your AnythingLLM LLM provider. If unset it will use the embeds attached workspace model temperature or the system setting.


**Language & Localization**

- `data-language` — Set the language for the chat interface. If not specified, it will default to English (en). [Currently supported languages are available here](https://github.com/Mintplex-Labs/anythingllm-embed/main/src/locales/resources.js). (PR's welcome)

**Style Overrides**

- `data-chat-icon` — The chat bubble icon show when chat is closed. Options are `plus`, `chatBubble`, `support`, `search2`, `search`, `magic`.

- `data-button-color` — The chat bubble background color shown when chat is closed. Value must be hex color code.

- `data-user-bg-color` — The background color of the user chat bubbles when chatting. Value must be hex color code.

- `data-assistant-bg-color` — The background color of the assistant response chat bubbles when chatting. Value must be hex color code.

- `data-brand-image-url` — URL to image that will be show at the top of the chat when chat is open.

- `data-greeting` — Default text message to be shown when chat is opened and no previous message history is found.

- `data-no-sponsor` — Setting this attribute to anything will hide the custom or default sponsor at the bottom of an open chat window.

- `data-no-header` — Setting this attribute hides the header above the chat window.

- `data-sponsor-link` — A clickable link in the sponsor section in the footer of an open chat window.

- `data-sponsor-text` — The text displays in sponsor text in the footer of an open chat window.

- `data-position` \- Adjust the positioning of the embed chat widget and open chat button. Default `bottom-right`. Options are `bottom-right`, `bottom-left`, `top-right`, `top-left`.

- `data-assistant-name` \- Set the chat assistant name that appears above each chat message. Default `AnythingLLM Chat Assistant`

- `data-assistant-icon` \- Set the icon of the chat assistant.

- `data-window-height` \- Set the chat window height. **must include CSS suffix:**`px`,`%`,`rem`

- `data-window-width` \- Set the chat window width. **must include CSS suffix:**`px`,`%`,`rem`

- `data-text-size` \- Set the text size of the chats in pixels.

- `data-username` \- A specific readable name or identifier for the client for your reference. Will be shown in AnythingLLM chat logs. If empty it will not be reported.

- `data-default-messages` \- A string of comma-separated messages you want to display to the user when the chat widget has no history. Example: `"How are you?, What is so interesting about this project?, Tell me a joke."`

- `data-send-message-text` — Override the placeholder text in the message input field.

- `data-reset-chat-text` — Override the text shown on the reset chat button.


**Behavior Overrides**

- `data-open-on-load` — Once loaded, open the chat as default. It can still be closed by the user. To enable set this attribute to `on`. All other values will be ignored.

- `data-show-thoughts` — Allow users to see the AI's thought process, if applicable, in responses. If set to "false", users will only see a static "Thinking" indication without the explict thought content. If "true" the user will see the full thought content as well as the real response. Defaults to "false".

- `data-support-email` — Shows a support email that the user can used to draft an email via the "three dot" menu in the top right. Option will not appear if it is not set.


### `<iframe>` tag HTML embed

[Permalink: <iframe> tag HTML embed](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#iframe-tag-html-embed)

_work in progress_

### `<iframe>` Customization Options

[Permalink: <iframe> Customization Options](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md#iframe-customization-options)

_work in progress_

You can’t perform that action at this time.

---

