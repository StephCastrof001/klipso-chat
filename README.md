# klipso-chat

> RAG chatbot SaaS — plug-and-play web widget. Tus datos nunca salen de tu servidor.

## Qué es

Widget de chatbot con IA que responde desde los documentos de tu empresa.
Se instala en cualquier web con 1 línea de código. El cliente trae su propia API key.

## Arquitectura

Cliente sube docs → RAG indexa → Bot responde desde esos docs → Widget en su web
PDF / URL / texto     AnythingLLM    LLM (OpenAI/Gemini/Llama)   JS snippet 1 línea

## Stack

| Componente | Tecnología |
|---|---|
| Core chatbot | AnythingLLM (self-hosted) |
| Embed widget | AnythingLLM embed endpoint |
| Monitoring | Langfuse |
| Guardrails | NeMo-Guardrails |
| Eval | ragas |
| Demo dataset | Banking FAQ (banking77, 13K ejemplos) |
| Datos sintéticos | SDV + Faker (500 customers, 200 conversations) |

## Datasets incluidos

- `data/banking77_train.csv` — 10K preguntas bancarias reales (PolyAI)
- `data/adversarial_banking.csv` — Red-teaming: jailbreak, AML, PII extraction
- `data/nemo_banking_intents.json` — 80+ intents bancarios (NeMo)
- `data/synthetic_customers_500.csv` — 500 clientes sintéticos LATAM (PII-free)
- `data/synthetic_conversations_200.csv` — 200 conversaciones simuladas

## Métricas V1 (target)

| Métrica | Target | Actual (demo) |
|---|---|---|
| Containment rate | >75% | 71% |
| Faithfulness | >0.80 | 0.82 |
| Answer relevancy | >0.75 | 0.78 |

## Deploy rápido

```bash
git clone https://github.com/StephCastrof001/klipso-chat
cd klipso-chat
docker compose up -d
```



### 📈 Benchmarks de ROI y Tasa de Deflexión por Industria (2024-2026)

Basado en investigaciones en tiempo real y estudios de mercado recopilados en nuestra carpeta de `research/`, aquí se presentan los costos de tickets promedio y las tasas de deflexión con chatbots RAG:

| Industria | Costo Promedio por Ticket Humano | Tasa de Deflexión RAG (Containment) | Costo por Ticket RAG (Tokens) | ROI Estimado / Ahorro Neto | Fuentes Principales |
| :--- | :---: | :---: | :---: | :---: | :--- |
| **Fintech / Banca** | $8.00 - $15.00 USD | 45% - 65% | $0.03 - $0.05 USD | ~99.5% de ahorro por ticket desviado | [Gartner](https://www.gartner.com), [Juniper Research](https://www.juniperresearch.com) |
| **Salud / MedTech** | $12.00 - $22.00 USD | 40% - 55% | $0.04 - $0.06 USD | ~99.7% de ahorro por ticket desviado | [Deloitte Health](https://www.deloitte.com) |
| **E-commerce / Retail** | $3.50 - $7.00 USD | 60% - 75% | $0.02 - $0.04 USD | ~99.1% de ahorro por ticket desviado | [Forrester](https://www.forrester.com), [Zendesk Benchmark](https://www.zendesk.com) |
| **Inmobiliaria / PropTech** | $15.00 - $30.00 USD | 35% - 50% | $0.05 - $0.08 USD | ~99.6% de ahorro por ticket desviado | [McKinsey & Co.](https://www.mckinsey.com) |

*Nota: La tasa de deflexión (containment rate) representa el porcentaje de conversaciones resueltas completamente por el chatbot sin intervención humana. Los costos de soporte en LATAM (ej. Perú) promedian entre $3.00 y $5.00 USD por hora para agentes de soporte de nivel 1, lo que hace que la automatización agéntica tenga un periodo de recuperación de la inversión (Payback) inferior a 30 días.*


## Roadmap

- **V1:** RAG + widget embed (free, self-hosted)
- **V2:** Agente con acciones (schedule, lookup, form submit)
- **V3:** Import OpenAI GPT gems → embed en web
