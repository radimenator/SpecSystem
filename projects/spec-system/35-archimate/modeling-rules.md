# ArchiMate modeling rules

## Účel

Tento dokument definuje modelovací pravidla pro ArchiMate modely používané v rámci SpecSystem.

Cílem je zajistit:

- konzistenci modelů,
- srozumitelnost diagramů,
- stabilní export do Open Exchange XML,
- traceability mezi SPEC, memory, wiki a modelem,
- regenerovatelnost modelů.

---

# Základní principy

## SPEC je source of truth

ArchiMate model nikdy není primární autorita.

Model:

- vychází ze SPEC,
- formalizuje vztahy,
- umožňuje validaci,
- umožňuje vizualizaci,
- umožňuje export.

SPEC rozhoduje při konfliktu.

---

## Model je projekce reality

Model nereprezentuje vše.

Model zachycuje pouze:

- stabilní architektonické vztahy,
- významné dependency,
- důležité komponenty,
- důležité procesy,
- důležité datové vazby,
- klíčové motivace a omezení.

---

## Preferovat jednoduchost

Diagram nesmí být přeplněný.

Pokud view obsahuje:

- příliš mnoho vztahů,
- příliš mnoho crossing lines,
- příliš mnoho vrstev,

má být rozděleno.

---

## Jeden diagram = jeden účel

Každý view musí mít jasný účel.

Špatně:

- „všechno v jednom diagramu“

Správně:

- motivation view,
- layered architecture view,
- integration view,
- deployment view,
- security view,
- traceability view.

---

## Každý element musí mít význam

Do modelu nepatří:

- dekorativní objekty,
- nejasné entity,
- duplicity,
- krátkodobé experimenty,
- nevalidované hypotézy.

---

# Naming conventions

## ID pravidla

Každý element musí mít:

- stabilní ID,
- lowercase,
- kebab-case,
- bez diakritiky.

Příklad:

- spec-system
- persistent-memory-layer
- source-evidence-repository
- document-generation-layer

---

## Název elementu

Název musí být:

- lidsky čitelný,
- stručný,
- jednoznačný.

Preferovat:

- „SpecSystem“
- „Persistent Memory Layer“
- „Document Generation Layer“

Nepreferovat:

- „Systém pro správu dokumentů a souvisejících komponent“

---

## Relationship ID

Relationship ID:

- rel-source-target-type

Příklad:

- rel-specsystem-memory-serving
- rel-memory-wiki-access
- rel-project-output-generation

---

## View ID

View ID:

- view-project-purpose

Příklad:

- view-spec-system-motivation
- view-spec-system-layered-architecture
- view-spec-system-traceability

---

# Povolené vrstvy

## Motivation Layer

Používat pro:

- cíle,
- motivace,
- omezení,
- principy,
- požadavky,
- stakeholdery.

Nepoužívat pro:

- deployment,
- aplikace,
- technologie,
- implementační detaily.

---

## Business Layer

Používat pro:

- business služby,
- business procesy,
- business objekty,
- role,
- smlouvy.

---

## Application Layer

Používat pro:

- aplikace,
- aplikační služby,
- datové objekty,
- integrační vazby.

---

## Technology Layer

Používat pro:

- infrastrukturu,
- runtime,
- sítě,
- zařízení,
- hosting.

---

## Implementation & Migration Layer

Používat pro:

- projekty,
- work packages,
- transformace,
- roadmapy.

---

# Pravidla vztahů

## Používat správné relationship typy

Preferovat:

- serving
- realization
- assignment
- access
- composition
- aggregation
- influence
- triggering

Nepreferovat:

- association bez významu.

---

## Relationship musí mít význam

Každá vazba musí odpovídat:

- architektonické realitě,
- dependency,
- odpovědnosti,
- datovému toku,
- provoznímu vztahu,
- motivačnímu vztahu.

---

## Nepřehánět directional flow

Directional flow používat pouze pokud:

- existuje skutečný tok,
- pořadí je důležité,
- vzniká dependency.

---

# Pravidla view

