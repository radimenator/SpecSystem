#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Použití: $0 <project-id> [human-readable-name]"
  echo "Příklad: $0 tech-radar"
  echo "Příklad: $0 tech-radar \"Tech Radar\""
  exit 1
fi

PROJECT_ID="$1"
PROJECT_NAME="${2:-$1}"

if [[ ! "$PROJECT_ID" =~ ^[a-z0-9]+(-[a-z0-9]+)*$ ]]; then
  echo "Chyba: project-id musí být v kebab-case, např. tech-radar"
  exit 1
fi

TEMPLATE_DIR="$HOME/SpecSystem/templates/project-spec"
TARGET_DIR="$HOME/SpecSystem/projects/$PROJECT_ID"
TODAY="$(date +%F)"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Chyba: template neexistuje: $TEMPLATE_DIR"
  exit 1
fi

if [ -e "$TARGET_DIR" ]; then
  echo "Chyba: cílový adresář už existuje: $TARGET_DIR"
  exit 1
fi

cp -R "$TEMPLATE_DIR" "$TARGET_DIR"

SPEC_FILE="$TARGET_DIR/00-meta/spec.yaml"
LINKS_FILE="$TARGET_DIR/60-links/implementation-links.yaml"

if [ ! -f "$SPEC_FILE" ]; then
  echo "Chyba: chybí soubor $SPEC_FILE"
  exit 1
fi

if [ ! -f "$LINKS_FILE" ]; then
  echo "Chyba: chybí soubor $LINKS_FILE"
  exit 1
fi

python3 <<PY
from pathlib import Path

spec_file = Path("$SPEC_FILE")
links_file = Path("$LINKS_FILE")

spec_text = spec_file.read_text(encoding="utf-8")
spec_text = spec_text.replace("<project-id>", "$PROJECT_ID")
spec_text = spec_text.replace("<human-readable-name>", "$PROJECT_NAME")
spec_text = spec_text.replace("YYYY-MM-DD", "$TODAY", 2)
spec_text = spec_text.replace("<owner>", "Radim")
spec_file.write_text(spec_text, encoding="utf-8")

links_text = links_file.read_text(encoding="utf-8")
links_text = links_text.replace("<project>", "$PROJECT_ID")
links_file.write_text(links_text, encoding="utf-8")
PY

mkdir -p "$TARGET_DIR/dist"

echo "Projektová specifikace vytvořena:"
echo "  $TARGET_DIR"
echo
echo "Další kroky:"
echo "  1. doplň Roam project v 00-meta/spec.yaml"
echo "  2. doplň motivation, scope a architecture"
echo "  3. vygeneruj view dokument:"
echo "     ~/SpecSystem/build-spec-doc.sh $PROJECT_ID html"
