# Architektura systému

## Účel
Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

## Hlavní oddělení
- Roam Research: projektový kontext, pracovní poznámky, aktivity
- SpecSystem: kanonická specifikace
- ~/Projects: implementace a kód

- Roam Research: projektový kontext, pracovní poznámky, aktivity, myšlení
- Source Evidence Repository: zdrojové dokumenty a modely (PDF, DOCX, CSV, Open Exchange, OpenXML)
- Obsidian / LLM Wiki: znalostní a interpretační vrstva (entity, pojmy, syntézy)
- SpecSystem: kanonická specifikace (source of truth)
- Output / Document Generation: generování formálních výstupů (OHA formulář, zadávací dokumentace, specifikace IS)
- ArchiMate Model Repository: formální architektonický graf (prvky, vztahy, views)
- ~/Projects: implementace a kód

## Hlavní architektonické principy
- jedna aplikace má jeden root specifikace
- root specifikace je kořenová složka projektu ve SpecSystem
- specifikace může mít více artefaktů, ale jeden kanonický vstupní bod
- specifikace musí být čitelná člověkem i strojem
- z artefaktů specifikace musí být možné generovat dokument
- zdrojové dokumenty jsou evidence, nikoliv automatická pravda
- interpretace (Wiki) je oddělená od kanonické specifikace
- ArchiMate model je formální projekce specifikace
- kód je odvozený artefakt
- LLM je asistent, ne autorita
- validace a exporty jsou deterministické
- každá informace musí být dohledatelná ke zdroji (traceability)

## Hlavní vztahy
- Roam projekt odkazuje na root specifikace
- root specifikace odkazuje na implementaci v ~/Projects
- architektura vysvětluje globální pohled na aplikaci
- komponenty popisují rozpad na regenerovatelné části
- Source Evidence → Wiki (extraction, syntéza)
- Wiki → SpecSystem (formalizace)
- SpecSystem → ArchiMate (modelování)
- ArchiMate → SpecSystem (zpětná validace)
- SpecSystem + ArchiMate → generování formálních dokumentů
- výstupní dokumenty jsou odvozené artefakty (nikoliv zdroj pravdy)
- všechny vrstvy podporují traceability

# Vrstvy systému (detail)
```text
Roam (myšlení, poznámky)
        ↓
Source Evidence Repository (PDF, DOCX, CSV, modely)
        ↓
LLM / RAG ingestion
        ↓
Obsidian / LLM Wiki (syntéza, entity, pojmy)
        ↓
SpecSystem (kanonická specifikace) + ArchiMate Model Repository (formální model)
        ↓
Document Generation
        ↓
OHA / veřejná zakázka / specifikace
        ↓
~/Projects (implementace)
        ↓
feedback → zpět do SpecSystem / Wiki / Roam
```

1. Source Evidence Repository

- uchování zdrojových dokumentů v raw podobě
- metadata (zdroj, verze, hash)
- preprocessing (text, chunking)
- opakovatelná extrakce

⸻

2. Obsidian / LLM Wiki

- entity (aplikace, procesy, data, technologie)
- pojmy a koncepty
- syntézy dokumentů
- znalostní graf (linkování)
- pracovní základ pro AI

⸻

3. SpecSystem

- kanonická specifikace projektu
- YAML + Markdown
- verzování (Git)
- ADR (rozhodnutí)
- vazby na model a implementaci

⸻

4. ArchiMate Model Repository

- prvky (elements)
- vztahy (relationships)
- views
- validace modelu
- import/export Open Exchange XML

⸻

5. RAG / Knowledge Layer

- indexace:
    - zdrojových dokumentů
    - wiki
    - specifikací
- retrieval kontextu pro LLM
- podpora traceability

⸻

6. LLM Agent (lokální)

- extrakce informací ze zdrojů
- návrhy změn specifikace a modelu
- sumarizace a syntéza
- generování strukturovaných výstupů

omezení:

- nemění kanonickou specifikaci bez potvrzení
- nemění model bez validace

### 7. Output / Document Generation Layer
- generování dokumentů ze:
  - SpecSystem
  - ArchiMate modelu
- typy výstupů:
  - OHA formulář
  - zadávací dokumentace (veřejné zakázky)
  - architektonická dokumentace
  - technická specifikace IS
- šablony (templates):
  - YAML / Markdown / DOCX / HTML
