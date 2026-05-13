#!/bin/bash
set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Použití: $0 <project-id>"
  exit 1
fi

PROJECT_ID="$1"
BASE="projects/$PROJECT_ID"

./shared/scripts/extract-memory.sh architecture "$PROJECT_ID" "$BASE/30-architecture/architecture.md"
./shared/scripts/extract-memory.sh concepts "$PROJECT_ID" "$BASE/20-scope/scope.md"
./shared/scripts/extract-memory.sh concepts "$PROJECT_ID" "$BASE/30-architecture/architecture.md"
./shared/scripts/extract-memory.sh constraints "$PROJECT_ID" "$BASE/30-architecture/architecture.md"
./shared/scripts/extract-memory.sh decisions "$PROJECT_ID" "$BASE/50-decisions/decisions.md"
./shared/scripts/extract-memory.sh entities "$PROJECT_ID" "$BASE/30-architecture/architecture.md"
./shared/scripts/extract-memory.sh open-questions "$PROJECT_ID" "$BASE/20-scope/scope.md"

echo "Memory rebuild completed for: $PROJECT_ID"
