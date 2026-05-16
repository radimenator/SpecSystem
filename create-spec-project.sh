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

ROOT="$HOME/SpecSystem"
TEMPLATE_DIR="$ROOT/shared/templates/project-spec"
TARGET_DIR="$ROOT/projects/$PROJECT_ID"

WIKI_PROJECT_DIR="$ROOT/shared/wiki/projects/$PROJECT_ID"
ARCHIMATE_PROJECT_DIR="$ROOT/shared/models/archimate/projects/$PROJECT_ID"

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

project_id = "$PROJECT_ID"
project_name = "$PROJECT_NAME"
today = "$TODAY"

files = [
    Path("$SPEC_FILE"),
    Path("$LINKS_FILE"),
]

for path in files:
    text = path.read_text(encoding="utf-8")
    text = text.replace("<project-id>", project_id)
    text = text.replace("<human-readable-name>", project_name)
    text = text.replace("<project>", project_id)
    text = text.replace("YYYY-MM-DD", today)
    text = text.replace("<owner>", "Radim")
    path.write_text(text, encoding="utf-8")
PY

mkdir -p "$TARGET_DIR/sources/raw"
mkdir -p "$TARGET_DIR/sources/processed"
mkdir -p "$TARGET_DIR/outputs/spec"
mkdir -p "$TARGET_DIR/outputs/oha"
mkdir -p "$TARGET_DIR/outputs/procurement"
mkdir -p "$TARGET_DIR/outputs/architecture"
mkdir -p "$TARGET_DIR/outputs/exports"

mkdir -p "$WIKI_PROJECT_DIR"

mkdir -p "$ARCHIMATE_PROJECT_DIR/generated"
mkdir -p "$ARCHIMATE_PROJECT_DIR/reference"
mkdir -p "$ARCHIMATE_PROJECT_DIR/validation"

touch "$ARCHIMATE_PROJECT_DIR/elements.yaml"
touch "$ARCHIMATE_PROJECT_DIR/relationships.yaml"
touch "$ARCHIMATE_PROJECT_DIR/views.yaml"
touch "$ARCHIMATE_PROJECT_DIR/graph.json"

for MEMORY_TYPE in architecture concepts constraints decisions entities open-questions; do
  mkdir -p "$ROOT/shared/memory/$MEMORY_TYPE"
  if [ ! -f "$ROOT/shared/memory/$MEMORY_TYPE/$PROJECT_ID.md" ]; then
    cat > "$ROOT/shared/memory/$MEMORY_TYPE/$PROJECT_ID.md" <<EOF
# $PROJECT_NAME

_Zatím nevygenerováno._
EOF
  fi
done

cat > "$WIKI_PROJECT_DIR/index.md" <<EOF
# $PROJECT_NAME

Projektový wiki prostor pro \`$PROJECT_ID\`.

Wiki není kanonická specifikace.  
Kanonická specifikace je v:

\`projects/$PROJECT_ID/\`
EOF

cat > "$WIKI_PROJECT_DIR/README.md" <<EOF
# $PROJECT_NAME Wiki

Tento adresář obsahuje projektový prostor ve společné LLM Wiki.

Primární zdroje:

- SPEC: \`projects/$PROJECT_ID/\`
- Memory: \`shared/memory/*/$PROJECT_ID.md\`
- ArchiMate model: \`shared/models/archimate/projects/$PROJECT_ID/\`
EOF

echo "Projektová specifikace vytvořena:"
echo "  $TARGET_DIR"
echo
echo "Vytvořené související prostory:"
echo "  $WIKI_PROJECT_DIR"
echo "  $ARCHIMATE_PROJECT_DIR"
echo "  $ROOT/shared/memory/*/$PROJECT_ID.md"
echo
echo "Další kroky:"
echo "  1. doplň 00-meta/spec.yaml"
echo "  2. doplň motivation, scope a architecture"
echo "  3. vygeneruj view dokument:"
echo "     ./build-spec-doc.sh $PROJECT_ID html"
echo "  4. rebuild memory:"
echo "     ./shared/scripts/rebuild-memory.sh $PROJECT_ID"