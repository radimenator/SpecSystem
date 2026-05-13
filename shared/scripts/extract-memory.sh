#!/bin/bash
set -euo pipefail

if [ $# -lt 3 ]; then
  echo "Použití: $0 <type> <project-id> <source-file>"
  echo "Typy: architecture | concepts | constraints | decisions | entities | open-questions"
  exit 1
fi

TYPE="$1"
PROJECT_ID="$2"
SOURCE_FILE="$3"

ROOT="$HOME/SpecSystem"
PROMPT="$ROOT/shared/prompts/extraction/extract-$TYPE.md"
OUTPUT_DIR="$ROOT/shared/memory/$TYPE"
OUTPUT_FILE="$OUTPUT_DIR/${PROJECT_ID}.md"

if [ ! -f "$PROMPT" ]; then
  echo "Chyba: prompt neexistuje: $PROMPT"
  exit 1
fi

if [ ! -f "$SOURCE_FILE" ]; then
  echo "Chyba: source neexistuje: $SOURCE_FILE"
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

python3 "$ROOT/shared/scripts/extract_memory.py" \
  "$TYPE" \
  "$PROJECT_ID" \
  "$PROMPT" \
  "$SOURCE_FILE" \
  "$OUTPUT_FILE"

echo "Memory updated:"
echo "  $OUTPUT_FILE"
