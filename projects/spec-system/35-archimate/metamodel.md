# ArchiMate metamodel

## Účel

Tento dokument definuje pracovní metamodel pro používání ArchiMate v rámci SpecSystemu.

Cílem není popsat celý ArchiMate standard, ale vymezit:

- jaké typy prvků SpecSystem používá,
- jak se prvky mapují na specifikace,
- jaké vazby jsou povolené,
- jak vznikají views,
- jak se model validuje,
- jak se připravuje export do Open Exchange XML.

---

## Princip

ArchiMate model je formální projekce specifikace.

SPEC zůstává source of truth.  
ArchiMate model je odvozený, validovatelný a exportovatelný artefakt.

---

# Používané vrstvy

## Motivation Layer

Motivační vrstva popisuje důvody, cíle, omezení a požadavky systému.

Používané prvky:

- Stakeholder
- Driver
- Assessment
- Goal
- Requirement
- Constraint
- Principle

---

## Business Layer

Business vrstva popisuje služby, procesy, účastníky a obchodní objekty.

Používané prvky:

- Business Service
- Business Process
- Business Object
- Business Actor
- Contract

---

## Application Layer

Aplikační vrstva popisuje aplikační komponenty, aplikační služby a data.

Používané prvky:

- Application Component
- Application Service
- Data Object

---

## Technology Layer

Technologická vrstva popisuje infrastrukturu, provozní uzly a technické prostředky.

Používané prvky:

- Node
- Device
- System Software
- Communication Network
- Facility
- Technology Service

---

## Implementation & Migration Layer

Implementační vrstva popisuje projekty, příležitosti a transformační prvky.

Používané prvky:

- Project
- Work Package
- Deliverable
- Plateau
- Gap

---

# Motivační metamodel

## Stakeholder

Použití:

- osoba,
- tým,
- organizace,
- role,
- zúčastněná strana.

Příklady:

- Radim
- OpenClaw/Architecture-team
- OpenClaw/Dev-team
- NAKIT
- vlastník systému
- správce aplikace

---

## Driver

Použití:

Motivátor vyjadřuje důvod, proč systém nebo změna existuje.

Příklady:

- potřeba jednoznačné specifikace
- potřeba traceability
- potřeba regenerace implementace
- potřeba auditovatelnosti
- potřeba jednotného source of truth

---

## Assessment

Použití:

Hodnocení popisuje současný stav, problém, riziko nebo zjištění.

Příklady:

- specifikace jsou roztříštěné
- historie změn není řízená
- není jasné, která specifikace je platná
- dokumentace neodpovídá implementaci

---

## Goal

Použití:

Cíl popisuje žádoucí stav.

Příklady:

- mít kanonickou specifikaci projektu
- zajistit dohledatelnost změn
- umožnit regeneraci dokumentace
- podporovat AI agenty strukturovaným vstupem

---

## Requirement

Použití:

Požadavek popisuje konkrétní schopnost, kterou musí systém splnit.

Příklady:

- evidovat specifikace po projektech
- podporovat verzování
- generovat dokumentaci
- uchovávat vazbu na implementaci
- podporovat práci s lokálním LLM

---

## Constraint

Použití:

Omezení popisuje hranici, kterou systém nesmí překročit.

Příklady:

- systém musí být použitelný jedním člověkem
- systém nesmí být složitější než jeho přínos
- LLM nesmí měnit SPEC bez potvrzení
- citlivá data mají zůstat lokálně

---

## Principle

Použití:

Princip vyjadřuje stabilní architektonické pravidlo.

Příklady:

- specifikace je source of truth
- kód je odvozený artefakt
- wiki není kanonická specifikace
- memory není source of truth
- výstupy jsou regenerovatelné artefakty

---

# IS metamodel

## Business Service

Použití:

Business Service reprezentuje službu poskytovanou organizací nebo systémem.

Typické atributy:

- název
- popis
- garant
- ID služby
- regulovaná služba
- dostupnost

---

## Business Process

Použití:

Business Process reprezentuje řízený proces, který podporuje poskytování služby.

Typické atributy:

- název
- popis
- vlastník
- vstupy
- výstupy

---

## Application Component

Použití:

Application Component reprezentuje aplikační celek, systém nebo komponentu.

Typické atributy:

- název
- popis
- garant
- výrobce
- konec podpory
- číslo smlouvy o podpoře
- riziko dopadu

---

## Application Service

Použití:

Application Service reprezentuje službu poskytovanou aplikační komponentou.

Typické atributy:

- název
- popis
- garant
- regulovaná služba
- dostupnost

---

## Data Object

Použití:

Data Object reprezentuje informaci, datovou sadu nebo datový objekt.

Typické atributy:

- název
- popis
- garant
- primární aktivum

---

## Node

Použití:

Node reprezentuje technologický uzel, server, platformu nebo runtime prostředí.

Typické atributy:

- název
- popis
- garant
- výrobce
- kategorie zařízení

---

## Device

Použití:

Device reprezentuje fyzické zařízení.

