---
title: "Specifikace projektu: tech-radar"
date: "2026-04-14"
lang: cs-CZ
toc: true
numbersections: false
---

# Přehled

Tento dokument je generovaný view dokument složený z kanonických artefaktů projektu `tech-radar`.


# Meta

```yaml
meta:
  id: tech-radar
  name: tech-radar

  type: system # system | feature | tool
  status: draft # draft | active | archived

  owner: Radim
  canonical_version: 0.1

  created: 2026-04-10
  updated: 2026-04-10

links:
  roam_project: "PO/..."
  code_repositories: []
  related_specs: []
  archimate_model: ""

```


# Motivace

```yaml
motivation:
  stakeholders:
    - name: Radim
      role: jediný uživatel a administrátor systému

  drivers:
    - Chybí osobní radar pro technologické novinky vedoucí k vlastním projektům a bastlení.
    - Běžné informační zdroje přinášejí inspiraci, ale nejsou filtrovány podle osobní relevance.
    - Je potřeba zachytit aha momenty a převést je do další práce v osobním PKM workflow.

  assessment:
    - Relevantní novinky jsou rozptýlené napříč technologickými weby a feedy.
    - Bez filtrace a scoringu vzniká informační šum místo použitelné inspirace.
    - Současný stav nepodporuje systematický převod článků do Roam Research jako zdrojových poznámek.

  goals:
    - Pravidelně dodávat kurátorované technologické novinky s vysokou relevancí pro osobní projekty.
    - Podporovat vznik osobních projektů nebo rozhodnutí o pořízení užitečných nástrojů.
    - Poskytovat stručný, přehledný a nezahlcující přehled článků připravených k dalšímu zpracování.

  constraints:
    - Systém je čistě osobní a neveřejný.
    - Přístup je pouze přes Tailscale nebo VPN, bez aplikačního přihlášení.
    - Datový model v SQLite a business logika pipeline jsou stabilní a neregenerují se.
    - Staré články není nutné reanalyzovat, retence je omezena na posledních 30 dní.

  principles:
    - Upřednostnit inspiraci pro projekty před obecným technologickým přehledem.
    - Systém má inspirovat, ne nutit k akci ani zahlcovat.
    - Používat malé, srozumitelné a oddělitelné části systému.
    - Oddělit stabilní doménovou vrstvu od regenerovatelných UI a API kontraktů.

  requirements:
    - Sbírat články primárně z RSS zdrojů, výjimečně z vybraných jiných zdrojů.
    - Pro každý článek ukládat metadata, shrnutí, vysvětlení relevance, section a score.
    - Podporovat deduplikaci, filtrování, stav přečteno a uloženo, a export do Roam.
    - Umožnit správu zdrojů včetně include/exclude keywords a enable/disable stavu.
    - Používat OpenClaw agenty pro analýzu, scoring a filtraci článků.

```


# Scope

## Účel
Tech-radar je osobní systém pro sběr a kuraci technologických článků, který má z novinek vytahovat podněty relevantní pro vlastní projekty a hi-tech bastlení.

## In scope
- Sběr článků z evidovaných zdrojů, primárně přes RSS.
- Zpracování každého RSS itemu jako samostatného článku.
- Cronem spouštěná pipeline pro ingestion, analýzu, scoring a deduplikaci.
- Deduplikace používá URL jako hard-duplicate pravidlo; podobnost titulku nebo zdrojového obsahu může být použita jen jako soft-duplicate heuristika pro rozhodnutí o zahazování nebo aktualizaci kandidáta.
- Ukládání zdrojů, článků a uživatelského stavu do SQLite.
- Analýza článků pomocí OpenClaw agentů.
- Evidence polí title, url, source, section, summary_cz, why_matters_cz, published, fetched_at a score.
- Score je kanonicky normalizované číslo v rozsahu 0.0 až 1.0, kde 1.0 znamená nejvyšší relevanci pro osobní projekty a bastlení.
- Section jako doménový pojem pro kategorie, např. AI, infrastruktura, tooling, Apple/macOS, ostatní.
- Filtrování článků podle section, zdroje a stavu přečteno/uloženo.
- Uživatelské akce otevřít článek, označit jako přečtený, uložit/bookmark a exportovat do Roam.
- Samostatná stránka pro správu zdrojů včetně create, update, include/exclude keywords a enable/disable stavu.
- Roam export jako backendem sestavený textový blok vracený přes interní API a připravený ke zkopírování do clipboardu v UI.
- Retence dat za posledních 30 dní.

