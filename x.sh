#!/bin/bash

set -euo pipefail

BASE="$HOME/SpecSystem/shared"

echo "Vytvářím memory structure..."

echo "Vytvářím memory indexy..."

cat > "$BASE/memory/architecture/index.md" <<EOF
# Architecture

- [[system-layers]]
- [[specification-pipeline]]
- [[deployment-model]]
EOF

cat > "$BASE/memory/concepts/index.md" <<EOF
# Concepts

- [[canonical-specification]]
- [[traceability]]
- [[regeneration]]
- [[source-of-truth]]
EOF

cat > "$BASE/memory/constraints/index.md" <<EOF
# Constraints

- [[llm-limitations]]
- [[deterministic-generation]]
- [[validation-rules]]
EOF

cat > "$BASE/memory/decisions/index.md" <<EOF
# Decisions

- [[wiki-is-not-source-of-truth]]
- [[archimate-as-formal-projection]]
- [[single-root-specification]]
EOF

cat > "$BASE/memory/entities/index.md" <<EOF
# Entities

- [[specsystem]]
- [[archimate-model-repository]]
- [[roam-research]]
- [[openclaw]]
EOF

cat > "$BASE/memory/open-questions/index.md" <<EOF
# Open Questions

- [[future-rag-architecture]]
- [[memory-synchronization]]
- [[spec-graph-evolution]]
EOF

echo "Vytvářím prompts structure..."

mkdir -p "$BASE/prompts/memory"

echo "Vytvářím extraction prompty..."

cat > "$BASE/prompts/memory/extract-architecture.md" <<EOF
Extrahuj architektonické invarianty.

Zaměř se na:
- vrstvy systému
- dependency flow
- separation of concerns
- source of truth
- execution model
- traceability

NEPIŠ:
- poděkování
- shrnutí dokumentu
- obecné komentáře
- AI konverzační styl

VÝSTUP:
stručné architektonické facts v markdown.
EOF

cat > "$BASE/prompts/memory/extract-concepts.md" <<EOF
Extrahuj klíčové koncepty.

Zaměř se na:
- doménové pojmy
- definice
- význam konceptů
- vztahy mezi koncepty

NEPIŠ:
- obecné shrnutí
- poděkování
- AI komentáře

VÝSTUP:
stručné koncepty v markdown.
EOF

cat > "$BASE/prompts/memory/extract-constraints.md" <<EOF
Extrahuj omezení systému.

Zaměř se na:
- technická omezení
- procesní omezení
- validační pravidla
- bezpečnostní omezení
- deterministic rules

VÝSTUP:
stručný seznam constraints v markdown.
EOF

cat > "$BASE/prompts/memory/extract-decisions.md" <<EOF
Extrahuj architektonická rozhodnutí.

Zaměř se na:
- explicitní rozhodnutí
- tradeoffs
- důvody rozhodnutí
- rejected alternatives

VÝSTUP:
ADR-like stručné decision records v markdown.
EOF

cat > "$BASE/prompts/memory/extract-entities.md" <<EOF
Extrahuj entity systému.

Zaměř se na:
- aplikace
- systémy
- služby
- repozitáře
- modely
- agenty

VÝSTUP:
stručný seznam entit v markdown.
EOF

cat > "$BASE/prompts/memory/extract-open-questions.md" <<EOF
Extrahuj otevřené otázky.

Zaměř se na:
- nevyřešené problémy
- architektonické nejistoty
- budoucí rozhodnutí
- potenciální rizika

VÝSTUP:
stručný seznam open questions v markdown.
EOF

echo
echo "======================================"
echo "Memory structure vytvořena."
echo "======================================"
echo
echo "Vytvořené části:"
echo
echo "shared/memory/"
echo "shared/prompts/memory/"
echo
echo "Hotovo."
