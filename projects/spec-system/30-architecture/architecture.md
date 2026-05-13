# Architektura systému

## Účel

Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

Systém propojuje:
- zdrojovou evidenci,
- znalostní vrstvu,
- persistentní memory,
- kanonickou specifikaci,
- formální architektonický model,
- generování dokumentace,
- implementaci.

---

## Hlavní oddělení

- Roam Research  
  projektový kontext, pracovní poznámky, aktivity, myšlení

- Source Evidence Repository  
  zdrojové dokumenty a modely (PDF, DOCX, CSV, Open Exchange, OpenXML)

- Persistent Memory Layer  
  dlouhodobá pracovní paměť systému a agentů

- Obsidian / LLM Wiki  
  znalostní a interpretační vrstva (entity, pojmy, syntézy)

- SpecSystem  
  kanonická specifikace (source of truth)

- ArchiMate Model Repository  
  formální architektonický graf (prvky, vztahy, views)

- Output / Document Generation  
  generování formálních výstupů

- ~/Projects  
  implementace a kód

---

## Hlavní architektonické principy

- jedna aplikace má jeden root specifikace
- root specifikace je kořenová složka projektu ve SpecSystem
- specifikace může mít více artefaktů, ale jeden kanonický vstupní bod
- specifikace musí být čitelná člověkem i strojem
- z artefaktů specifikace musí být možné generovat dokument
- zdrojové dokumenty jsou evidence, nikoliv automatická pravda
- interpretace (Wiki) je oddělená od kanonické specifikace
- memory je oddělená od wiki i od source of truth
- ArchiMate model je formální projekce specifikace
- kód je odvozený artefakt
- LLM je asistent, ne autorita
- validace a exporty jsou deterministické
- každá informace musí být dohledatelná ke zdroji (traceability)

---

## Separation of Concerns

Systém odděluje několik typů artefaktů:

- SPEC = kanonická pravda
- RUNBOOK = operativní práce
- SCRIPT = automatizace
- WIKI = interpretační a znalostní vrstva
- MEMORY = dlouhodobá pracovní paměť systému

### Význam

- SPEC definuje formální a verzovanou pravdu systému.
- RUNBOOK popisuje provozní workflow a manuální postupy.
- SCRIPT implementuje automatizaci a deterministické operace.
- WIKI slouží pro syntézu, navigaci, entity a práci LLM.
- MEMORY uchovává dlouhodobě důležité znalosti systému.

Toto oddělení zabraňuje:
- míchání operativy a specifikace,
- degradaci kanonických artefaktů,
- nekontrolovanému driftu znalostí,
- coupling mezi automatizací a architekturou,
- ztrátě dlouhodobého kontextu.

---

## Persistent Memory Layer

Systém obsahuje persistentní memory vrstvu určenou pro dlouhodobou pracovní paměť LLM a agentů.

Memory není:
- wiki,
- source of truth,
- generovaný summary dump.

Memory slouží jako:
- curated cognition layer,
- dlouhodobá znalostní báze,
- stabilní kontext pro retrieval a reasoning.

### Memory typy

Memory je rozdělena do typovaných oblastí:

- architecture
- concepts
- constraints
- decisions
- entities
- open-questions

### Princip extraction

Memory vzniká typed extraction procesem:

Source Documents  
↓  
Extraction Prompts  
↓  
LLM Extraction  
↓  
Persistent Memory

Extraction:
- neprovádí sumarizaci dokumentů,
- ukládá pouze dlouhodobě relevantní znalosti,
- zachovává separation of concerns,
- nepřepisuje kanonickou specifikaci.

### Kritéria pro memory

Do memory patří pouze informace, které:
- ovlivňují budoucí rozhodování,
- definují pravidla systému,
- popisují architektonické invarianty,
- určují omezení systému,
- podporují traceability,
- pomáhají regeneraci nebo validaci.

### Umístění

`shared/memory/`

### Extraction prompty

`shared/prompts/extraction/`

### Automatizace

Memory může být rebuildována automatizovaně pomocí nightly rebuild procesu.

Rebuild:
- neovlivňuje kanonickou SPEC,
- negeneruje formální dokumentaci,
- aktualizuje pouze persistentní memory layer.

---

## Hlavní vztahy

- Roam projekt odkazuje na root specifikace
- root specifikace odkazuje na implementaci v ~/Projects
- architektura vysvětluje globální pohled na aplikaci
- komponenty popisují rozpad na regenerovatelné části
- Source Evidence → Memory (typed extraction)
- Memory → Wiki (knowledge projection)
- Wiki → SpecSystem (formalizace)
- SpecSystem → ArchiMate (modelování)
- ArchiMate → SpecSystem (zpětná validace)
- SpecSystem + ArchiMate → generování formálních dokumentů
- výstupní dokumenty jsou odvozené artefakty
- všechny vrstvy podporují traceability

---

# Vrstvy systému

