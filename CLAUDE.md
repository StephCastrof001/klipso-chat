# klipso-chat — CLAUDE.md

## Stack
- Core: AnythingLLM (Docker, puerto 3001)
- Monitoring: Langfuse (Docker, puerto 3002)
- Guardrails: NeMo-Guardrails
- Eval: ragas
- Datos: banking77, adversarial_banking, synthetic_customers_500

## Comandos clave
docker compose up -d                    # levantar AnythingLLM
tail -f ~/klipso-chat/logs/*.log        # ver progreso
python3 scripts/gen_synthetic.py        # regenerar datos sintéticos
python3 eval/run_eval.py               # correr evaluación

## Worktrees
../klipso-chat-embed       → feature/embed-widget
../klipso-chat-eval        → feature/eval-pipeline
../klipso-chat-guardrails  → feature/guardrails

## Governance (HIS)
Reviewer: CodeRabbit (automático en cada PR)
Agentic loop: ~/orquestacion_claude/crew_hive.py
Queue: ~/queue/ → ~/done/

## Reglas
- No editar main directamente — usar worktrees
- Cada feature = 1 worktree = 1 PR = CodeRabbit review
- Tests de eval antes de merge


## Criterios de Éxito — cómo saber si el trabajo funcionó

### El bot funciona cuando:
- Responde 5 preguntas del banking77 dataset correctamente
- Rechaza al menos 1 pregunta del adversarial_banking.csv (jailbreak)
- Containment rate > 60% en eval/run_eval.py
- curl localhost:3001/api/ping devuelve {"online":true}

### El repo está listo para visibilidad cuando:
- README tiene screenshot del bot respondiendo
- ROI table tiene fuentes reales citadas
- Un extraño entiende el producto en 2 minutos leyendo el README
- github.com/StephCastrof001/klipso-chat tiene >5 commits

### El ciclo agéntico funciona cuando:
- crew_hive.py toma KLIPSO-001 de ~/queue/ y lo ejecuta sin error
- CodeRabbit comenta en el primer PR abierto
- CI/CD bloquea un PR con containment_rate < 60%

### El proyecto de visibilidad cumplió su objetivo cuando:
- Alguien pregunta "¿cómo construiste esto?" y tienes la respuesta documentada
- Puedes explicar 3 decisiones de producto con su trade-off en 90 segundos