## Motivation view

Musí obsahovat:

- stakeholdery,
- goals,
- requirements,
- constraints,
- principles.

Nemá obsahovat:

- deployment detaily,
- technologie,
- runtime infrastrukturu.

---

## Layered architecture view

Musí zobrazovat:

- vrstvy systému,
- dependency flow,
- separation of concerns.

Musí být:

- jednoduchý,
- čitelný,
- stabilní.

---

## Application cooperation view

Používat pro:

- integrace,
- dependency mezi aplikacemi,
- sdílená data,
- API vztahy.

---

## Technology deployment view

Používat pro:

- hosting,
- runtime,
- deployment,
- síťovou topologii.

---

## Traceability view

Používat pro:

- vazby mezi:
  - source evidence,
  - memory,
  - SPEC,
  - modely,
  - outputs,
  - implementací.

---

# Pravidla layoutu

## Směr toku

Preferovaný směr:

- zleva doprava,
- shora dolů.

---

## Crossing lines

Minimalizovat crossing lines.

Pokud je diagram nepřehledný:

- rozdělit view,
- použít grouping,
- vytvořit sub-view.

---

## Skupiny

Používat grouping pro:

- vrstvy,
- bounded contexty,
- domény,
- subsystémy.

---

## Barvy

Barvy odpovídají standardním ArchiMate vrstvám.

Nepoužívat:

- náhodné barvy,
- významové přebarvování bez pravidel.

---

# Traceability pravidla

## Každý významný element musí být dohledatelný

Element musí mít vazbu minimálně na:

- SPEC,
- source evidence,
- memory,
- ADR,
- nebo requirements.

---

## Model nesmí být izolovaný

Každý model musí být propojitelný s:

- wiki,
- memory,
- specifikací,
- implementací.

---

# Memory integration

## Memory není model

Persistent memory:

- není ArchiMate model,
- není SPEC,
- není dokumentace.

Memory slouží jako:

- stabilní reasoning layer,
- extraction layer,
- retrieval context.

---

## Model může být generován z memory

Memory může sloužit jako:

- vstup pro návrh elementů,
- vstup pro návrh relationships,
- vstup pro generování views.

Ale:

- SPEC zůstává autoritou.

---

# Open Exchange XML pravidla

## XML je exportní artefakt

Open Exchange XML:

- není editován ručně,
- je generován,
- musí být deterministický.

---

## Povinné části exportu

Export musí obsahovat:

- elements,
- relationships,
- views,
- organization.

---

## Stabilita ID

ID nesmí být regenerována při každém exportu.

Jinak:

- rozpadnou se views,
- rozpadnou se references,
- rozpadnou se diffy.

---

# Zakázané praktiky

## Nepoužívat ArchiMate jako wiki

Do modelu nepatří:

- dlouhé texty,
- provozní poznámky,
- brainstorming,
- task management.

---

## Nemodelovat všechno

Modelovat pouze:

- důležité části,
- stabilní části,
- architektonicky významné části.

---

## Nemíchat abstraction levels

V jednom view nemíchat:

- business strategii,
- deployment,
- runtime logy,
- detailní implementaci.

---

# Validace modelu

Model musí splňovat:

- unikátní IDs,
- validní relationships,
- validní references,
- validní views,
- konzistentní layering,
- traceability,
- konzistentní naming.

---

# Regenerace modelu

Model musí být:

- regenerovatelný,
- verzovatelný,
- diffovatelný,
- exportovatelný.

---

# Determinismus

Stejný vstup musí vést ke stejnému modelu.

Generování:

- nesmí být náhodné,
- nesmí měnit IDs,
- nesmí přeskupovat model bez důvodu.

---

# Separation of concerns

## SPEC

Definuje pravdu systému.

---

## MEMORY

Definuje dlouhodobý reasoning context.

---

## WIKI

Definuje interpretační a navigační vrstvu.

---

## ARCHIMATE MODEL

Definuje formální projekci architektury.

---

## OPEN EXCHANGE XML

Definuje exportní interoperabilní artefakt.
