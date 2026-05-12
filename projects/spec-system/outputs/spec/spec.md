---
title: "Specifikace projektu: spec-system"
date: "2026-05-11"
lang: cs-CZ
toc: true
numbersections: false
---

# Přehled

Tento dokument je generovaný view dokument složený z kanonických artefaktů projektu `spec-system`.


# Meta

```yaml
meta:
  id: spec-system
  name: Uložiště specifikací
  type: system
  status: active
  owner: Radim
  canonical_version: 0.1
  created: 2026-04-10
  updated: 2026-04-10

links:
  roam_project: "PO/Uložiště specifikací"
  code_repositories: []
  related_specs: []

```


# Motivace

```yaml
stakeholders:
  - id: radim
    name: Radim
    role: autor, architekt, uživatel systému
  - id: franta_strukturak
    name: Franta strukturák
    role: analytický a návrhový partner
  - id: openclaw_arch
    name: OpenClaw/Architecture-team
    role: architektonická podpora
  - id: openclaw_dev
    name: OpenClaw/Dev-team
    role: vývojová podpora
  - id: openclaw_infra
    name: OpenClaw/Infra-team
    role: infrastrukturní podpora
  - id: llm_agent
    name: Lokální LLM agent
    role: asistovaná extrakce, syntéza, validace a návrh změn
  - id: future_architect
    name: Budoucí architekt / správce systému
    role: čtenář specifikací, audit změn, rozvoj systému

drivers:
  - potřeba evidovat specifikace napříč projekty
  - potřeba verzovat změny specifikací
  - potřeba udržet původní záměr řešení
  - potřeba porozumět aplikaci jako celku
  - potřeba regenerovat kód ze specifikací
  - potřeba pracovat se zdrojovými dokumenty jako s dohledatelnou evidencí
  - potřeba oddělit zdrojové podklady, interpretaci, model a kanonickou
    specifikaci
  - potřeba využít lokální LLM bez odesílání citlivých informací do cloudu
  - potřeba generovat architektonické modely a výstupní dokumenty ze
    strukturovaného základu
  - potřeba propojit osobní znalostní systém, specifikace, ArchiMate modely a
    implementaci

assessment:
  - specifikace dnes existují roztříštěně
  - historie změn specifikací není dostatečně řízená
  - není jasné, která specifikace je platná
  - není snadné dohledat vazbu mezi specifikací a výsledným kódem
  - globální porozumění aplikaci se ztrácí v množství generovaného kódu
  - zdrojové dokumenty nejsou systematicky evidované jako evidence
  - pracovní poznámky, rozhodnutí a kanonická specifikace se mohou míchat
  - ArchiMate modely nejsou zatím systematicky odvozené ze specifikací
  - výstupní dokumenty vznikají částečně ručně a nejsou plně regenerovatelné
  - AI agenti nemají jednotný strukturovaný kontext pro bezpečnou práci

goals:
  - mít jednoznačně evidované specifikace projektů
  - mít historii a verze specifikací
  - mít možnost pochopit aplikaci na úrovni celku
  - mít možnost použít specifikaci jako vstup pro regeneraci kódu
  - oddělit pracovní poznámky od kanonické specifikace
  - zavést Source Evidence Repository pro PDF, DOCX, CSV, Markdown a modelové
    exporty
  - umožnit traceability od zdrojového dokumentu přes interpretaci až ke
    specifikaci a modelu
  - rozšířit SpecSystem o ArchiMate vrstvu jako formální architektonický model
  - umožnit generování views, dokumentů a modelů ze schválené specifikace
  - umožnit lokální AI asistenci nad specifikací, wiki, evidencí a modely
  - zavést Obsidian / LLM Wiki jako formální znalostní a syntetickou vrstvu
  - podporovat tvorbu výstupů typu OHA formulář, zadání veřejné zakázky nebo
    specifikace IS

constraints:
  - systém musí být použitelný jedním člověkem bez vysoké režie
  - systém musí fungovat v kombinaci s existujícím osobním toolstackem
  - systém nesmí být složitější než hodnota, kterou přinese
  - systém musí podporovat jak lidské čtení, tak strojové zpracování
  - systém musí být provozovatelný lokálně
  - systém musí respektovat omezení lokálního hardware
  - LLM nesmí být jediným zdrojem pravdy
  - kanonická specifikace musí být verzovaná v Gitu
  - zdrojové dokumenty musí být dohledatelné a pokud možno neměnné
  - automatické změny schválené specifikace musí vyžadovat lidské potvrzení
  - generované výstupy musí být rekonstruovatelné ze specifikace a modelu

principles:
  - uložiště specifikací je systém
  - specifikace jsou primární znalostní artefakty
  - poznámky nejsou totéž co kanonická specifikace
  - každá specifikace musí být dohledatelná a srozumitelná
  - každá významná změna specifikace musí být rekonstruovatelná
  - specifikace má podporovat porozumění i regeneraci
  - zdrojové dokumenty jsou evidence, nikoliv automaticky pravda
  - Obsidian / LLM Wiki je interpretační a syntetická vrstva, nikoliv kanonická
    specifikace
  - ArchiMate model je formální projekce specifikace a architektonického
    porozumění
  - kód, dokumentace, views a exporty jsou odvozené artefakty
  - LLM je asistent, ne autorita
  - validace a exporty musí být deterministické
  - lidské rozhodnutí má přednost před návrhem agenta
  - traceability je důležitější než rychlá jednorázová generace
  - systém má růst iterativně a zůstat prakticky použitelný
  - systém je navržen jako local-first
  - lokální prostředí je primární pracovní prostor
  - vzdálené prostředí slouží pro sdílení a automatizaci
  - systém musí být použitelný bez závislosti na VPS

requirements:
  - evidovat specifikace po projektech
  - rozlišovat pracovní poznámky a platnou specifikaci
  - podporovat historii a verze
  - umožnit vazbu specifikace na kód a architekturu
  - umožnit vyhledání aktuální i předchozí verze specifikace
  - podporovat globální pohled na aplikaci
  - evidovat zdrojové PDF, DOCX, CSV, Markdown a modelové exporty v Source
    Evidence Repository
  - uchovávat metadata zdrojových dokumentů včetně původu, data, verze a hashe
  - umožnit zpracování zdrojových dokumentů do textu, tabulek, chunků a
    extrahovaných entit
  - podporovat RAG nad zdrojovými dokumenty, wiki, specifikací a modely
  - podporovat Obsidian / LLM Wiki jako znalostní vrstvu pro entity, pojmy,
    systémy, procesy a rozhodnutí
  - podporovat ArchiMate Model Repository pro prvky, vztahy, views a validační
    reporty
  - podporovat import a export ArchiMate Open Exchange formátu
  - umožnit generování ArchiMate views ze specifikace a modelu
  - umožnit kontrolu konzistence specifikace, wiki a ArchiMate modelu
  - umožnit evidenci rozhodnutí v ADR formátu
  - umožnit vazbu prvků modelu na zdrojovou evidenci
  - umožnit vazbu komponent specifikace na implementaci v ~/Projects
  - podporovat generování výstupních dokumentů ze schválené specifikace a modelu
  - podporovat lokální LLM agenta pro návrhy, extrakci, sumarizaci a validaci
  - ukládat agentní paměť, naučené patterny a opravy odděleně od kanonické
    specifikace
  - vyžadovat lidské potvrzení pro změny kanonické specifikace a schváleného
    modelu
  - umožnit audit změn specifikace, modelu a wiki s historií a zdroji
  - podporovat iterativní rozvoj systému s důrazem na praktickou použitelnost

```