- deterministická transformace (bez LLM v kritické části)

---
## Deployment / Execution Model

Systém je navržen jako hybridní lokální + vzdálené řešení.

### Lokální prostředí (MacBook)
Primární pracovní prostředí uživatele.

Zde probíhá:
- práce v Roam Research
- práce v Obsidian / LLM Wiki
- editace specifikací (SpecSystem clone)
- práce s ArchiMate modely
- generování dokumentů (outputs)
- běh lokálního LLM (Ollama)

### Vzdálené prostředí (VPS – Hetzner)
Sdílené a automatizační prostředí.

Zde běží:
- centrální repozitář SpecSystem
- OpenClaw agentní infrastruktura
- agent profiles a task management
- automatizované úlohy nad specifikacemi

### Princip oddělení

- lokální prostředí = práce, myšlení, modelování
- VPS = orchestrátor, sdílení, automatizace

### Důsledky

- systém je plně funkční lokálně bez VPS
- VPS rozšiřuje možnosti (agent orchestrace, sdílení)
- citlivá data zůstávají lokálně

---

# SpecSystem + OpenClaw Operating Structure

## Lokální a vzdálené umístění

- MacBook: `/Users/radimpokorny/SpecSystem/`
- VPS: `/srv/workspace/spec-system/`

## Obecné profily agentů (OpenClaw git - VPS)

- `/srv/workspace/agent_profiles/`

## Aktivní profil agenta (OpenClaw git - VPS)

- `/srv/workspace/ACTIVE_PROFILE`

## Úkoly pro agenty (OpenClaw git - VPS)

- `/srv/workspace/tasks`

## Repozitáře projektů (OpenClaw git - VPS)

- `/srv/workspace/repos/`

## Předpřipravené prompty pro fáze práce se SPEC (SpecSystem git - VPS)

- `/srv/workspace/spec-system/shared/prompts/`

## Specifikace jednotlivých projektů (SpecSystem git - VPS)

- `/srv/workspace/spec-system/projects/`

## Šablona specifikace projektu (SpecSystem git - VPS)

- `/srv/workspace/spec-system/templates/project-spec/`

## Zdrojová evidence (MacBook) = vstupní evidence konkrétního projektu

- `/Users/radimpokorny/SpecSystem/projects/<project-id>/sources/`

## Wiki (MacBook)= společná znalostní báze napříč projekty

- `/Users/radimpokorny/SpecSystem/projects/<project-id>/wiki/`

## ArchiMate modely (MacBook)= společný modelovací prostor napříč projekty

- `/Users/radimpokorny/SpecSystem/projects/<project-id>/models/`

## Výstupní dokumentace= výstupy konkrétní specifikace projektu

- `/Users/radimpokorny/SpecSystem/projects/<project-id>/outputs/`

## Fyzická adresářová struktura (MacBook)

### Projektově závislé adresářové struktury

```text
/Users/radimpokorny/SpecSystem/projects/<project-id>/
├── 00-meta/
│   └── spec.yaml
├── 10-motivation/
│   └── motivation.yaml
├── 20-scope/
│   └── scope.md
├── 30-architecture/
│   └── architecture.md
├── 35-archimate/
│   ├── metamodel.md
│   ├── mapping.md
│   ├── modeling-rules.md
│   └── views.md
├── 40-components/
│   └── components.yaml
├── 50-decisions/
│   └── decisions.md
├── 60-links/
│   └── implementation-links.yaml
├── 70-regeneration/
│   └── regeneration.md
├── 75-agent-memory/
│   ├── skills.yaml
│   ├── preferences.md
│   └── correction-log.md
├── 80-history/
│   └── history.md
├── 90-validation/
│   ├── consistency-rules.yaml
│   └── validation-report.md
└── outputs/
    ├── spec/
    │   ├── spec.md
    │   ├── spec.html
    │   ├── spec.pdf
    │   └── spec.docx
    ├── oha/
    │   ├── oha-form.html
    │   └── oha-form.docx
    ├── procurement/
    │   └── zadavaci-dokumentace.docx
    ├── architecture/
    │   └── arch-doc.html
    └── exports/
        └── full-spec.pdf

```

### Všemi projekty sdílené adresáře 

