=== AnythingLLM structure ===
BARE_METAL.md
CONTRIBUTING.md
LICENSE
README.md
SECURITY.md
TERMS_SELF_HOSTED.md
browser-extension
cloud-deployments
collector
docker
embed
eslint.config.js
extras
frontend
images
locales
package.json
pull_request_template.md
server

=== Embed/Widget directories ===
/home/ubuntu/chatbot-project/anything-llm/frontend/public/embed
/home/ubuntu/chatbot-project/anything-llm/server/endpoints/embedManagement.js
/home/ubuntu/chatbot-project/anything-llm/server/endpoints/embed
/home/ubuntu/chatbot-project/anything-llm/server/jobs/embedding-worker.js
/home/ubuntu/chatbot-project/anything-llm/server/models/embedConfig.js
/home/ubuntu/chatbot-project/anything-llm/server/models/embedChats.js
/home/ubuntu/chatbot-project/anything-llm/embed

=== README excerpt ===
<a name="readme-top"></a>

<p align="center">
  <a href="https://anythingllm.com"><img src="https://github.com/Mintplex-Labs/anything-llm/blob/master/images/wordmark.png?raw=true" alt="AnythingLLM logo"></a>
</p>

<div align='center'>
<a href="https://trendshift.io/repositories/2415" target="_blank"><img src="https://trendshift.io/api/badge/repositories/2415" alt="Mintplex-Labs%2Fanything-llm | Trendshift" style="width: 250px; height: 55px;" width="250" height="55"/></a>
</div>

<p align="center">
    <b>AnythingLLM:</b> The all-in-one AI app you were looking for.<br />
    Chat with your docs, use AI Agents, hyper-configurable, multi-user, & no frustrating setup required.
</p>

<p align="center">
  <a href="https://discord.gg/6UyHPeGZAC" target="_blank">
      <img src="https://img.shields.io/badge/chat-mintplex_labs-blue.svg?style=flat&logo=data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAMAAABEpIrGAAAAIGNIUk0AAHomAACAhAAA+gAAAIDoAAB1MAAA6mAAADqYAAAXcJy6UTwAAAH1UExURQAAAP////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////r6+ubn5+7u7/3+/v39/enq6urq6/v7+97f39rb26eoqT1BQ0pOT4+Rkuzs7cnKykZKS0NHSHl8fdzd3ejo6UxPUUBDRdzc3RwgIh8jJSAkJm5xcvHx8aanqB4iJFBTVezt7V5hYlJVVuLj43p9fiImKCMnKZKUlaaoqSElJ21wcfT09O3u7uvr6zE0Nr6/wCUpK5qcnf7+/nh7fEdKTHx+f0tPUOTl5aipqiouMGtubz5CRDQ4OsTGxufn515hY7a3uH1/gXBydIOFhlVYWvX29qaoqCQoKs7Pz/Pz87/AwUtOUNfY2dHR0mhrbOvr7E5RUy8zNXR2d/f39+Xl5UZJSx0hIzQ3Odra2/z8/GlsbaGjpERHSezs7L/BwScrLTQ4Odna2zM3Obm7u3x/gKSmp9jZ2T1AQu/v71pdXkVISr2+vygsLiInKTg7PaOlpisvMcXGxzk8PldaXPLy8u7u7rm6u7S1tsDBwvj4+MPExbe4ueXm5s/Q0Kyf7ewAAAAodFJOUwAABClsrNjx/QM2l9/7lhmI6jTB/kA1GgKJN+nea6vy/MLZQYeVKK3rVA5tAAAAAWJLR0QB/wIt3gAAAAd0SU1FB+cKBAAmMZBHjXIAAAISSURBVDjLY2CAAkYmZhZWNnYODnY2VhZmJkYGVMDIycXNw6sBBbw8fFycyEoYGfkFBDVQgKAAPyMjQl5IWEQDDYgIC8FUMDKKsmlgAWyiEBWMjGJY5YEqxMAqGMWFNXAAYXGgAkYJSQ2cQFKCkYFRShq3AmkpRgYJbghbU0tbB0Tr6ukbgGhDI10gySfBwCwDUWBsYmpmDqQtLK2sbTQ0bO3sHYA8GWYGWWj4WTs6Obu4ami4OTm7exhqeHp5+4DCVJZBDmqdr7ufn3+ArkZgkJ+fU3CIRmgYWFiOARYGvo5OQUHhEUAFTkF+kVHRsLBgkIeyYmLjwoOc4hMSk5JTnINS06DC8gwcEEZ6RqZGlpOfc3ZObl5+gZ+TR2ERWFyBQQFMF5eklmqUpQb5+ReU61ZUOvkFVVXXQBSAraitq29o1GiKcfLzc29u0mjxBzq0tQ0kww5xZHtHUGeXhkZhdxBYgZ4d0LI6c4gjwd7siQQraOp1AivQ6CuAKZCDBBRQQQNQgUb/BGf3cqCCiZOcnCe3QQIKHNRTpk6bDgpZjRkzg3pBQTBrdtCcuZCgluAD0vPmL1gIdvSixUuWgqNs2YJ+DUhkEYxuggkGmOQUcckrioPTJCOXEnZ5JS5YslbGnuyVERlDDFvGEUPOWvwqaH6RVkHKeuDMK6SKnHlVhTgx8jeTmqy6Eij7K6nLqiGyPwChsa1MUrnq1wAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAyMy0xMC0wNFQwMDozODo0OSswMDowMB9V0a8AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMjMtMTAtMDRUMDA6Mzg6NDkrMDA6MDBuCGkTAAAAKHRFWHRkYXRlOnRpbWVzdGFtcAAyMDIzLTEwLTA0VDAwOjM4OjQ5KzAwOjAwOR1IzAAAAABJRU5ErkJggg==" alt="Discord">
  </a> |
  <a href="https://github.com/Mintplex-Labs/anything-llm/blob/master/LICENSE" target="_blank">
      <img src="https://img.shields.io/static/v1?label=license&message=MIT&color=white" alt="License">
  </a> |
  <a href="https://docs.anythingllm.com" target="_blank">
    Docs
  </a> |
   <a href="https://my.mintplexlabs.com/aio-checkout?product=anythingllm" target="_blank">
    Hosted Instance
  </a>