# Big rocks (shrnutí)
Tento systém není:

* nástroj na psaní poznámek
* nástroj na řízení projektů
* náhrada IDE

Tento systém je:

specifikační a architektonický operační systém,
který propojuje:

* zdrojovou evidenci
* znalostní vrstvu
* kanonickou specifikaci
* formální architektonický model
* a implementaci

***

# Scope

## SpecSystem (kanonická vrstva)

- evidence kanonických specifikací projektů
- verzování specifikací (Git)
- strukturování specifikací (YAML + Markdown)
- vazba specifikace na projekt v Roamu
- vazba specifikace na implementaci v ~/Projects
- uchování architektonického pohledu na celek
- podpora regenerace implementace ze specifikace
- generování čitelného dokumentu (HTML/PDF/DOCX)

***

## Source Evidence Repository (nově explicitně)

- evidence zdrojových dokumentů:
    - PDF, DOCX, CSV, Markdown
    - ArchiMate Open Exchange, OpenXML
- uchování dokumentů v nezměněné podobě (raw)
- evidence metadata (zdroj, verze, datum, hash)
- možnost opakované extrakce dat ze zdrojů
- základní preprocessing:
    - převod na text
    - chunking
    - strukturování (např. tabulky)

Pozor: bez interpretace jako pravdy

