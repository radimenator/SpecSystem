# Document Generation

## Účel

Tento runbook popisuje generování výstupních dokumentů ze SPEC artefaktů.

Výstupy jsou:
- odvozené artefakty,
- renderované pohledy,
- exportní dokumentace.

SPEC zůstává jedinou kanonickou pravdou.

---

# Vstupy

Generování používá:

- SPEC artefakty
- ArchiMate model
- šablony
- CSS / HTML assets

---

# Výstupní adresář

```text
projects/<project-id>/outputs/
```

---

# Typy výstupů

## SPEC dokumentace

```text
outputs/spec/
```

Obsahuje:
- Markdown
- HTML
- DOCX
- PDF

---

## OHA dokumentace

```text
outputs/oha/
```

---

## Procurement dokumentace

```text
outputs/procurement/
```

---

## Architektonická dokumentace

```text
outputs/architecture/
```

---

## Exporty

```text
outputs/exports/
```

---

# Generační skript

```text
build-spec-doc.sh
```

---

# Generování dokumentace

## Markdown

```bash
./build-spec-doc.sh spec-system md
```

---

## HTML

```bash
./build-spec-doc.sh spec-system html
```

---

## DOCX

```bash
./build-spec-doc.sh spec-system docx
```

---

## PDF

```bash
./build-spec-doc.sh spec-system pdf
```

---

## Všechny formáty

```bash
./build-spec-doc.sh spec-system all
```

---

# Generační pipeline

```text
SPEC artefakty
        ↓
spec.md
        ↓
Pandoc
        ↓
HTML / DOCX / PDF
```

---

# Používané technologie

## Pandoc

Použití:
- Markdown rendering
- DOCX export
- HTML export
- PDF export

---

## Tectonic

Použití:
- PDF rendering přes LaTeX

---

# Shared assets

```text
shared/pandoc/
```

Obsahuje:
- spec.css
- spec.js
- spec-header.html

---

# Principy generování

- výstupy jsou deterministické,
- bez LLM v kritické části,
- SPEC je source of truth,
- výstupy jsou regenerovatelné,
- žádná ruční editace output dokumentů.

---

# Co negenerovat ručně

Neupravovat:

```text
outputs/
```

Změny dělat:
- ve SPEC,
- v šablonách,
- ve scripts.

---

# Doporučený workflow

## 1. Upravit SPEC

Například:
- architecture.md
- scope.md
- decisions.md

---

## 2. Regenerovat dokumentaci

```bash
./build-spec-doc.sh <project-id> all
```

---

## 3. Zkontrolovat outputs

Kontrolovat:
- HTML
- PDF
- DOCX

---

# Troubleshooting

## Pandoc není nainstalovaný

```bash
brew install pandoc
```

---

## PDF negeneruje

Nainstalovat:

```bash
brew install tectonic
```

---

## Unicode warnings v PDF

Typicky:
- emoji,
- box drawing characters,
- speciální unicode symboly.

Řešení:
- ignorovat warningy,
- nebo odstranit problematické znaky.

---

# Důležité pravidlo

Nikdy needitovat:

```text
outputs/
```

Outputs jsou:
- cache,
- render,
- export.

Pravda je vždy ve SPEC.

---

# Budoucí rozšíření

Plánované:

- šablony pro OHA
- procurement exporty
- ArchiMate diagram embedding
- automatické TOC
- metadata export
- multi-document bundles
- CI/CD document generation
- signed PDF exports