## Canonical contracts in scope
- Score je kanonicky normalizované číslo `0.0..1.0`; SPEC nedefinuje přesný výpočet score, pouze povinný rozsah a interpretační význam.
- Section je kanonická textová kategorie; minimální očekávaná taxonomie pro MVP je `AI`, `infrastruktura`, `tooling`, `Apple/macOS`, `ostatní`.
- URL je kanonický identifikátor hard-duplicate pravidla.
- Soft-duplicate kontrola je heuristika a nesmí přebít hard-duplicate pravidlo podle URL.
- Include/exclude keywords jsou lokální pravidla zdroje aplikovaná nad titulkem a dostupným feed summary/description textem.
- Roam export vrací backend textový blok sestavený z minimálně: `title`, `url`, `source`, `section`, `score`, `published`, `summary_cz`, `why_matters_cz`.

## Out of scope
- Veřejný informační web nebo sdílený systém pro více uživatelů.
- Přihlašování a správa identit.
- Automatické vytváření samostatných project ideas.
- Ukládání plného textu článků jako primárního artefaktu.
- Regenerace business logiky pipeline nebo databázového modelu.
- Přepočet a reanalýza starých článků.

## Non-goals
- Maximální pokrytí všech technologických novinek.
- Tlak na uživatele, aby konal podle doporučení systému.
- Provoz bez výpadků AI části.
- Nahrazení osobního úsudku při výběru inspirací.



# Architektura

## Účel architektury
Architektura Tech-radaru odděluje stabilní doménovou vrstvu od regenerovatelných částí systému. Stabilní zůstává databázový model a pipeline pro ingestion, analýzu a deduplikaci. Regenerovatelné jsou UI, API kontrakty a Roam export formát. Návrh používá malé komponenty s jasnými hranicemi, aby byl systém pochopitelný bez čtení kódu a dobře použitelný pro AI-agenty.

## Architektonické vrstvy
- Motivation
  - osobní radar pro technologické novinky relevantní pro vlastní projekty a bastlení
- Business
  - správa zdrojů
  - sběr článků
  - analýza článků
  - deduplikace a scoring
  - export do Roam
- Application
  - worker pro ingestion pipeline
  - analytické a deduplikační služby
  - FastAPI backend
  - Next.js UI
- Technology
  - RSS a vybrané externí webové zdroje
  - OpenClaw agenti
  - SQLite
  - cron na VPS
  - privátní přístup přes Tailscale/VPN

## Hlavní komponenty
- **source management**
  - správa evidovaných zdrojů, jejich URL, include/exclude keywords, enable/disable stavu a priority
- **ingestion pipeline**
  - cronem spouštěný worker, který načítá aktivní zdroje a vytváří kandidátní články z RSS itemů
- **OpenClaw analysis**
  - analýza článků pomocí agentů, generování summary_cz, why_matters_cz, section a normalizovaného score v rozsahu 0.0 až 1.0
- **deduplication/scoring**
  - kontrola duplicit podle URL jako hard-duplicate pravidla a volitelně podle podobnosti jako soft-duplicate heuristiky, potvrzení nebo odmítnutí kandidátů pro uložení
- **SQLite storage**
  - perzistence zdrojů, článků a uživatelského stavu jako stabilní doménové vrstvy