***

## Obsidian / LLM Wiki (znalostní vrstva)

- tvorba a správa:
    - entit (aplikace, procesy, data, technologie)
    - pojmů a konceptů
    - syntéz dokumentů
- propojení znalostí (linkování, graf)
- ukládání interpretací LLM
- příprava podkladů pro:
    - specifikaci
    - ArchiMate model
    - výstupní dokumenty

***

## ArchiMate Model Repository

- reprezentace architektury jako:
    - prvky (elements)
    - vztahy (relationships)
    - views
- validace konzistence modelu
- vazba prvků na:
    - specifikaci
    - zdrojovou evidenci
- import/export:
    - ArchiMate Open Exchange XML
- generování základních views

***

## RAG / Knowledge Retrieval

- indexace:
    - zdrojových dokumentů
    - wiki
    - specifikací
- vyhledávání relevantního kontextu pro:
    - LLM
    - uživatele
- podpora traceability (odkaz na zdroj)

***

## LLM asistence (lokální)

- extrakce entit a vztahů ze zdrojů
- návrhy změn:
    - specifikace
    - ArchiMate modelu
- sumarizace dokumentů
- generování strukturovaných výstupů (JSON)
- podpora práce ve Wiki

pouze jako asistent, ne autorita

***

## Traceability & vazby

- vazba:
    - dokument → wiki → specifikace → model → kód
- dohledatelnost:
    - odkud vznikl prvek/model/rozhodnutí
- evidence změn a jejich důvodů

***
# Out of scope

## Knowledge & work management

- pracovní poznámky (Roam)
- backlog a task management
- řízení projektů

***

## Implementace

- samotná správa zdrojového kódu
- build pipeline aplikací
- runtime aplikací

***

## Agent orchestrace (důležité upřesnění)

- autonomní běh agentů
- multi-agent systémy
- plánování a řízení agentních workflow
- self-modifying systém bez kontroly

## LLM je pouze nástroj, ne autonomní systém

***

## Automatická autorita

- automatické změny kanonické specifikace bez schválení
- automatické změny ArchiMate modelu bez validace
- automatické generování finálních dokumentů bez kontroly



# Architektura systému

## Účel
Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

## Hlavní oddělení
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

***

2. Obsidian / LLM Wiki

- entity (aplikace, procesy, data, technologie)
- pojmy a koncepty
- syntézy dokumentů
- znalostní graf (linkování)
- pracovní základ pro AI

***

3. SpecSystem

- kanonická specifikace projektu
- YAML + Markdown
- verzování (Git)
- ADR (rozhodnutí)
- vazby na model a implementaci

***

4. ArchiMate Model Repository

- prvky (elements)
- vztahy (relationships)
- views
- validace modelu
- import/export Open Exchange XML

***

5. RAG / Knowledge Layer

- indexace:
    - zdrojových dokumentů
    - wiki
    - specifikací
- retrieval kontextu pro LLM
- podpora traceability

***

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
    ├── templates
    │   └── project-spec
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


# Komponenty