Roam (myšlení, poznámky)  
↓  
Source Evidence Repository (PDF, DOCX, CSV, modely)  
↓  
LLM Extraction / RAG  
↓  
Persistent Memory Layer  
↓  
Obsidian / LLM Wiki  
↓  
SpecSystem + ArchiMate Model Repository  
↓  
Document Generation  
↓  
OHA / veřejná zakázka / specifikace  
↓  
~/Projects (implementace)  
↓  
feedback → zpět do SpecSystem / Memory / Wiki / Roam

---

## 1. Source Evidence Repository

- uchování zdrojových dokumentů v raw podobě
- metadata (zdroj, verze, hash)
- preprocessing
- chunking
- opakovatelná extrakce

---

## 2. Persistent Memory Layer

- dlouhodobá pracovní paměť systému
- typed extraction
- curated knowledge
- retrieval context
- stabilní znalostní vrstva pro LLM

---

## 3. Obsidian / LLM Wiki

- entity
- pojmy a koncepty
- syntézy dokumentů
- znalostní graf
- navigace
- pracovní základ pro AI

---

## 4. SpecSystem

- kanonická specifikace projektu
- YAML + Markdown
- verzování (Git)
- ADR
- vazby na model a implementaci

---

## 5. ArchiMate Model Repository

- prvky (elements)
- vztahy (relationships)
- views
- validace modelu
- import/export Open Exchange XML

---

## 6. RAG / Knowledge Layer

- indexace:
  - source documents
  - memory
  - wiki
  - specifikací

- retrieval kontextu pro LLM
- podpora traceability

---

## 7. LLM Agent (lokální)

- extrakce informací ze zdrojů
- typed memory extraction
- návrhy změn specifikace a modelu
- sumarizace a syntéza
- generování strukturovaných výstupů

Omezení:
- nemění kanonickou specifikaci bez potvrzení
- nemění model bez validace

---

## 8. Output / Document Generation Layer

- generování dokumentů ze:
  - SpecSystem
  - ArchiMate modelu

Typy výstupů:
- OHA formulář
- zadávací dokumentace
- architektonická dokumentace
- technická specifikace IS

Šablony:
- YAML
- Markdown
- DOCX
- HTML

Transformace:
- deterministická
- bez LLM v kritické části

---

# Deployment / Execution Model

Systém je navržen jako hybridní lokální + vzdálené řešení.

## Lokální prostředí (MacBook)

Primární pracovní prostředí uživatele.

Zde probíhá:
- práce v Roam Research
- práce v Obsidian / LLM Wiki
- editace specifikací
- práce s ArchiMate modely
- memory extraction
- generování dokumentů
- běh lokálního LLM (Ollama)

## Vzdálené prostředí (VPS – Hetzner)

Sdílené a automatizační prostředí.

Zde běží:
- centrální repozitář SpecSystem
- OpenClaw agentní infrastruktura
- agent profiles
- task management
- nightly rebuild memory
- automatizované úlohy nad specifikacemi

## Princip oddělení

- lokální prostředí = práce, myšlení, modelování
- VPS = orchestrátor, sdílení, automatizace

## Důsledky

- systém je plně funkční lokálně bez VPS
- VPS rozšiřuje možnosti automatizace
- citlivá data zůstávají lokálně

***
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

***

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

## Wiki (MacBook)= společný znalostní báze napříč projekty

- `/Users/radimpokorny/SpecSystem/shared/wiki/projects/<project-id>/`

## ArchiMate modely (MacBook)= společný modelovací prostor napříč projekty

- `/Users/radimpokorny/SpecSystem/shared/models/archimate/global`

## ArchiMate modely (MacBook)= projektový modelovací prostor

- `/Users/radimpokorny/SpecSystem/shared/models/archimate/projects/<project-id>`

## Výstupní dokumentace= výstupy konkrétní specifikace projektu

- `/Users/radimpokorny/SpecSystem/projects/<project-id>/outputs/`

## Fyzická adresářová struktura (MacBook)

### Projektově závislé adresářové struktury

```text
/Users/radimpokorny/SpecSystem/projects/
├── llm-wiki
│   ├── 00-meta
│   │   └── spec.yaml
│   ├── 10-motivation
│   │   └── motivation.yaml
│   ├── 20-scope
│   │   └── scope.md
│   ├── 30-architecture
│   │   └── architecture.md
│   ├── 40-components
│   │   └── components.yaml
│   ├── 50-decisions
│   │   └── decisions.md
│   ├── 60-links
│   │   └── implementation-links.yaml
│   ├── 70-regeneration
│   │   └── regeneration.md
│   ├── 80-history
│   │   └── history.md
│   ├── outputs
│   └── README.md
├── spec-system
│   ├── 00-meta
│   │   └── spec.yaml
│   ├── 10-motivation
│   │   └── motivation.yaml
│   ├── 20-scope
│   │   └── scope.md
│   ├── 30-architecture
│   │   └── architecture.md
│   ├── 35-archimate
│   ├── 40-components
│   │   └── components.yaml
│   ├── 50-decisions
│   │   └── decisions.md
│   ├── 60-links
│   │   └── implementation-links.yaml
│   ├── 70-regeneration
│   │   └── regeneration.md
│   ├── 80-history
│   │   └── history.md
│   ├── outputs
│   │   └── spec
│   │       ├── spec.docx
│   │       ├── spec.html
│   │       ├── spec.md
│   │       └── spec.pdf
│   └── sources
│       ├── index.yaml
│       ├── processed
│       └── raw
│           └── test.md
└── tech-radar
    ├── 00-meta
    │   └── spec.yaml
    ├── 10-motivation
    │   └── motivation.yaml
    ├── 20-scope
    │   └── scope.md
    ├── 30-architecture
    │   └── architecture.md
    ├── 40-components
    │   └── components.yaml
    ├── 50-decisions
    │   └── decisions.md
    ├── 60-links
    │   └── implementation-links.yaml
    ├── 70-regeneration
    │   └── regeneration.md
    ├── 80-history
    │   └── history.md
    ├── outputs
    │   ├── spec.html
    │   └── spec.md
    └── README.md

```

