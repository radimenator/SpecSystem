#!/bin/bash

set -euo pipefail

if [ $# -lt 1 ]; then
  echo "Použití: $0 <project-id> [format]"
  echo "Příklad: $0 tech-radar"
  echo "Příklad: $0 tech-radar all"
  echo "Formáty: md | html | docx | pdf | all"
  exit 1
fi

PROJECT_ID="$1"
FORMAT="${2:-all}"

BASE="$HOME/SpecSystem/projects/$PROJECT_ID"
DIST="$BASE/dist"
OUTPUT_MD="$DIST/spec.md"
OUTPUT_HTML="$DIST/spec.html"
OUTPUT_DOCX="$DIST/spec.docx"
OUTPUT_PDF="$DIST/spec.pdf"
CSS_FILE="$HOME/SpecSystem/shared/pandoc/spec.css"

if [ ! -d "$BASE" ]; then
  echo "Chyba: projekt neexistuje: $BASE"
  exit 1
fi

mkdir -p "$DIST"

append_section() {
  local FILE="$1"

  if [ -f "$FILE" ]; then
    printf "\n" >> "$OUTPUT_MD"
    cat "$FILE" >> "$OUTPUT_MD"
    printf "\n\n" >> "$OUTPUT_MD"
  fi
}

append_yaml_section() {
  local TITLE="$1"
  local FILE="$2"

  if [ -f "$FILE" ]; then
    printf "\n# %s\n\n" "$TITLE" >> "$OUTPUT_MD"
    printf '```yaml\n' >> "$OUTPUT_MD"
    cat "$FILE" >> "$OUTPUT_MD"
    printf '\n```\n\n' >> "$OUTPUT_MD"
  fi
}

generate_markdown() {
  cat > "$OUTPUT_MD" <<EOF
---
title: "Specifikace projektu: $PROJECT_ID"
date: "$(date +%F)"
lang: cs-CZ
toc: true
numbersections: false
---

# Přehled

Tento dokument je generovaný view dokument složený z kanonických artefaktů projektu \`$PROJECT_ID\`.

EOF

  append_yaml_section "Meta" "$BASE/00-meta/spec.yaml"
  append_yaml_section "Motivace" "$BASE/10-motivation/motivation.yaml"
  append_section "$BASE/20-scope/scope.md"
  append_section "$BASE/30-architecture/architecture.md"
  append_yaml_section "Komponenty" "$BASE/40-components/components.yaml"
  append_section "$BASE/50-decisions/decisions.md"
  append_yaml_section "Vazby" "$BASE/60-links/implementation-links.yaml"
  append_section "$BASE/70-regeneration/regeneration.md"
  append_section "$BASE/80-history/history.md"

  echo "Markdown view vytvořen:"
  echo "  $OUTPUT_MD"
}

generate_html() {
  local HEADER_FILE="$HOME/SpecSystem/shared/pandoc/spec-header.html"

  pandoc "$OUTPUT_MD" \
    --standalone \
    --toc \
    --from markdown \
    --to html5 \
    --syntax-highlighting=pygments \
    --css "$CSS_FILE" \
    --include-in-header "$HEADER_FILE" \
    --metadata title="Specifikace projektu: $PROJECT_ID" \
    -o "$OUTPUT_HTML"

  echo "HTML vytvořen:"
  echo "  $OUTPUT_HTML"
}

generate_docx() {
  pandoc "$OUTPUT_MD" \
    --standalone \
    --toc \
    --from markdown \
    -o "$OUTPUT_DOCX"

  echo "DOCX vytvořen:"
  echo "  $OUTPUT_DOCX"
}

generate_pdf_with_pandoc() {
  if command -v tectonic >/dev/null 2>&1; then
    pandoc "$OUTPUT_MD" \
      --toc \
      --from markdown \
      --pdf-engine=tectonic \
      -o "$OUTPUT_PDF"

    echo "PDF vytvořen přes Pandoc + Tectonic:"
    echo "  $OUTPUT_PDF"
  else
    echo "PDF přeskočeno: není nainstalován tectonic"
  fi
}

generate_markdown

if ! command -v pandoc >/dev/null 2>&1; then
  echo "Pandoc není nainstalovaný. Končím po vytvoření spec.md"
  exit 0
fi

case "$FORMAT" in
  md)
    ;;
  html)
    generate_html
    ;;
  docx)
    generate_docx
    ;;
  pdf)
    generate_pdf_with_pandoc
    ;;
  all)
    generate_html
    generate_docx
    generate_pdf_with_pandoc
    ;;
  *)
    echo "Neznámý formát: $FORMAT"
    echo "Použij: md | html | docx | pdf | all"
    exit 1
    ;;
esac