- **FastAPI backend**
  - interní aplikační rozhraní pro čtení článků, správu zdrojů a uživatelské akce
- **Next.js UI**
  - dvě obrazovky: přehled článků a správa zdrojů
- **Roam export**
  - backendové generování textového bloku podle stabilní exportní šablony, který UI kopíruje do clipboardu

## API contract boundary
Backend vystavuje interní HTTP JSON API. Cesta prefixu `/api` je kanonická pro regenerovatelné kontrakty UI ↔ backend.

Minimální kanonické endpoint capability jsou:
- články
  - seznam článků s filtrem podle `section`, `source`, `read`, `saved`
  - detail článku
  - akce `read/unread`
  - akce `save/unsave`
  - akce `roam export`, která vrací backendem sestavený textový blok
- zdroje
  - seznam zdrojů
  - create zdroje
  - update zdroje
  - enable zdroje
  - disable zdroje
- health endpoint pro základní provozní kontrolu

SPEC na této úrovni fixuje capability a ownership kontraktu, ne konkrétní frameworkovou implementaci handlerů.

## Stable vs heuristic behavior
- Hard-duplicate rozhodnutí podle URL je stabilní pravidlo.
- Soft-duplicate rozhodnutí podle podobnosti je heuristika a musí být implementováno odděleně od hard-duplicate pravidla.
- Datový model SQLite je stabilní vrstva.
- API shape, UI struktura a Roam export formát jsou regenerovatelné části, ale musí respektovat zde popsané capability a ownership.
- Scoring algorithm a OpenClaw prompting jsou heuristické implementační detaily, pokud dodrží kanonický output contract.

## Hlavní vztahy
- Source management udržuje seznam aktivních zdrojů a jejich filtračních pravidel ve SQLite.
- Ingestion pipeline čte aktivní zdroje a vytváří vstupní sadu článků ke zpracování.
- OpenClaw analysis zpracuje kandidátní články a vrací strukturované výstupy pro uložení včetně normalizovaného score 0.0 až 1.0.
- Deduplication/scoring rozhoduje, zda článek uložit, aktualizovat nebo zahodit jako duplicitní; shoda URL znamená hard duplicate, podobnost slouží pouze jako podpůrná soft-duplicate heuristika.
- SQLite storage poskytuje stabilní perzistenci pro backend i worker.
- FastAPI backend zpřístupňuje články, zdroje a uživatelské akce pro UI.
- Next.js UI zobrazuje články, filtry a správu zdrojů nad API kontrakty backendu.
- Roam export používá uložená data článku, backendově vytváří exportní textový blok a UI jej nabízí ke zkopírování.
- Worker odpovídá za retention cleanup dat starších než 30 dní; tato odpovědnost není v UI ani backendu primárně vlastněna.

## ArchiMate model
- nástroj: zatím neurčeno
- soubor: zatím neurčeno
- hlavní pohledy:
  - business flow zdroj → ingestion → analysis → deduplication/scoring → storage → UI → Roam export
  - application cooperation mezi workerem, backendem, OpenClaw a SQLite
  - deployment view pro VPS, cron, FastAPI, Next.js a privátní VPN přístup



# Komponenty