### Všemi projekty sdílené adresáře 

```text
/Users/radimpokorny/SpecSystem/shared
├── assets
├── memory
│   ├── architecture
│   │   ├── index.md
│   │   └── spec-system.md
│   ├── concepts
│   │   ├── index.md
│   │   └── spec-system.md
│   ├── constraints
│   │   ├── index.md
│   │   └── spec-system.md
│   ├── decisions
│   │   ├── index.md
│   │   └── spec-system.md
│   ├── entities
│   │   ├── index.md
│   │   └── spec-system.md
│   ├── open-questions
│   │   ├── index.md
│   │   └── spec-system.md
│   └── README.md
├── models
│   └── archimate
│       ├── global
│       │   ├── elements.yaml
│       │   ├── graph.json
│       │   ├── relationships.yaml
│       │   └── views.yaml
│       └── projects
│           └── spec-system
├── pandoc
│   ├── spec-header.html
│   ├── spec.css
│   └── spec.js
├── prompts
│   ├── extraction
│   │   ├── extract-architecture.md
│   │   ├── extract-concepts.md
│   │   ├── extract-constraints.md
│   │   ├── extract-decisions.md
│   │   ├── extract-entities.md
│   │   └── extract-open-questions.md
│   ├── lead-specification-architect-define-specification.md
│   ├── lead-specification-architect-reconciliation.md
│   ├── reviewer-review-specification.md
│   ├── tester-validate-specification.md
│   ├── wiki-extract-source.md
│   └── wiki-extract-source.md~
├── runbooks
│   ├── archimate-modeling.md
│   ├── document-generation.md
│   ├── local-llm.md
│   ├── memory-rebuild.md
│   └── wiki-ingestion.md
├── scripts
│   ├── extract_memory.py
│   ├── extract-memory.sh
│   ├── nightly-rebuild-memory.sh
│   ├── nightly-rebuild-memory.sh~
│   └── rebuild-memory.sh
├── schemas
├── templates
│   └── project-spec
│       ├── 00-meta
│       │   └── spec.yaml
│       ├── 10-motivation
│       │   └── motivation.yaml
│       ├── 20-scope
│       │   └── scope.md
│       ├── 30-architecture
│       │   └── architecture.md
│       ├── 35-archimate
│       │   ├── mapping.md
│       │   ├── metamodel.md
│       │   ├── modeling-rules.md
│       │   └── views.md
│       ├── 40-components
│       │   └── components.yaml
│       ├── 50-decisions
│       │   └── decisions.md
│       ├── 60-links
│       │   └── implementation-links.yaml
│       ├── 70-regeneration
│       │   └── regeneration.md
│       ├── 75-agent-memory
│       │   ├── correction-log.md
│       │   ├── preferences.md
│       │   └── skills.yaml
│       ├── 80-history
│       │   └── history.md
│       ├── 90-validation
│       │   ├── consistency-rules.yaml
│       │   └── validation-report.md
│       ├── outputs
│       │   ├── architecture
│       │   ├── exports
│       │   ├── oha
│       │   ├── procurement
│       │   └── spec
│       ├── README.md
│       └── sources
│           └── project-id
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
    │   └── spec-system
    ├── systems
    └── technologies

```


### Význam hlavních adresářů

- `projects/` obsahuje kanonické specifikace projektů.
- `projects/<project-id>/sources/` obsahuje zdrojovou evidenci konkrétního projektu.
- `shared/wiki/` obsahuje společnou znalostní a interpretační vrstvu pro Obsidian / LLM Wiki.
- `shared/wiki/projects/<project-id>/` obsahuje projektový prostor ve společné wiki.
- `shared/models/archimate/global/` obsahuje globální ArchiMate pohled napříč projekty.
- `shared/models/archimate/projects/<project-id>/` obsahuje ArchiMate model konkrétního projektu.
- `projects/<project-id>/outputs/` obsahuje odvozené výstupní dokumenty konkrétního projektu.dokumentaci a PDF exporty.

***
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
- Výstup: aktualizovaná SPEC v `/srv/workspace/spec-system/projects/<project-id>/`, soubory `00` až `90`

***