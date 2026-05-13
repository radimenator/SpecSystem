#!/bin/bash
set -euo pipefail

cd "$HOME/SpecSystem"

LOG="$HOME/SpecSystem/local/logs/nightly-rebuild-memory.log"

pgrep -x ollama >/dev/null || ollama serve &
sleep 5

{
  echo "======================================"
  echo "Nightly rebuild started: $(date)"
  echo "======================================"

  for PROJECT_DIR in projects/*; do
    if [ -d "$PROJECT_DIR" ]; then
      PROJECT_ID=$(basename "$PROJECT_DIR")

      echo
      echo "Rebuilding memory for: $PROJECT_ID"

      ./shared/scripts/rebuild-memory.sh "$PROJECT_ID"
    fi
  done

  echo
  echo "======================================"
  echo "Nightly rebuild completed: $(date)"
  echo "======================================"
  echo

} >> "$LOG" 2>&1
