#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Použití: $0 <project-id>"
  echo "Příklad: $0 spec-system"
  exit 1
fi

PROJECT_ID="$1"

ROOT="$HOME/SpecSystem"

PROJECT_DIR="$ROOT/projects/$PROJECT_ID"

WIKI_PROJECT_DIR="$ROOT/shared/wiki/projects/$PROJECT_ID"

SCRIPT="$ROOT/shared/scripts/generate_wiki_page.py"

if [ ! -d "$PROJECT_DIR" ]; then
  echo "Chyba: projekt neexistuje: $PROJECT_DIR"
  exit 1
fi

mkdir -p "$WIKI_PROJECT_DIR"

echo "======================================="
echo "Generating wiki for project:"
echo "  $PROJECT_ID"
echo "======================================="

python3 "$SCRIPT"

echo ""
echo "======================================="
echo "Generating project overview"
echo "======================================="

cat > "$WIKI_PROJECT_DIR/index.md" <<EOF
# $PROJECT_ID

## Účel

Tato stránka je generovaný wiki přehled projektu \`$PROJECT_ID\`.

Wiki není kanonická specifikace.  
Wiki je interpretační a navigační vrstva nad persistent memory a SPEC artefakty.

---

## Zdroje

- SPEC: \`projects/$PROJECT_ID/\`
- Memory: \`shared/memory/*/$PROJECT_ID.md\`
- Outputs: \`projects/$PROJECT_ID/outputs/\`

---

## Wiki oblasti

### Architektura
- [[../../systems/$PROJECT_ID]]

### Koncepty
- [[../../concepts/$PROJECT_ID]]

### Entity
- [[../../entities/$PROJECT_ID]]

---

## Persistent Memory

Memory vrstvy:

- architecture
- concepts
- constraints
- decisions
- entities
- open-questions

Memory je curated cognition layer pro dlouhodobý reasoning LLM a agentů.

---

## Traceability

Wiki stránky jsou generovány z:

Source Documents  
↓  
Extraction  
↓  
Persistent Memory  
↓  
Wiki Generation

Wiki není source of truth.

Kanonická pravda zůstává ve SPEC.

EOF

cat > "$WIKI_PROJECT_DIR/README.md" <<EOF
# $PROJECT_ID Wiki

Tento adresář obsahuje generovaný projektový wiki prostor.

Wiki:
- je interpretační vrstva,
- není kanonická SPEC,
- je generována z persistent memory.

Primární zdroje:

- SPEC:
  \`projects/$PROJECT_ID/\`

- Memory:
  \`shared/memory/\`

- Wiki generation prompts:
  \`shared/prompts/wiki/\`

- Wiki generation scripts:
  \`shared/scripts/\`

EOF

echo ""
echo "======================================="
echo "Wiki generated successfully"
echo "======================================="
echo ""
echo "Project wiki:"
echo "  $WIKI_PROJECT_DIR"
echo ""
echo "Global generated pages:"
echo "  $ROOT/shared/wiki/systems/"
echo "  $ROOT/shared/wiki/concepts/"
echo "  $ROOT/shared/wiki/entities/"
echo ""