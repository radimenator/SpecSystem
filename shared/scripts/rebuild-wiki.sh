#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Použití: $0 <project-id>"
  exit 1
fi

PROJECT_ID="$1"

echo "=== Wiki rebuild: $PROJECT_ID ==="

echo
echo "[1/3] Architecture"
./shared/scripts/ingest-source.sh \
  "$PROJECT_ID" \
  "projects/$PROJECT_ID/30-architecture/architecture.md"

echo
echo "[2/3] Scope"
./shared/scripts/ingest-source.sh \
  "$PROJECT_ID" \
  "projects/$PROJECT_ID/20-scope/scope.md"

echo
echo "[3/3] Decisions"
./shared/scripts/ingest-source.sh \
  "$PROJECT_ID" \
  "projects/$PROJECT_ID/50-decisions/decisions.md"

echo
echo "Wiki rebuild completed."