Typické atributy:

- název
- popis
- garant
- výrobce
- kategorie zařízení

---

## System Software

Použití:

System Software reprezentuje operační systém, middleware nebo runtime platformu.

Typické atributy:

- název
- verze
- výrobce
- garant
- konec podpory

---

## Communication Network

Použití:

Communication Network reprezentuje síť nebo komunikační prostředí.

Typické atributy:

- název
- popis
- garant
- dopad

---

## Facility

Použití:

Facility reprezentuje fyzické nebo provozní umístění.

Typické atributy:

- název
- popis
- garant

---

## Contract

Použití:

Contract reprezentuje smlouvu vztahující se k systému, službě nebo dodavateli.

Typické atributy:

- název
- ID smlouvy
- garant
- platnost
- smluvní strana

---

## Supplier

Použití:

Supplier reprezentuje dodavatele.

Typické atributy:

- název
- kontakt
- smlouvy
- podporované komponenty

---

## Project

Použití:

Project reprezentuje projekt nebo změnovou iniciativu.

Typické atributy:

- název
- popis
- stav
- garant
- vazba na specifikaci

---

## Opportunity Card

Použití:

Opportunity Card reprezentuje kartu příležitosti nebo změnový námět.

Typické atributy:

- název
- ID příležitosti
- popis
- vazba na projekt
- stav

---

# Povolené vztahy

## Motivation Layer

Typické vztahy:

- Stakeholder influences Driver
- Driver influences Assessment
- Assessment influences Goal
- Goal realizes Requirement
- Requirement realizes Principle
- Constraint constrains Requirement
- Principle constrains Requirement

---

## Business/Application mapping

Typické vztahy:

- Business Process realizes Business Service
- Application Service serves Business Process
- Application Component realizes Application Service
- Application Component accesses Data Object
- Business Object is realized by Data Object

---

## Application/Technology mapping

Typické vztahy:

- Node hosts Application Component
- Device is assigned to Node
- System Software is assigned to Node
- Communication Network serves Node
- Technology Service serves Application Component

---

## Implementation mapping

Typické vztahy:

- Project realizes Requirement
- Work Package realizes Deliverable
- Deliverable realizes Requirement
- Project affects Application Component
- Project affects Business Service

---

# Naming conventions

## Element ID

Element ID musí být:

- stabilní,
- unikátní,
- lowercase,
- bez diakritiky,
- kebab-case.

Příklad:

- spec-system
- persistent-memory-layer
- archimate-model-repository
- source-evidence-repository

---

## Element name

Element name má být čitelný lidský název.

Příklad:

- SpecSystem
- Persistent Memory Layer
- ArchiMate Model Repository

---

## Relationship ID

Relationship ID má mít tvar:

- rel-source-target-type

Příklad:

- rel-specsystem-archimate-model-repository-realization
- rel-memory-wiki-serving

---

## View ID

View ID má mít tvar:

- view-project-purpose

Příklad:

- view-spec-system-motivation
- view-spec-system-layered-architecture
- view-spec-system-memory-flow

---

# Views

## Motivation View

Účel:

Zobrazit motivaci, cíle, požadavky, omezení a principy projektu.

Obsahuje:

- Stakeholders
- Drivers
- Assessments
- Goals
- Requirements
- Constraints
- Principles

---

## Layered Architecture View

Účel:

Zobrazit hlavní vrstvy systému a jejich odpovědnosti.

Obsahuje:

- Source Evidence Repository
- Persistent Memory Layer
- Obsidian / LLM Wiki
- SpecSystem
- ArchiMate Model Repository
- Output / Document Generation
- ~/Projects

---

## Information System View

Účel:

Zobrazit aplikační, datové, business a technologické prvky IS.

Obsahuje:

- Business Services
- Business Processes
- Application Components
- Application Services
- Data Objects
- Technology Nodes

---

## Traceability View

Účel:

Zobrazit vazby mezi zdroji, pamětí, specifikací, modelem a výstupy.

Obsahuje:

- Source Documents
- Memory
- Wiki
- SPEC
- ArchiMate Model
- Outputs

---

# Validace modelu

Model musí splňovat:

- každý element má unikátní ID
- každý relationship odkazuje na existující elementy
- každý view odkazuje na existující elementy
- každý důležitý prvek má traceability vazbu ke SPEC nebo source evidence
- model nesmí obsahovat nezdokumentované entity
- model nesmí být autoritou proti SPEC

---

# Open Exchange XML

Open Exchange XML je exportní formát ArchiMate modelu.

SpecSystem generuje Open Exchange XML jako odvozený artefakt z:

- elements.yaml
- relationships.yaml
- views.yaml
- případně graph.json

Cílové umístění:

`shared/models/archimate/projects/<project-id>/open-exchange.xml`

---

# Pravidlo source of truth

SPEC je source of truth.  
Memory je cognition layer.  
Wiki je interpretační vrstva.  
ArchiMate model je formální projekce.  
Open Exchange XML je exportní artefakt.