```yaml
components:
  - id: source_manager
    name: Source Manager

    type: application_component
    layer: application

    purpose: Spravuje evidované zdroje článků a jejich lokální pravidla filtrace.

    responsibilities:
      - vytvářet, upravovat, zapínat a vypínat zdroje
      - ukládat include_keywords a exclude_keywords pro každý zdroj
      - poskytovat seznam aktivních zdrojů ingestion workeru

    interfaces:
      - fastapi
      - sqlite

  - id: rss_ingestion_worker
    name: RSS Ingestion Worker

    type: application_component
    layer: application

    purpose: Cronem spouštěný worker, který načítá aktivní RSS zdroje a vytváří kandidátní články.

    responsibilities:
      - načítat aktivní zdroje ze storage
      - stahovat RSS feedy a převádět itemy na kandidátní články
      - aplikovat include/exclude keywords nad titulkem a dostupným feed summary/description textem
      - předávat kandidátní články do analytické a deduplikační části pipeline
      - provádět retention cleanup dat starších než 30 dní

    interfaces:
      - cli
      - rss
      - sqlite

  - id: article_analyzer
    name: Article Analyzer

    type: application_component
    layer: application

    purpose: Používá OpenClaw agenty pro analýzu článků a vytvoření strukturovaného výstupu.

    responsibilities:
      - generovat summary_cz a why_matters_cz
      - určovat section podle doménových kategorií
      - určovat normalizované score v rozsahu 0.0 až 1.0, kde 1.0 je nejlepší
      - vracet strukturovaný výstup obsahující minimálně `summary_cz`, `why_matters_cz`, `section`, `score`

    interfaces:
      - openclaw
      - internal_service

  - id: deduplication_service
    name: Deduplication Service

    type: application_component
    layer: application

    purpose: Rozpoznává duplicity a rozhoduje o uložení nebo zahazování kandidátních článků.

    responsibilities:
      - porovnávat články podle URL jako hard-duplicate pravidla
      - volitelně porovnávat články podle podobnosti titulků nebo zdrojového obsahu jako soft-duplicate heuristiku
      - rozhodovat, zda kandidáta zahodit, aktualizovat nebo propustit do persistence
      - nikdy nepřebít hard-duplicate pravidlo podle URL soft-duplicate heuristikou

    interfaces:
      - internal_service
      - sqlite

  - id: article_repository
    name: Article Repository

    type: application_component
    layer: application

    purpose: Zajišťuje přístup ke stabilnímu uložení článků a jejich stavů v SQLite.

    responsibilities:
      - ukládat články a jejich metadata
      - ukládat uživatelský stav přečteno a uloženo
      - poskytovat filtrování podle section, zdroje a stavu
      - zachovávat stabilní mapování na tabulky `sources`, `articles` a `article_state`

    interfaces:
      - sqlite
      - internal_service

  - id: roam_exporter
    name: Roam Exporter

    type: application_component
    layer: application

    purpose: Sestavuje na backendu textový blok článku podle exportní šablony pro vložení do Roam Research.

    responsibilities:
      - převádět data článku do Roam formátu
      - připravovat backendový výstup určený ke zkopírování v UI
      - držet exportní formát odděleně od persistence a pipeline
      - používat minimálně pole `title`, `url`, `source`, `section`, `score`, `published`, `summary_cz`, `why_matters_cz`

    interfaces:
      - internal_service

  - id: articles_api
    name: Articles API

    type: application_component
    layer: application

    purpose: Zpřístupňuje články a uživatelské akce nad články přes FastAPI.

    responsibilities:
      - vracet seznam článků a detaily článku
      - podporovat filtrování podle section, zdroje a stavu
      - obsluhovat akce read, unread, save, unsave a backendově sestavený roam export
      - vystavovat interní HTTP JSON kontrakty pod prefixem `/api`

    interfaces:
      - http_json
      - fastapi

  - id: sources_api
    name: Sources API

    type: application_component
    layer: application

    purpose: Zpřístupňuje správu zdrojů přes FastAPI.

    responsibilities:
      - vracet seznam zdrojů
      - obsluhovat create, update, enable a disable operace
      - předávat změny do source_manageru
      - vystavovat interní HTTP JSON kontrakty pod prefixem `/api`

    interfaces:
      - http_json
      - fastapi

  - id: radar_ui
    name: Radar UI

    type: application_component
    layer: application

    purpose: Poskytuje osobní webové rozhraní pro práci s články a zdroji.

    responsibilities:
      - zobrazovat stránku článků s filtry a akcemi
      - zobrazovat stránku správy zdrojů
      - umožňovat zkopírování Roam exportu do clipboardu
      - poskytovat UI tok pro create a update zdrojů

    interfaces:
      - nextjs
      - browser
      - http_json

  - id: sqlite_storage
    name: SQLite Storage

    type: data_object
    layer: technology

    purpose: Stabilní datové úložiště pro zdroje, články a uživatelský stav.

    responsibilities:
      - uchovávat tabulky `sources`, `articles` a `article_state`
      - držet stabilní databázový model mimo regenerovatelnou vrstvu
      - poskytovat perzistenci pro worker i backend

    schema:
      sources:
        - id
        - name
        - url
        - kind
        - include_keywords
        - exclude_keywords
        - priority
        - enabled
        - created_at
        - updated_at
      articles:
        - id
        - title
        - url
        - source_id
        - source
        - section
        - summary_cz
        - why_matters_cz
        - published
        - fetched_at
        - score
      article_state:
        - article_id
        - is_read
        - is_saved
        - updated_at

    interfaces:
      - sqlite

  - id: openclaw_analysis_service
    name: OpenClaw Analysis Service

    type: service
    layer: technology

    purpose: Externě volaná analytická schopnost poskytovaná OpenClaw agenty.

    responsibilities:
      - analyzovat články podle zadaného promptu
      - vracet strukturovaný výstup pro `summary_cz`, `why_matters_cz`, `section`, `score`
      - podporovat osobní filtrační logiku zaměřenou na projektovou inspiraci
      - respektovat, že přesný prompt a scoring algorithm nejsou ve SPEC fixované a zůstávají heuristické

    interfaces:
      - openclaw

relations:
  - source: source_manager
    target: sqlite_storage

    type: access
    description: Spravuje a čte zdroje uložené ve SQLite.

  - source: sources_api
    target: source_manager

    type: serving
    description: API používá source manager pro správu zdrojů.

  - source: radar_ui
    target: sources_api

    type: flow
    description: UI volá Sources API pro zobrazení a úpravu zdrojů.

  - source: rss_ingestion_worker
    target: source_manager

    type: flow
    description: Worker získává seznam aktivních zdrojů a jejich pravidel.

  - source: rss_ingestion_worker
    target: article_analyzer

    type: flow
    description: Worker předává kandidátní články do analýzy.

  - source: article_analyzer
    target: openclaw_analysis_service

    type: association
    description: Analyzer používá OpenClaw agenty pro analýzu článků.

  - source: article_analyzer
    target: deduplication_service

    type: flow
    description: Výstup analýzy vstupuje do deduplikačního rozhodnutí.

  - source: deduplication_service
    target: article_repository

    type: flow
    description: Unikátní články předává do persistence.

  - source: article_repository
    target: sqlite_storage

    type: access
    description: Repository ukládá a čte články a jejich stavy ve SQLite.

  - source: articles_api
    target: article_repository

    type: serving
    description: Articles API používá repository pro čtení článků a změny stavu.

  - source: articles_api
    target: roam_exporter

    type: serving
    description: Articles API používá roam exporter pro přípravu exportu.

  - source: radar_ui
    target: articles_api

    type: flow
    description: UI volá Articles API pro seznam článků, filtry a akce.

```