```yaml
components:
  # CORE SPEC LAYER

  - id: spec_root
    name: Root specifikace
    purpose: Vstupní bod pro pochopení projektu a kanonická reprezentace systému

  - id: motivation_layer
    name: Motivační vrstva
    purpose: Zachycení důvodů, cílů, omezení a požadavků

  - id: architecture_view
    name: Architektonický pohled
    purpose: Globální porozumění systému jako celku

  - id: component_catalog
    name: Katalog komponent
    purpose: Rozpad systému na pochopitelné a regenerovatelné části

  - id: decisions_log
    name: Log rozhodnutí
    purpose: Uchování důvodů zásadních návrhových voleb (ADR)

  - id: regeneration_description
    name: Popis regenerace
    purpose: Vymezení toho, jak lze systém znovu vytvořit

  - id: validation_layer
    name: Validační vrstva
    purpose: Kontrola konzistence specifikace, modelu a vazeb

  - id: agent_memory
    name: Paměť agenta
    purpose: Uchování naučených patternů, preferencí a oprav (mimo kanonickou
      specifikaci)

  # INPUT / EVIDENCE LAYER

  - id: source_evidence_repository
    name: Source Evidence Repository
    purpose: Uchování zdrojových dokumentů a modelů jako evidence (PDF, DOCX, CSV,
      Open Exchange, OpenXML)

  - id: source_processing
    name: Zpracování zdrojů
    purpose: Transformace dokumentů na text, strukturovaná data, chunky a
      extrahované entity

  # KNOWLEDGE LAYER

  - id: llm_wiki
    name: Obsidian / LLM Wiki
    purpose: Znalostní a interpretační vrstva pro entity, pojmy, syntézy a vazby

  - id: rag_layer
    name: RAG / Knowledge Retrieval
    purpose: Vyhledávání relevantního kontextu napříč dokumenty, wiki a specifikací

  # MODEL LAYER

  - id: archimate_repository
    name: ArchiMate Model Repository
    purpose: Formální reprezentace architektury pomocí prvků, vztahů a views

  - id: model_validation
    name: Validace modelu
    purpose: Kontrola správnosti ArchiMate modelu a jeho vazby na specifikaci

  # OUTPUT LAYER

  - id: publication_layer
    name: Publikační vrstva
    purpose: Generování čitelného dokumentu ze specifikace

  - id: document_generation
    name: Generování výstupních dokumentů
    purpose: Tvorba formálních dokumentů (OHA formulář, zadávací dokumentace,
      architektonická dokumentace)

  - id: template_engine
    name: Šablonovací engine
    purpose: Deterministická transformace specifikace a modelu do výstupních formátů
      (HTML, DOCX, PDF)

  # IMPLEMENTATION LINK

  - id: implementation_link
    name: Vazba na implementaci
    purpose: Propojení specifikace a modelu s implementací v ~/Projects

```


# Rozhodnutí

## ADR-001: Specifikace jsou uloženy mimo ~/Projects
### Stav
Přijato

### Důvod
Kód je nahraditelný artefakt. Specifikace je primární znalostní zdroj.

### Dopad
Vzniká oddělený repozitář ~/SpecSystem.

***

## ADR-002: Jedna aplikace má jeden root specifikace
### Stav
Přijato

### Důvod
Je potřeba mít jednoznačný vstupní bod pro porozumění systému.

### Dopad
Každý projekt má jednu kořenovou složku ve SpecSystem.

***

## ADR-003: Roam není kanonické uložiště specifikací
### Stav
Přijato

### Důvod
Roam je vhodný pro myšlení a vazby, ale ne jako kanonický, verzovaný a strojově čitelný zdroj pravdy.

### Dopad
Roam drží projektový kontext. SpecSystem drží platnou specifikaci.

***

## ADR-004: Specifikace musí jít publikovat do čitelného dokumentu
### Stav
Přijato

### Důvod
Kanonický zdroj není totéž co čitelný dokument pro práci a revizi.

### Dopad
Ve specifikaci existuje publikační vrstva a build proces.

***

## ADR-005: Zdrojové dokumenty jsou evidence, nikoliv kanonická pravda

### Stav

Přijato

### Důvod

Vstupní dokumenty (PDF, DOCX, CSV, modely) mohou být neaktuální, neúplné nebo nekonzistentní.
Je nutné oddělit realitu vstupů od interpretace a od schválené specifikace.

