# 🚀 Arquitectura y Funcionamiento de klipso-chat

Esta guía proporciona un desglose técnico y paso a paso de la arquitectura, configuración, conjuntos de datos y flujos de evaluación para **klipso-chat**.

---

## 💎 1. Arquitectura y Stack Tecnológico

**klipso-chat** está construido con un enfoque de privacidad extrema e independencia en la nube (Self-hosted). Todos los servicios se ejecutan de manera local dentro de contenedores en el servidor EC2 (`107.21.24.49`):

*   **Core Chatbot (AnythingLLM)**: Orquestador central del RAG, encargado de gestionar los almacenes de vectores (Vector DB nativo), procesar documentos cargados y exponer endpoints para el frontend y la API.
*   **Inferencia LLM Local (Ollama - qwen3:8b)**: Modelo de lenguaje local de 8 mil millones de parámetros optimizado para diálogos instruccionales y multilingües, ejecutándose en el servidor sin transferir datos a APIs de terceros.
*   **Embeddings locales (all-MiniLM-L6-v2)**: Generación de embeddings densos de forma local para indexación semántica en tiempo real.
*   **Monitoreo (Langfuse)**: Trazabilidad completa de prompts, latencias, costos de tokens y flujos agénticos/RAG en producción.
*   **Guardrails (NeMo Guardrails)**: Capa de alineación de seguridad bancaria, prevención de PII (información de identificación personal), jailbreaks y control de tópicos conversacionales.

---

## 🛠️ 2. Workspaces Creados

### `klipso-banca`
Workspace principal optimizado para responder consultas financieras y de atención al cliente bancario.
*   **System Prompt Activo**:
    ```text
    Responde siempre en el idioma en que te escriban.
    Si el usuario escribe en español → responde en español.
    Si el usuario escribe en English → respond in English.
    Mantén siempre el rol de asistente bancario.
    ```
*   **Embedding Engine**: Local `all-MiniLM-L6-v2`.
*   **LLM de Conversación**: Ollama `qwen3:8b`.
*   **Configuración de Búsqueda**: Top-N = 4 chunks, umbral de similitud = 0.25.

---

## 📊 3. Datasets Utilizados y Fuentes

| Dataset | Propósito | Fuente / Origen |
| :--- | :--- | :--- |
| **`data/banking77_train.csv`** | Base de conocimientos RAG y evaluación RAG. 10,000 preguntas reales de banca comercial clasificadas en 77 intenciones. | [PolyAI Banking77 (HuggingFace)](https://huggingface.co/datasets/PolyAI/banking77) |
| **`data/adversarial_banking.csv`** | Pruebas de Red-Teaming y robustez del modelo frente a ataques. | Curado para pruebas de inyección/jailbreak |
| **`data/synthetic_customers_500.csv`** | 500 perfiles de clientes de prueba sin PII real. | Generado sintéticamente con Faker + SDV |
| **`data/synthetic_conversations_200.csv`** | 200 historiales de chat simulados para análisis de flujos conversacionales complejos. | Generado sintéticamente con Faker + LLMs |
| **`data/salud/healthcare_faq.csv`** | Preguntas y respuestas frecuentes de atención médica (citas, recetas, laboratorio) para demostración multisector. | Sintético estructurado con estructura similar a `banking77` |
| **`data/ecommerce/ecommerce_faq.csv`** | Consultas frecuentes de comercio electrónico (envíos, devoluciones, cupones, tracking) para demostración multisector. | Sintético estructurado con estructura similar a `banking77` |

---

## 🔌 4. Integración del Embed Widget

Para integrar el chatbot en cualquier página web, AnythingLLM expone un widget embeddable en JavaScript que se inserta con solo una línea de código.

*   **Embed ID Activo**: `7decfa29-79dc-40d1-ad84-66b71368347c`
*   **Código de Integración** (`embed-demo/index.html`):

```html
<!-- Widget interactivo de klipso-chat -->
<script
  src="http://107.21.24.49:3001/embed/anythingllm-chat-widget.min.js"
  data-embed-id="7decfa29-79dc-40d1-ad84-66b71368347c"
></script>
```

---

## 🏃 5. Evaluación del RAG (Pipeline de Eval)

El motor de evaluación comprueba la precisión de las respuestas generadas mediante una estrategia de emparejamiento de palabras clave semánticas en español e inglés.

### Cómo ejecutar la evaluación:
Navega al directorio del proyecto y ejecuta:

```bash
python3 eval/run_eval.py
```

### Características del Script de Evaluación:
1.  **Muestreo Determinista**: Selecciona 20 preguntas que representan de manera uniforme **20 categorías bancarias distintas** de `banking77`.
2.  **Inferencia Segura (Anti-Overload)**: 
    *   Timeout extendido a **120 segundos** para tolerar tiempos de inferencia en CPU o cargas pesadas en el servidor.
    *   Pausa de enfriamiento de **3 segundos** (`time.sleep(3)`) entre llamadas de la API para estabilizar la memoria VRAM.
3.  **Mapeo de Sinónimos**: Valida palabras clave clave en inglés y español para calcular la **Containment Rate** (Tasa de contención).
4.  **Reporte Automatizado**: Al finalizar, escribe un reporte JSON detallado en `eval/eval_report.json` que registra cada prompt, respuesta recibida y si se consideró una respuesta exitosa.

---

## 🔑 6. Variables de Entorno Necesarias

Para desplegar y configurar el pipeline completo, se requieren las siguientes variables de entorno en el archivo `.env` del servidor:

```env
# Configuración del Core Chatbot (AnythingLLM)
ANYTHINGLLM_API_KEY=your_anythingllm_api_bearer_token_here
ANYTHINGLLM_WORKSPACE_URL=http://localhost:3001/api/v1/workspace/klipso-banca

# Configuración del Motor de Inferencia
OLLAMA_HOST=http://localhost:11434
LLM_MODEL_NAME=qwen3:8b

# Configuración del Sistema de Trazabilidad y Monitoreo (Langfuse)
LANGFUSE_PUBLIC_KEY=your_langfuse_public_key_here
LANGFUSE_SECRET_KEY=your_langfuse_secret_key_here
LANGFUSE_HOST=http://localhost:3002

# Configuración de Extracción de Datos y Research (Firecrawl)
FIRECRAWL_API_KEY=your_firecrawl_api_key_here
```

*Nota: Por motivos de seguridad de la infraestructura bancaria, los valores reales de producción se inyectan a través de las variables de entorno del sistema operativo en el host EC2 y nunca deben ser expuestos en el código fuente ni subidos al repositorio git.*
