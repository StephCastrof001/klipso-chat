#!/bin/bash
set -e

LOG_FILE="/home/ubuntu/klipso-chat/logs/$(date +%Y%m%d)_overnight.log"
FOLLOWER_LOG="/home/ubuntu/klipso-chat/logs/$(date +%Y%m%d)_follower.log"

log() {
    echo -e "[$(date -u +'%Y-%m-%dT%H:%M:%SZ')] $1" | tee -a "$FOLLOWER_LOG"
}

log "=== STARTING OVERNIGHT FOLLOWER ==="

# Wait until the main overnight log contains "OVERNIGHT RUNNER PROCESS COMPLETE"
log "Waiting for main overnight runner to complete..."
while true; do
    if [ -f "$LOG_FILE" ] && grep -q "OVERNIGHT RUNNER PROCESS COMPLETE" "$LOG_FILE"; then
        log "Main overnight runner has completed! Starting Task 011 through Task 015..."
        break
    fi
    sleep 30
done

# ======================================================
# TASK-011 — Worktrees para desarrollo paralelo
# ======================================================
log "--- TASK-011: Worktrees para desarrollo paralelo ---"
cd /home/ubuntu/klipso-chat

# Add worktrees safely using fallbacks
if [ ! -d ../klipso-chat-embed ]; then
    log "Creating embed-widget worktree..."
    git worktree add -b feature/embed-widget ../klipso-chat-embed || git worktree add ../klipso-chat-embed feature/embed-widget || log "Embed worktree failed."
fi

if [ ! -d ../klipso-chat-eval ]; then
    log "Creating eval-pipeline worktree..."
    git worktree add -b feature/eval-pipeline ../klipso-chat-eval || git worktree add ../klipso-chat-eval feature/eval-pipeline || log "Eval worktree failed."
fi

if [ ! -d ../klipso-chat-guardrails ]; then
    log "Creating guardrails worktree..."
    git worktree add -b feature/guardrails ../klipso-chat-guardrails || git worktree add ../klipso-chat-guardrails feature/guardrails || log "Guardrails worktree failed."
fi

log "Worktrees creados:" >> "$LOG_FILE"
git worktree list >> "$LOG_FILE"
log "TASK-011 COMPLETE."

# ======================================================
# TASK-012 — Clonar y estudiar backend de competencia
# ======================================================
log "--- TASK-012: Clonar y estudiar backend de competencia ---"
mkdir -p /home/ubuntu/klipso-chat/competitive
cd /home/ubuntu/klipso-chat/competitive

log "Cloning Flowise AI repository..."
git clone --depth=1 https://github.com/FlowiseAI/Flowise flowise >> "$FOLLOWER_LOG" 2>&1

log "Cloning AnythingLLM embed widget repository..."
git clone --depth=1 https://github.com/Mintplex-Labs/anythingllm-embed anythingllm-embed >> "$FOLLOWER_LOG" 2>&1

# Extraer patrones clave del backend de Flowise
log "Extracting competitive key patterns..."
echo "=== FLOWISE STRUCTURE ===" > /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
if [ -d flowise/packages ]; then
    ls flowise/packages/ >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
else
    echo "No packages dir found" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
fi

echo "" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
echo "=== FLOWISE API ROUTES ===" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
find flowise -name "*.ts" -path "*/routes/*" | head -n 20 >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md

echo "" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
echo "=== ANYTHINGLLM EMBED WIDGET ===" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
if [ -f anythingllm-embed/README.md ]; then
    cat anythingllm-embed/README.md | head -n 80 >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
else
    echo "No README found" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
fi

echo "" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
echo "=== FLOWISE PRICING MODEL CODE ===" >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md
find flowise -name "*.ts" | xargs grep -l "pricing\|subscription\|plan\|limit" 2>/dev/null | head -n 10 >> /home/ubuntu/klipso-chat/competitive/BACKEND_ANALYSIS.md

# Commit competitive analysis
log "Committing and pushing competitive analysis..."
cd /home/ubuntu/klipso-chat
git add competitive/
git commit -m "feat: competitive backend analysis — Flowise + AnythingLLM embed" || log "Nothing new to commit."

# Setup credentials helper
gh auth setup-git >> "$FOLLOWER_LOG" 2>&1
git push origin main >> "$FOLLOWER_LOG" 2>&1
log "TASK-012 COMPLETE."

# ======================================================
# TASK-013 — CLAUDE.md para que Claude Code entienda klipso-chat
# ======================================================
log "--- TASK-013: CLAUDE.md para que Claude Code entienda klipso-chat ---"
cd /home/ubuntu/klipso-chat

cat > /home/ubuntu/klipso-chat/CLAUDE.md << 'EOF'
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
EOF

git add CLAUDE.md
git commit -m "docs: add CLAUDE.md for agentic loop context" || log "CLAUDE.md commit skipped."
git push origin main >> "$FOLLOWER_LOG" 2>&1
log "TASK-013 COMPLETE."

# ======================================================
# TASK-014 — CodeRabbit config
# ======================================================
log "--- TASK-014: CodeRabbit config ---"
cd /home/ubuntu/klipso-chat

cat > /home/ubuntu/klipso-chat/.coderabbit.yml << 'EOF'
language: es
reviews:
  profile: assertive
  request_changes_workflow: true
  high_level_summary: true
  poem: false
  review_status: true
  path_filters:
    - "!**/logs/**"
    - "!**/data/**"
    - "!**/*.csv"
  auto_review:
    enabled: true
    drafts: false
chat:
  auto_reply: true
EOF

git add .coderabbit.yml
git commit -m "ci: add CodeRabbit config for agentic loop reviews" || log "CodeRabbit config commit skipped."
git push origin main >> "$FOLLOWER_LOG" 2>&1
log "TASK-014 COMPLETE."

# ======================================================
# TASK-015 — Conectar klipso-chat al bucle agéntico
# ======================================================
log "--- TASK-015: Conectar klipso-chat al bucle agéntico ---"
mkdir -p /home/ubuntu/queue

cat > /home/ubuntu/queue/KLIPSO-001_embed_widget.md << 'EOF'
# TASK: klipso-001-embed-widget

GOAL: Crear página HTML de demo funcional del embed widget de AnythingLLM
FILES: ~/klipso-chat-embed/embed-demo/index.html
CONTRACT: HTML válido que carga el widget de AnythingLLM desde localhost:3001
DONE WHEN: curl localhost:3001/api/ping devuelve online AND index.html referencia el embed script
ROLLBACK: git revert HEAD

# MODEL: ollama/qwen35u-tools:9b
EOF

log "TASK-015 COMPLETE — Primera Unit en queue lista para crew_hive.py"
log "=== FOLLOWER PROCESS COMPLETE ==="