# Rozhodnutí

---

## ADR-001: Score je kanonicky normalizované číslo 0.0 až 1.0

### Stav
Schváleno

### Kontext
SPEC potřebuje jednotný kontrakt pro score napříč analýzou, ukládáním, filtrováním a UI. Bez toho vzniká prostor pro nekonzistentní regeneraci.

### Rozhodnutí
Kanonická škála score je `0.0..1.0`, kde `1.0` znamená nejvyšší relevanci pro osobní projekty a bastlení. SPEC fixuje rozsah a význam score, nikoli konkrétní výpočetní algoritmus.

### Důsledky
Backend, UI i worker musí používat stejný datový typ a interpretaci. Implementace může měnit heuristiku výpočtu, pokud zachová tento output contract.

---

## ADR-002: URL je hard-duplicate pravidlo, podobnost je pouze soft-duplicate heuristika

### Stav
Schváleno

### Kontext
Deduplikace byla popsána příliš vágně a hrozilo, že různé implementace budou zacházet s podobností titulku nebo obsahu odlišně.

### Rozhodnutí
Shoda URL je kanonický hard duplicate. Podobnost titulku nebo zdrojového obsahu je pouze podpůrná soft-duplicate heuristika a nesmí přebít hard-duplicate pravidlo.

### Důsledky
Regenerované implementace musí držet stabilní chování v případě shodné URL. Soft deduplikace může používat různé prahy nebo algoritmy, ale jen jako heuristiku.

