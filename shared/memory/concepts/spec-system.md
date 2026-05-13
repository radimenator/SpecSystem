```markdown
## Doménové pojmy

### Specifikace (SPEC)
- **Definice:** Kanonický zdroj pravdy pro specifikace projektů.
- **Vlastnosti:**
  - Jedna aplikace má jeden root specifikace.
  - Root specifikace je kořenová složka projektu ve SpecSystem.
  - Musí být čitelná člověkem i strojem.
  - Z artefaktů specifikace mohou být generovány dokumenty.

### Runbook
- **Definice:** Popis provozních workflow a manuálních postupů.
  
### Script
- **Definice:** Implementace automatizace a deterministických operací.

### Wiki
- **Definice:** Interpretační a znalostní vrstva (entity, pojmy, syntézy).

## Architektura

### Oddělení zodpovědnosti vrstev
- **Roam Research:** Projektový kontext, pracovní poznámky.
- **Source Evidence Repository:** Zdrojové dokumenty a modely (PDF, DOCX, CSV).
- **Obsidian / LLM Wiki:** Kognitivní vrstva (entity, pojmy, syntézy).
- **SpecSystem:** Kanonická specifikace.
- **ArchiMate Model Repository:** Formální architektonický graf.
- **~/Projects:** Implementace a kód.

### Vztahy mezi koncepty
- Roam projekt odkazuje na root specifikace.
- Root specifikace odkazuje na implementaci v ~/Projects.
- Source Evidence → Wiki (extrakce, syntéza).
- Wiki → SpecSystem (formalizace).
- SpecSystem → ArchiMate (modelování).
- ArchiMate → SpecSystem (zpětná validace).

### Traceability
- Každá vrstva podporuje traceability.

## Hlavní architektonické principy

- **Deterministické validace a exporty.**
- **Kanonická specifikace je jediný vstupní bod pro artefakty.**
- **Zdrojové dokumenty jsou evidence, nikoliv automatická pravda.**

## Lokální vs Vzdálené prostředí

- **Lokální:** Práce v Roam Research, Obsidian / LLM Wiki, editace specifikací.
- **Vzdálené (VPS):** Centrální repozitář SpecSystem, agentní infrastruktura.

## Adresářová struktura

### Projektově závislé adresáře
- `/Users/radimpokorny/SpecSystem/projects/<project-id>/`
  - `00-meta/`, `10-motivation/`, `20-scope/`, `30-architecture/`, `40-components/`, `50-decisions/`, `60-links/`, `70-regeneration/`, `80-history/`, `90-validation/`
  - `outputs/`

### Sdílené adresáře
- `/Users/radimpokorny/SpecSystem/shared/wiki/projects/<project-id>/`
- `/Users/radimpokorny/SpecSystem/shared/models/archimate/global/`
- `/Users/radimpokorny/SpecSystem/shared/models/archimate/projects/<project-id>/`

## Závislosti souborů

### Lead Specification Architect
- **Vstup:** ROAM specifikace projektu, Wiki, Source Evidence.
- **Výstup:** Kanonické specifikace v `/srv/workspace/spec-system/projects/<project-id>/`.

### Specification Reviewer
- **Vstup:** Specifikace projektu (soubory `10` až `40`).
- **Výstup:** Zpráva o revizi.

### Specification Test Agent
- **Vstup:** Specifikace projektu, zpráva o revizi.
- **Výstup:** Zpráva o testování.

### Lead Specification Architect – Reconciliation
- **Vstup:** Specifikace projektu, zprávy o revizi a testování.
- **Výstup:** Aktualizované kanonické specifikace.
```
