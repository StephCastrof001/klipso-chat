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