---

## ADR-003: Roam export je backend-owned contract

### Stav
Schváleno

### Kontext
Bylo potřeba odstranit nejasnost, zda je Roam export generován v UI nebo backendu.

### Rozhodnutí
Roam export je vlastněn backendem. Backend vrací textový blok připravený ke zkopírování a UI jej pouze vyžádá a nabídne do clipboardu.

### Důsledky
Formát exportu zůstává oddělený od UI implementace. Regenerace frontendu nesmí přesouvat ownership exportní šablony do klienta.

---

## ADR-004: OpenClaw analysis má stabilní output contract a heuristický interní postup

### Stav
Schváleno

### Kontext
SPEC vyžaduje OpenClaw analýzu, ale neobsahuje přesný prompt ani scoring postup. Bez rozhodnutí není jasné, co musí být stabilní a co může být implementační detail.

### Rozhodnutí
Stabilní je pouze output contract analýzy: `summary_cz`, `why_matters_cz`, `section`, `score`. Prompting, model selection a scoring heuristika nejsou fixované SPEC a mohou se měnit.

### Důsledky
Systém zůstává regenerovatelný i při změně interní analytické implementace. Regenerace musí zachovat datový výstup, nikoli konkrétní prompt.



# Vazby

```yaml
links:
  roam:
    project_page: "PO/..."

  local_paths:
    project_root: "~/Projects/tech-radar"
    spec_root: "~/SpecSystem/projects/tech-radar"

  repositories:
    - url: https://github.com/...
      description: hlavní repo

  services:
    - name: VPS
      type: infra
      provider: Hetzner

```


# Regenerace

## Princip
Systém je regenerovatelný ze specifikace.

## Vstupy pro regeneraci
- specifikace
- kontext
- data

## Regenerovatelné části
- backend
- frontend
- HTTP API kontrakty nad stabilním storage modelem
- Roam export formát při zachování backend ownership
- testy

## Neregenerovatelné části
- data
- stabilní SQLite datový model
- externí integrace

## Co musí být explicitní pro regeneraci
- kanonická škála a význam `score`
- hard-duplicate pravidlo podle URL
- ownership Roam exportu
- minimální output contract OpenClaw analýzy
- minimální capability backend API pro articles a sources
- minimální schema tabulek `sources`, `articles`, `article_state`

## Co zůstává heuristika
- scoring algorithm
- promptování a volba modelu pro OpenClaw analýzu
- soft-duplicate threshold a podobnostní algoritmus
- konkrétní UI kompozice v rámci definovaných obrazovek
- konkrétní endpoint path suffixes a request/response shape pod zachovanou capability hranicí

## Pravidla
- malé komponenty
- jasné hranice
- izolace změn
- neměnit stabilní storage contract při regeneraci UI nebo API bez explicitního rozhodnutí
- neodvozovat behavior z existující implementace, pokud je v konfliktu se SPEC

## Triggery regenerace
- změna specifikace
- pokles metrik
- refactoring


# Historie

---

## v0.1

### Změna
Inicializace projektu

### Důvod
Založení specifikace

---

## v0.x

### Změna
...

### Důvod
...