</p>

<p align="center">
  <b>English</b> · <a href='./locales/README.zh-CN.md'>简体中文</a> · <a href='./locales/README.ja-JP.md'>日本語</a>
</p>

<p align="center">
👉 AnythingLLM for desktop (Mac, Windows, & Linux)! <a href="https://anythingllm.com/download" target="_blank"> Download Now</a>
</p>

Chat with your docs. Automate complex workflows with AI Agents. Hyper-configurable, multi-user ready, battle-tested—and runs locally by default with zero setup friction.

![Chatting](https://github.com/Mintplex-Labs/anything-llm/releases/download/v1.11.2/AnythingLLM720p.gif)

<details>
<summary><kbd>Watch the demo!</kbd></summary>

[![Watch the video](/images/youtube.png)](https://youtu.be/f95rGD9trL0)

</details>

### Product Overview

AnythingLLM is the all-in-one AI application that lets you build a private, fully-featured ChatGPT—without compromises. Connect your favorite local or cloud LLM, ingest your documents, and start chatting in minutes. Out of the box you get built-in agents, multi-user support, vector databases, and document pipelines — no extra configuration required.

AnythingLLM supports multiple users as well where you can control the access and experience per user without compromising the security or privacy of the instance or your intellectual property.

## Cool features of AnythingLLM

- [Scheduled Tasks](https://docs.anythingllm.com/scheduled-jobs/overview)
- [Intelligent Skill Selection](https://docs.anythingllm.com/agent/intelligent-tool-selection) Enable **unlimited** tools for your models while reducing token usage by up to 80% per query
- [**No-code AI Agent builder**](https://docs.anythingllm.com/agent-flows/overview)
- [**Full MCP-compatibility**](https://docs.anythingllm.com/mcp-compatibility/overview)
- **Multi-modal support (both closed and open-source LLMs!)**
- [**Custom AI Agents**](https://docs.anythingllm.com/agent/custom/introduction)
- 👤 Multi-user instance support and permissioning _Docker version only_
- 🦾 Agents inside your workspace (browse the web, etc)
- 💬 [Custom Embeddable Chat widget for your website](https://github.com/Mintplex-Labs/anythingllm-embed/blob/main/README.md) _Docker version only_
- 📖 Multiple document type support (PDF, TXT, DOCX, etc)
- Intuitive chat UI with drag-and-drop uploads and source citations.
- Production-ready for any cloud deployment.
- Works with all popular [closed and open-source LLM providers](#supported-llms-embedder-models-speech-models-and-vector-databases).
- Built-in optimizations for large document sets—lower costs and faster responses than other chat UIs.
- Full Developer API for custom integrations!
- ...and much more—install in minutes and see for yourself.

### Supported LLMs, Embedder Models, Speech models, and Vector Databases

**Large Language Models (LLMs):**

- [Any open-source llama.cpp compatible model](/server/storage/models/README.md#text-generation-llm-selection)
- [OpenAI](https://openai.com)
- [OpenAI (Generic)](https://openai.com)
- [Azure OpenAI](https://azure.microsoft.com/en-us/products/ai-services/openai-service)
- [AWS Bedrock](https://aws.amazon.com/bedrock/)
- [Anthropic](https://www.anthropic.com/)
- [NVIDIA NIM (chat models)](https://build.nvidia.com/explore/discover)
- [Google Gemini Pro](https://ai.google.dev/)
- [Hugging Face (chat models)](https://huggingface.co/)
- [Ollama (chat models)](https://ollama.ai/)
- [LM Studio (all models)](https://lmstudio.ai)
- [LocalAI (all models)](https://localai.io/)
- [Together AI (chat models)](https://www.together.ai/)
- [Fireworks AI (chat models)](https://fireworks.ai/)
- [Perplexity (chat models)](https://www.perplexity.ai/)
- [OpenRouter (chat models)](https://openrouter.ai/)
- [DeepSeek (chat models)](https://deepseek.com/)
- [Mistral](https://mistral.ai/)
- [Groq](https://groq.com/)
- [Cohere](https://cohere.com/)
- [KoboldCPP](https://github.com/LostRuins/koboldcpp)
- [LiteLLM](https://github.com/BerriAI/litellm)
