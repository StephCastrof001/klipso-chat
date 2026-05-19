# Research: Gems Importability & LLM Observability/Monitoring 🔍

Este documento contiene la recopilación de datos crudos, búsquedas y URLs obtenidas sobre la importación de configuraciones de Custom GPTs / Gemini Gems y la integración de monitoreo en producción de Langfuse + AnythingLLM.

---

## 💎 BÚSQUEDA 1: GPT Gems & Gemini Gems - ¿Son Importables?

### 1. ¿Se puede exportar/importar un OpenAI Custom GPT a otra plataforma?
* **Respuesta:** No de forma directa ni automática a través de un botón o formato estándar de intercambio. Las configuraciones de Custom GPTs en la ChatGPT Store son propietarias de OpenAI.
* **Mapeo / Alternativas:** 
  * Los metadatos de un Custom GPT (System Prompt / Instrucciones, Schema de Acciones y Archivos del Knowledge Base) se deben extraer manualmente y configurar uno por uno en la plataforma de destino.
  * **AnythingLLM** maneja esto mediante **Workspaces** (cada Workspace equivale a un Custom GPT con su propia base de conocimiento, instrucciones y selección de modelo/agente).

### 2. ¿Gemini Gems tiene API o export format?
* **Respuesta:** No. En **2026**, no existe una API de backend ni un formato de exportación estructurado (como JSON o YAML) expuesto de forma oficial para los Gemini Gems.
* **Embed / Compartición:** 
  * No son directamente incrustables en sitios web externos mediante `<iframe>` u otros códigos.
  * Están limitados al ecosistema de la interfaz web de Gemini.
  * Google permite **compartir Gems** mediante enlaces públicos o de visualización/edición (similar a los permisos de Google Drive), pero el usuario final debe consumirlos dentro de la plataforma de Google Gemini.
  * **Fuentes/URLs:**
    * [Google Blog - Gems Sharing](https://blog.google)
    * [Chrome Unboxed - How to Share Gems](https://chromeunboxed.com)

### 3. ¿AnythingLLM o algún open-source permite importar una GPT config existente?
* **Respuesta:** No hay soporte de importación automatizada de archivos `.gpt` o configs de OpenAI ChatGPT.
* **Proceso de Equivalencia en AnythingLLM:**
  * **System Instructions:** Se copian manualmente en las configuraciones del Workspace.
  * **Knowledge Files:** Se suben al panel de carga de documentos de AnythingLLM.
  * **API Connections / Actions:** Se configuran a través del soporte de AI Agents nativo de AnythingLLM para llamadas web y herramientas.

---

## 📈 BÚSQUEDA 2: Langfuse + AnythingLLM Monitoring

### 1. ¿Cómo se integra Langfuse con AnythingLLM para monitoring en producción?
* **Respuesta:** **No existe una integración nativa o directa** (no hay un menú o checkbox en AnythingLLM para introducir llaves de Langfuse en 2026).
* **Soluciones / Workarounds de Integración:**
  * **Pasarela LiteLLM Proxy (Recomendado):**
    1. En vez de conectar AnythingLLM directamente a OpenAI/Gemini/Anthropic, se levanta una instancia local de **LiteLLM Proxy**.
    2. Se configura AnythingLLM para apuntar a la dirección del LiteLLM Proxy usando el provider de OpenAI genérico (OpenAI compatible API).
    3. LiteLLM Proxy cuenta con **integración nativa y out-of-the-box con Langfuse** (solo requiere declarar las llaves `LANGFUSE_PUBLIC_KEY` y `LANGFUSE_SECRET_KEY` en el entorno de LiteLLM).
    4. Toda la telemetría, prompts, y llamadas de AnythingLLM son interceptadas y publicadas de manera automática en Langfuse.
  * **Solo AgentGateway / Network Proxy:**
    * Un proxy a nivel de infraestructura intercepta las llamadas salientes HTTP del backend de AnythingLLM hacia las APIs de LLM y genera los traces/logs de telemetría directamente para Langfuse sin tocar el código de la aplicación.
  * **Fuentes/URLs:**
    * [LiteLLM - Logging to Langfuse](https://docs.litellm.ai)
    * [Langfuse - Integrations Hub](https://langfuse.com/docs/integrations)
    * [AnythingLLM GitHub Repository](https://github.com/Mintplex-Labs/anything-llm)

### 2. ¿Qué métricas trackea Langfuse en un chatbot RAG?
Las plataformas de observabilidad como Langfuse rastrean un conjunto integral de métricas agrupadas en:

* **Métricas de Rendimiento y Eficiencia del Sistema:**
  * **Latency:** El tiempo total de ida y vuelta para generar la respuesta, desglosado por tiempo de recuperación (retrieval) e inferencia del modelo.
  * **Token Usage & Cost:** Cuenta de tokens de entrada (prompt) y salida (completion), multiplicada por las tarifas del modelo para estimar el costo exacto por sesión/usuario.
  * **Throughput:** Volumen de peticiones por segundo en horas pico.
  * **Error Rate:** Frecuencia de timeouts de API o fallas en herramientas.

* **Métricas Semánticas y de Calidad del Modelo (RAG-specific):**
  * **Faithfulness / Groundedness:** Qué tan respaldada está la respuesta por el contexto recuperado (evita alucinaciones).
  * **Answer Relevance:** Si el bot realmente responde la pregunta original del usuario.
  * **Context Recall:** Si el motor de búsqueda vectorial de AnythingLLM recuperó toda la información necesaria dentro de los chunks.
  * **Context Precision:** La relación señal/ruido en los documentos recuperados de la base vectorial.

* **Métricas Conversacionales:**
  * **Conversation Completeness / Containment:** Si el chatbot logró resolver la intención del usuario o si el usuario abandonó frustrado.
  * **User Feedback:** Calificaciones directas de los usuarios (thumbs up/down, CSAT) correlacionadas con el trace ID en Langfuse.
  * **Persona/Role Adherence:** Verificación de que el bot no se salió de las instrucciones iniciales.

* **Fuentes/URLs:**
  * [Langfuse Observability & Metrics](https://langfuse.com/docs)
  * [LiteLLM Observability Middleware](https://litellm.ai)