### Dopad

Vzniká Source Evidence Repository.
Specifikace nevzniká přímým převodem dokumentů, ale jejich interpretací.

***

## ADR-006: Obsidian / LLM Wiki je interpretační vrstva, ne zdroj pravdy

### Stav

Přijato

### Důvod

Je potřeba mít prostor pro syntézu, pojmy a vazby bez narušení kanonické specifikace.

### Dopad

Wiki slouží pro:

* extrakci entit
* syntézu znalostí
* práci LLM

SpecSystem zůstává jediný kanonický zdroj.

***

## ADR-007: ArchiMate model je formální projekce specifikace

### Stav

Přijato

### Důvod

Architektonický model musí být strukturovaný, validovatelný a nástrojově přenositelný.

### Dopad

Vzniká ArchiMate Model Repository.
Model:

* je odvozený ze specifikace
* může být použit pro validaci
* může být exportován (Open Exchange XML)

***

## ADR-008: Výstupní dokumenty jsou odvozené artefakty

### Stav

Přijato

### Důvod

Dokumenty (OHA, zadávací dokumentace, architektonické reporty) slouží ke komunikaci, ne jako zdroj pravdy.

### Dopad

Vzniká outputs/ vrstva.
Dokumenty jsou generované deterministicky ze:

* SpecSystem
* ArchiMate modelu

***

## ADR-009: LLM je asistent, ne autorita

### Stav

Přijato

### Důvod

LLM může generovat chyby, halucinace a nekonzistentní výstupy.

### Dopad

LLM může:

* navrhovat změny
* extrahovat data
* generovat návrhy

LLM nesmí:

* měnit kanonickou specifikaci bez potvrzení
* měnit model bez validace

***

## ADR-010: Traceability je povinná napříč vrstvami

### Stav

Přijato

### Důvod

Bez dohledatelnosti není možné ověřit správnost specifikace ani modelu.

### Dopad

Každý prvek může být navázán na:

* zdrojový dokument
* wiki entitu
* rozhodnutí
* implementaci

## ADR-011: Local-first architektura s doplňkovým VPS

### Stav
Přijato

### Důvod
Uživatel potřebuje:
- plnou kontrolu nad daty
- možnost práce offline
- nízkou latenci
- bezpečnost citlivých informací

Zároveň je potřeba:
- sdílení
- automatizace
- běh agentů

### Dopad
Systém je rozdělen:

- MacBook:
  - primární pracovní prostředí
  - LLM běží lokálně

- VPS:
  - OpenClaw orchestrace
  - sdílené repozitáře
  - agentní úlohy

Systém je funkční i bez VPS.

## ADR-012: Obsidian Wiki je společná napříč projekty

### Stav
Přijato

### Důvod
Wiki má sloužit jako znalostní báze napříč projekty, nikoliv jako izolovaná projektová dokumentace.

### Dopad
Wiki je umístěna v `shared/wiki/`.

Projektové znalosti jsou členěny v `shared/wiki/projects/<project-id>/`.


# Vazby

```yaml
links:
  roam:
    project_page: "PO/Uložiště specifikací"

  local_paths:
    spec_root: "~/SpecSystem/projects"
    projects_root: "~/Projects"
    sources_root: "~/SpecSystem/shared/sources"
    wiki_root: "~/SpecSystem/shared/wiki"
    models_root: "~/SpecSystem/shared/models"
    template_root: "~/SpecSystem/shared/templates"

  related_projects: []

  related_tools:
    - name: Roam Research
      purpose: myšlení, poznámky, projektový kontext

    - name: Obsidian
      purpose: LLM Wiki, znalostní báze, entity a syntézy

    - name: VS Code
      purpose: práce se specifikací a kódem

    - name: iTerm2
      purpose: shell a build skripty

    - name: Git
      purpose: verzování specifikací a artefaktů

    - name: Pandoc
      purpose: generování dokumentů (HTML, PDF, DOCX)

    - name: ArchiMate Tool
      purpose: práce s ArchiMate modely a Open Exchange

  llm:
    provider: local
    runtime: ollama
    models:
      primary:
        name: qwen3.5:14b
        purpose: extrakce, strukturování, návrhy
      experimental:
        name: qwen3.5:35b-a3b-coding-nvfp4
        purpose: pokročilé úlohy (pokud HW dovolí)
      embeddings:
        name: nomic-embed-text
        purpose: RAG a vyhledávání

    constraints:
      - běh lokálně (bez cloudu)
      - LLM není zdroj pravdy
      - změny SPEC vyžadují potvrzení

  obsidian:
    vault_path: "/Users/radimpokorny/SpecSystem/shared/wiki"
    role: "LLM Wiki, společná znalostní báze napříč projekty"

```


