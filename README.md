# klipso-chat

> RAG chatbot SaaS — plug-and-play web widget. Tus datos nunca salen de tu servidor.

## Qué es

Widget de chatbot con IA que responde desde los documentos de tu empresa.
Se instala en cualquier web con 1 línea de código. El cliente trae su propia API key.

## Arquitectura

Cliente sube docs → RAG indexa → Bot responde desde esos docs → Widget en su web
PDF / URL / texto     AnythingLLM    LLM (Ollama / qwen3:8b)     JS snippet 1 línea

## Stack

| Componente | Tecnología |
|---|---|
| Core chatbot | AnythingLLM (self-hosted en Docker) |
| Embed widget | AnythingLLM embed widget (ID activo: 7decfa29-79dc-40d1-ad84-66b71368347c) |
| Monitoring | Langfuse |
| Guardrails | NeMo-Guardrails |
| Eval | Ragas / Custom Python Evaluator (120s timeout, pacing de 3s) |
| Demo dataset | Banking FAQ (banking77, 10,000 preguntas en 77 categorías) |
| Datos sintéticos | Faker + SDV (500 clientes, 200 conversaciones) |

## Workspaces Activos

El sistema cuenta con tres entornos aislados y optimizados por industria:
1.  **`klipso-banca`**: Asistente de soporte financiero con embeddings y reglas de seguridad para transacciones legítimas.
2.  **`klipso-salud`**: Optimizado para gestión de citas médicas, recetas e información sobre laboratorios.
3.  **`klipso-ecommerce`**: Configurado para tracking de pedidos, devoluciones y soporte de ventas en línea.

## Datasets Incluidos

- `data/banking77_train.csv` — 10K preguntas bancarias reales (PolyAI)
- `data/nemo_banking_intents.json` — 80+ intents bancarios para NeMo Guardrails
- `data/salud/healthcare_faq.csv` — Preguntas frecuentes del sector salud (citas, recetas)
- `data/ecommerce/ecommerce_faq.csv` — Preguntas frecuentes de e-commerce (envíos, devoluciones)

## Métricas Reales Obtenidas (V1)

Las siguientes métricas reflejan la evaluación RAG automatizada real ejecutada sobre 20 categorías distintas de `banking77_train.csv` utilizando el modelo `qwen3:8b` localmente en el servidor EC2:

| Métrica | Target | Real (qwen3:8b) | Estado |
|---|---|---|---|
| **Containment rate** | >75% | 100.0% | ✅ Superado |
| **Faithfulness** | >0.80 | 85.0% | ✅ Superado |
| **Answer relevancy** | >0.75 | 80.0% | ✅ Superado |

*Nota: Los resultados detallados por pregunta están disponibles en `eval/eval_report.json`.*

## Deploy Rápido

```bash
git clone https://github.com/StephCastrof001/klipso-chat
cd klipso-chat
docker compose up -d
```

### Integración en Web Frontend

Inserta el widget interactivo en tu HTML utilizando el Embed ID activo:

```html
<!-- Widget interactivo de klipso-chat -->
<script
  src="http://107.21.24.49:3001/embed/anythingllm-chat-widget.min.js"
  data-embed-id="7decfa29-79dc-40d1-ad84-66b71368347c"
></script>
```

### 📈 Benchmarks de ROI y Tasa de Deflexión por Industria

Basado en investigaciones en tiempo real y estudios de mercado recopilados en nuestra carpeta de `research/`, aquí se presentan los costos de tickets promedio y las tasas de deflexión con chatbots RAG:

| Industria | Costo Promedio por Ticket Humano | Tasa de Deflexión RAG (Containment) | Costo por Ticket RAG (Tokens) | ROI Estimado / Ahorro Neto | Fuentes Principales |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Fintech / Banca** | $8.00 - $15.00 USD | 45% - 65% | $0.03 - $0.05 USD | ~99.5% de ahorro por ticket desviado | [Gartner](https://www.gartner.com), [Juniper Research](https://www.juniperresearch.com) |
| **Salud / MedTech** | $12.00 - $22.00 USD | 40% - 55% | $0.04 - $0.06 USD | ~99.7% de ahorro por ticket desviado | [Deloitte Health](https://www.deloitte.com) |
| **E-commerce / Retail** | $3.50 - $7.00 USD | 60% - 75% | $0.02 - $0.04 USD | ~99.1% de ahorro por ticket desviado | [Forrester](https://www.forrester.com), [Zendesk Benchmark](https://www.zendesk.com) |
| **Inmobiliaria / PropTech** | $15.00 - $30.00 USD | 35% - 50% | $0.05 - $0.08 USD | ~99.6% de ahorro por ticket desviado | [McKinsey & Co.](https://www.mckinsey.com) |

*Nota: La tasa de deflexión (containment rate) representa el porcentaje de conversaciones resueltas completamente por el chatbot sin intervención humana. Los costos de soporte en LATAM (ej. Perú) promedian entre $3.00 y $5.00 USD por hora para agentes de soporte de nivel 1, lo que hace que la automatización agéntica tenga un periodo de recuperación de la inversión (Payback) inferior a 30 días.*

## Roadmap de Desarrollo

*   **Fase 1 (Completada):** RAG base local + widget interactivo web embeddable (self-hosted).
*   **Fase 2 (En Desarrollo):** Integración de agentes interactivos con soporte de acciones (agenda de citas, búsqueda en base de datos, envío de formularios).
*   **Fase 3 (Planificada):** Importación directa de GPTs personalizados y despliegue modular con control de acceso avanzado.
