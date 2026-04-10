#!/bin/bash

set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Použití: $0 <project-id>"
  echo "Příklad: $0 tech-radar"
  exit 1
fi

PROJECT_ID="$1"
BASE_DIR="$HOME/SpecSystem/projects/$PROJECT_ID"

if [ -e "$BASE_DIR" ]; then
  echo "Chyba: adresář už existuje: $BASE_DIR"
  exit 1
fi

echo "Zakládám strukturu pro projekt: $PROJECT_ID"
mkdir -p "$BASE_DIR"/{00-meta,10-motivation,20-scope,30-architecture,40-components,50-decisions,60-links,70-regeneration,80-history}

cat > "$BASE_DIR/00-meta/spec.yaml" <<EOF
meta:
  id: $PROJECT_ID
  name: $PROJECT_ID
  type: project
  status: draft
  owner: Radim
  canonical_version: 0.1
  created: $(date +%F)
  updated: $(date +%F)

links:
  roam_project: ""
  code_repositories: []
  related_specs: []
EOF

touch "$BASE_DIR/10-motivation/motivation.yaml"
touch "$BASE_DIR/20-scope/scope.md"
touch "$BASE_DIR/30-architecture/architecture.md"
touch "$BASE_DIR/40-components/components.yaml"
touch "$BASE_DIR/50-decisions/decisions.md"
touch "$BASE_DIR/60-links/implementation-links.yaml"
touch "$BASE_DIR/70-regeneration/regeneration.md"
touch "$BASE_DIR/80-history/history.md"

echo "# $PROJECT_ID" > "$BASE_DIR/20-scope/scope.md"
echo "# Architektura" > "$BASE_DIR/30-architecture/architecture.md"
echo "# Rozhodnutí" > "$BASE_DIR/50-decisions/decisions.md"
echo "# Regenerace" > "$BASE_DIR/70-regeneration/regeneration.md"
echo "# Historie" > "$BASE_DIR/80-history/history.md"

echo "Hotovo:"
echo "  $BASE_DIR"
