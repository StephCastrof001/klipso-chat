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

## Roadmap

- **V1:** RAG + widget embed (free, self-hosted)
- **V2:** Agente con acciones (schedule, lookup, form submit)
- **V3:** Import OpenAI GPT gems → embed en web