```text
/Users/radimpokorny/SpecSystem

shared
    ├── assets
    ├── models
    │   └── archimate
    │       ├── elements.yaml
    │       ├── graph.json
    │       ├── open-exchange.xml
    │       ├── relationships.yaml
    │       ├── validation-report.md
    │       └── views.yaml
    ├── pandoc
    │   ├── spec-header.html
    │   ├── spec.css
    │   └── spec.js
    ├── prompts
    │   ├── lead-specification-architect-define-specification.md
    │   ├── lead-specification-architect-reconciliation.md
    │   ├── reviewer-review-specification.md
    │   └── tester-validate-specification.md
    ├── scripts
    ├── schemas
    ├── sources
    │   └── project-id
    │       ├── index.yaml
    │       ├── processed
    │       └── raw
    ├── templates
    │   └── project-id
    │       ├── 00-meta/
    │       │   └── spec.yaml
    │       ├── 10-motivation/
    │       │   └── motivation.yaml
    │       ├── 20-scope/
    │       │   └── scope.md
    │       ├── 30-architecture/
    │       │   └── architecture.md
    │       ├── 35-archimate/
    │       │   ├── metamodel.md
    │       │   ├── mapping.md
    │       │   ├── modeling-rules.md
    │       │   └── views.md
    │       ├── 40-components/
    │       │   └── components.yaml
    │       ├── 50-decisions/
    │       │   └── decisions.md
    │       ├── 60-links/
    │       │   └── implementation-links.yaml
    │       ├── 70-regeneration/
    │       │   └── regeneration.md
    │       ├── 75-agent-memory/
    │       │   ├── skills.yaml
    │       │   ├── preferences.md
    │       │   └── correction-log.md
    │       ├── 80-history/
    │       │   └── history.md
    │       ├── 90-validation/
    │       │   ├── consistency-rules.yaml
    │       │   └── validation-report.md
    │       └── outputs/
    │           ├── spec/
    │           │   ├── spec.md
    │           │   ├── spec.html
    │           │   ├── spec.pdf
    │           │   └── spec.docx
    │           ├── oha/
    │           │   ├── oha-form.html
    │           │   └── oha-form.docx
    │           ├── procurement/
    │           │   └── zadavaci-dokumentace.docx
    │           ├── architecture/
    │           │   └── arch-doc.html
    │           └── exports/
    │               └── full-spec.pdf
    └── wiki
        ├── applications
        ├── concepts
        ├── data
        ├── entities
        ├── glossary.md
        ├── index.md
        ├── log.md
        ├── processes
        ├── projects
        │   └── project-id
        ├── systems
        └── technologies

```


### Význam hlavních adresářů

- `projects/` obsahuje kanonické specifikace projektů.
- `sources/` obsahuje zdrojovou evidenci, tedy vstupní dokumenty a importované modely.
- `wiki/` obsahuje znalostní a interpretační vrstvu pro Obsidian / LLM Wiki.
- `models/` obsahuje formální ArchiMate modely, views, validace a exporty.
- `outputs/` obsahuje odvozené výstupní dokumenty, například OHA formulář, zadávací dokumentaci, architektonickou dokumentaci a PDF exporty.

----
## Závislosti souborů pro SpecSystem

### Lead Specification Architect
- Co agent umí: `/srv/workspace/agent_profiles/lead-specification-architect.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-define-specification.md`
- Vstup:
    - ROAM specifikace projektu
    - Wiki
    - Source Evidence
- Šablona specifikace: `/srv/workspace/spec-system/templates/project-spec/`
- Výstup: `/srv/workspace/spec-system/projects/<project-id>/`, soubory `00` až `80`

### Specification Reviewer
- Co agent umí: `/srv/workspace/agent_profiles/specification-reviewer.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/reviewer-review-specification.md`
- Vstup: `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`
- Výstup: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`

### Specification Test Agent
- Co agent umí: `/srv/workspace/agent_profiles/specification-test-agent.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/tester-validate-specification.md`
- Vstup:
  - `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
- Výstup: `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

### Lead Specification Architect – Reconciliation
- Co agent umí: `/srv/workspace/agent_profiles/lead-specification-architect.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-reconciliation.md`
- Vstup:
  - `/srv/workspace/spec-system/projects/<project-id>/`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`
- Šablona specifikace: `/srv/workspace/spec-system/templates/project-spec/`
- Výstup: aktualizovaná SPEC v `/srv/workspace/spec-system/projects/<project-id>/`, soubory `00` až `80`

---