# Regenerace

## Cíl

Zachovat takové informace, aby bylo možné systém nebo jeho části znovu vytvořit ze specifikace, modelu a evidovaných vstupů.

## Regenerace zahrnuje:

* porozumění systému
* rekonstrukci architektury
* znovuvytvoření dokumentace
* přípravu vstupů pro implementaci

***

## Nezbytné vstupy

### Kanonická specifikace (SpecSystem)

* motivace
* scope
* architektonický pohled
* katalog komponent
* log rozhodnutí (ADR)
* popis regenerace
* vazby na implementaci

### Architektonický model (ArchiMate)

* prvky (elements)
* vztahy (relationships)
* views
* validační pravidla

### Zdrojová evidence (Source Evidence)

* PDF, DOCX, CSV, Markdown
* importované modely (Open Exchange, OpenXML)
* metadata zdrojů (původ, verze)

### Znalostní vrstva (Wiki)

* entity (aplikace, procesy, data, technologie)
* pojmy a definice
* syntézy dokumentů

### Implementační vazby

* odkazy na repozitáře v ~/Projects
* struktura projektů
* základní build/regeneration skripty

***

## Regenerovatelné části

### Specifikační vrstva

* struktura specifikace projektu
* čitelný dokument (HTML, PDF, DOCX)
* architektonické popisy

### Architektonická vrstva

* ArchiMate model (elementy, vztahy, views)
* základní architektonické diagramy
* validační reporty

### Dokumentační výstupy

* architektonická dokumentace
* OHA formulář
* zadávací dokumentace
* exporty specifikace

### Implementační vstupy

* strukturované vstupy pro AI generaci kódu
* zadání pro jednotlivé komponenty
* základní skeleton aplikace (pokud definováno)

***

## Neregenerovatelné části bez doplnění

* nezdokumentovaná implicitní rozhodnutí
* nezachycený provozní kontext
* neuložené experimentální prompty
* ad-hoc úpravy provedené mimo SpecSystem
* nezdokumentované vazby mezi komponentami
* neuložené verze zdrojových dokumentů

***

## Pravidla regenerace

* specifikace je primární zdroj pravdy
* model je formální reprezentace architektury
* dokumenty jsou odvozené artefakty
* implementace je rekonstruovatelná pouze v rozsahu definovaném ve specifikaci

***

## Role LLM při regeneraci

### LLM může:

* interpretovat specifikaci a model
* generovat návrhy implementace
* doplňovat textové části dokumentace
* pomáhat s rekonstrukcí kontextu

### LLM nesmí:

* být jediným zdrojem pravdy
* měnit kanonickou specifikaci bez potvrzení
* generovat finální artefakty bez validace



# Historie

## v0.1
### Změna
Vytvořena první kanonická specifikace systému Uložiště specifikací.

### Důvod
Bootstrap systému pro evidenci a správu specifikací.

### Dopad
Vznikl základ pro odvození šablony všech dalších projektových specifikací.
***

## v0.2
### Změna
Transformace systému z „uložiště specifikací“ na vrstvený systém:
- evidence → znalosti → specifikace → model → výstupy

### Důvod
Původní koncept neřešil:
- práci se zdrojovými dokumenty
- interpretaci znalostí
- formální model architektury

### Dopad
Vznikl SpecSystem jako:
knowledge + specification + architecture operating system

