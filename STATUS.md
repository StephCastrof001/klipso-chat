# klipso-chat — Estado actual [19 de Mayo, 2026]

## Qué está corriendo
El servidor EC2 (`107.21.24.49`) tiene los siguientes servicios Docker activos y saludables:

1. **AnythingLLM (Core Chatbot & RAG)**:
   - **Contenedor**: `anythingllm` (imagen: `anythingllm-anything-llm`)
   - **Puerto expuesto**: `3001` (UP y escuchando en `0.0.0.0:3001`)
   - **Estado**: Saludable (Up 15 hours, healthy)
2. **Langfuse (Monitoreo e Inferencia de Trazabilidad)**:
   - **Puerto expuesto**: `3002` (UI en `0.0.0.0:3002`)
   - **Contenedores de infraestructura de soporte**:
     - `langfuse-langfuse-web-1` (Web UI/Server)
     - `langfuse-langfuse-worker-1` (Background tasks/worker)
     - `langfuse-postgres-1` (Base de datos relacional para analíticas)
     - `langfuse-redis-1` (Caché y colas de tareas)
     - `langfuse-clickhouse-1` (Motor de analíticas OLAP para trazabilidad masiva)
     - `langfuse-minio-1` (Almacenamiento de objetos S3 compatible expuesto en `9090`)
3. **OpenHands (Entorno de Agente Autónomo)**:
   - **Contenedor**: `openhands` (imagen: `ghcr.io/all-hands-ai/openhands:latest`)
   - **Estado**: Activo (Up 40 hours)

---

## Sectores cubiertos
Actualmente, el chatbot en producción está configurado exclusivamente para:

- **Fintech / Banca (Banking & Finance)**:
  - Base de conocimientos basada en preguntas y respuestas bancarias reales.
  - Intents canónicos configurados para la mitigación y detección de off-topic bancarios.
  
*Nota: Se ha consolidado una investigación y especificación de datasets para la expansión futura en Salud, E-commerce, PropTech (Inmobiliaria) y Recursos Humanos en `data/datasets_by_industry.md`, pero estos sectores aún **no están activos** en los workspaces de RAG.*

---

## Datasets disponibles
El directorio `data/` del repositorio contiene los siguientes recursos de datos:

1. **`data/banking77_train.csv`** (857 KB, modificado el 18 de mayo a las 15:57)
   - **Contenido**: 10,000 preguntas reales de atención al cliente bancario clasificadas en 77 categorías (procedente de PolyAI). Sirve como base de conocimientos principal del bot bancario.
2. **`data/synthetic_customers_500.csv`** (97.8 KB, modificado el 18 de mayo a las 16:11)
   - **Contenido**: 500 registros sintéticos de clientes de LATAM (ciudades como Lima, Bogotá, CDMX, Santiago, Buenos Aires) generados con `Faker`. Incluye PII sintética, uso del bot, planes (`free`/`paid`), número de documentos subidos y su respectiva tasa de contención individual.
3. **`data/synthetic_conversations_200.csv`** (12.2 KB, modificado el 18 de mayo a las 16:11)
   - **Contenido**: 200 transcripciones de conversaciones simuladas de clientes con el chatbot para realizar auditorías cualitativas del tono y la resolución de tickets.
4. **`data/nemo_banking_intents.json`** (5.1 KB, modificado el 18 de mayo a las 07:34)
   - **Contenido**: Lista de 80+ intents bancarios canónicos para el mapeo y categorización de flujos de diálogo bajo NeMo Guardrails.
5. **`data/datasets_by_industry.md`** (8.2 KB, modificado el 18 de mayo a las 15:41)
   - **Contenido**: Especificación estructurada de datasets abiertos de alta calidad en Hugging Face y Kaggle recomendados para expandir RAG a las industrias de Salud, E-commerce, Inmobiliaria y RRHH.

---

## Lo que falta para que el bot responda correctamente (Gaps Honestos)
Durante la auditoría del repositorio se identificaron los siguientes gaps críticos para lograr que el bot responda de forma interactiva y correcta en producción:

1. **Simulación en la Evaluación (`eval/run_eval.py`)**:
   - **Brecha**: El script de evaluación actualmente genera un reporte estático `eval_report.json` con métricas duras (`containment_rate: 71%`, `faithfulness: 0.82`) y una lista fija de 5 preguntas de prueba ("Golden Dataset").
   - **Impacto**: **No realiza consultas dinámicas reales** al API de AnythingLLM. El reporte de evaluación no refleja cambios reales en la base de conocimientos o el modelo del LLM subyacente.
2. **Falta de Integración Activa de Guardrails (`guardrails/`)**:
   - **Brecha**: Los archivos `config.yml` y `off_topic.co` especifican las reglas lógicas para evitar temas no deseados y jailbreaks usando NeMo Guardrails, pero no hay un middleware de servidor de NeMo configurado ni activo que intercepte y filtre las preguntas/respuestas reales.
3. **Widget Desconectado en el Demo (`embed-demo/index.html`)**:
   - **Brecha**: El archivo HTML de demostración contiene el script del widget embed de AnythingLLM comentado y con un ID de marcador de posición (`YOUR_EMBED_ID`). 
   - **Impacto**: El widget flotante de chat no funciona de forma interactiva en la demo local porque requiere configurar el workspace del embed en AnythingLLM y vincular el token de acceso real.
4. **Ausencia de Ingesta Multi-Industria**:
   - **Brecha**: Aunque la investigación en `data/datasets_by_industry.md` es excelente, no se han descargado, procesado o subido los documentos reales de las industrias propuestas (Salud, Retail, PropTech) en workspaces independientes de AnythingLLM.

---

## Próximos pasos sugeridos

1. **Conectar el Evaluador con AnythingLLM**:
   - Modificar `eval/run_eval.py` para usar `requests` y enviar consultas reales al endpoint de chat de AnythingLLM (`http://localhost:3001/api/v1/workspace/{slug}/chat`).
   - Usar un LLM evaluador (vía API o local en Ollama) para calificar la relevancia de la respuesta real y la fidelidad del bot basándose en los textos indexados en el RAG en lugar de métricas fijas.
2. **Activar el Widget de Chat en el Demo**:
   - Acceder al portal administrativo de AnythingLLM en `http://107.21.24.49:3001` (o localmente mediante SSH port-forwarding).
   - Crear un Workspace llamado `Klipso-Banca`, subir y vectorizar `data/banking77_train.csv` (o un subconjunto limpio en formato `.txt`).
   - Habilitar los "Embeds" en la configuración del workspace, copiar el token del embed y pegarlo en `embed-demo/index.html` para habilitar el widget de chat interactivo real.
3. **Implementar el Middleware de NeMo Guardrails**:
   - Crear un wrapper en Python o Node.js que reciba la consulta del usuario, la valide contra el motor de NeMo Guardrails (usando `guardrails/config.yml` y `guardrails/off_topic.co`), y solo si pasa, la envíe a AnythingLLM.
4. **Automatizar la Ingesta de Datos Multi-Industria**:
   - Escribir scripts en `scripts/` que descarguen automáticamente los datasets recomendados de Hugging Face (por ejemplo, `VictorOntiveros/real-estate-assistant` para inmobiliaria) y generen archivos `.txt` o `.pdf` limpios listos para cargar en AnythingLLM.
