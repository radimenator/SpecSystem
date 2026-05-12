#!/bin/bash
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Použití: $0 <project-id> <source-file>"
  echo "Příklad: $0 spec-system projects/spec-system/sources/raw/test.md"
  exit 1
fi

PROJECT_ID="$1"
SOURCE_FILE="$2"

python3 "$HOME/SpecSystem/shared/scripts/wiki_ingest.py" "$PROJECT_ID" "$SOURCE_FILE"
