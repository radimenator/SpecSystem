#!/bin/bash
set -euo pipefail

if [ $# -lt 2 ]; then
  echo "Použití:"
  echo "  $0 <project-id> <markdown-file>"
  exit 1
fi

PROJECT_ID="$1"
SOURCE_FILE="$2"

BASENAME=$(basename "$SOURCE_FILE" .md)

TMP_DIR="/tmp/specsystem-chunks-$BASENAME"

rm -rf "$TMP_DIR"
mkdir -p "$TMP_DIR"

python3 "$HOME/SpecSystem/shared/scripts/chunk_markdown.py" \
  "$SOURCE_FILE" \
  "$TMP_DIR"

OUTPUT_DIR="$HOME/SpecSystem/shared/wiki/projects/$PROJECT_ID/$BASENAME"

mkdir -p "$OUTPUT_DIR"

for chunk in "$TMP_DIR"/*.md; do
  echo "Ingesting: $chunk"

  ./shared/scripts/ingest-source.sh \
    "$PROJECT_ID" \
    "$chunk"

  GENERATED=$(basename "$chunk")

  mv \
    "$HOME/SpecSystem/shared/wiki/projects/$PROJECT_ID/$GENERATED" \
    "$OUTPUT_DIR/$GENERATED"
done

echo ""
echo "Wiki chunks created in:"
echo "  $OUTPUT_DIR"
