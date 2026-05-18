=== FLOWISE STRUCTURE ===
agentflow
api-documentation
components
observe
server
ui

=== FLOWISE API ROUTES ===
flowise/packages/server/src/routes/openai-assistants/index.ts
flowise/packages/server/src/routes/public-chatflows/index.ts
flowise/packages/server/src/routes/nodes/index.ts
flowise/packages/server/src/routes/verify/index.ts
flowise/packages/server/src/routes/validation/index.ts
flowise/packages/server/src/routes/fetch-links/index.ts
flowise/packages/server/src/routes/feedback/index.ts
flowise/packages/server/src/routes/files/index.ts
flowise/packages/server/src/routes/webhook-listener/index.ts
flowise/packages/server/src/routes/apikey/index.ts
flowise/packages/server/src/routes/components-credentials/index.ts
flowise/packages/server/src/routes/chatflows/index.ts
flowise/packages/server/src/routes/versions/index.ts
flowise/packages/server/src/routes/flow-config/index.ts
flowise/packages/server/src/routes/predictions/index.ts
flowise/packages/server/src/routes/mcp-server/index.ts
flowise/packages/server/src/routes/settings/index.ts
flowise/packages/server/src/routes/public-chatbots/index.ts
flowise/packages/server/src/routes/credentials/index.ts
flowise/packages/server/src/routes/node-load-methods/index.ts

=== ANYTHINGLLM EMBED WIDGET ===
# AnythingLLM Embedded Chat Widget

**This is a submodule of [AnythingLLM](https://github.com/Mintplex-Labs/anything-llm) - the all-in-one AI Application**

**Please report any issues or feature requests to the [main repo](https://github.com/Mintplex-Labs/anything-llm)**

> [!WARNING]
> The core AnythingLLM team publishes a pre-built version of the script that is bundled
> with the main application. You can find [it in the main repo here.](https://github.com/Mintplex-Labs/anything-llm/tree/master/frontend/public/embed)
> You should only be working in this repo if you are wanting to build your own custom embed widget for AnythingLLM

This folder of AnythingLLM contains the source code for how the embedded version of AnythingLLM works to provide a public facing interface of your workspace.

The AnythingLLM Embedded chat widget allows you to expose a workspace and its embedded knowledge base as a chat bubble via a `<script>` or `<iframe>` element that you can embed in a website or HTML.

### Security

- Users will _not_ be able to view or read context snippets like they can in the core AnythingLLM application
- Users are assigned a random session ID that they use to persist a chat session.
- **Recommended** You can limit both the number of chats an embedding can process **and** per-session.

_by using the AnythingLLM embedded chat widget you are responsible for securing and configuration of the embed as to not allow excessive chat model abuse of your instance_

### Developer Setup

- `cd embed` from the root of the repo
- `yarn` to install all dev and script dependencies
- `yarn dev` to boot up an example HTML page to use the chat embed widget.

While in development mode (`yarn dev`) the script will rebuild on any changes to files in the `src` directory. Ensure that the required keys for the development embed are accurate and set.

`yarn build` will compile and minify your build of the script. You can then host and link your built script wherever you like.

## Integrations & Embed Types

### `<script>` tag HTML embed

The primary way of embedding a workspace as a chat widget is via a simple `<script>`

```html
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

=== FLOWISE PRICING MODEL CODE ===
flowise/packages/agentflow/src/infrastructure/api/deduplicatedClient.ts
flowise/packages/agentflow/src/core/utils/fieldVisibility.test.ts
flowise/packages/components/src/storage/GCSStorageProvider.ts
flowise/packages/components/src/storage/S3StorageProvider.ts
flowise/packages/components/src/indexing.ts
flowise/packages/components/src/pythonCodeValidator.ts
flowise/packages/components/src/agents.ts
flowise/packages/components/src/utils.ts
flowise/packages/components/nodes/agents/AirtableAgent/core.ts
flowise/packages/components/nodes/agents/AirtableAgent/AirtableAgent.ts
