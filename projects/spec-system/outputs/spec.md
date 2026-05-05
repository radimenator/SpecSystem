---
title: "Specifikace projektu: spec-system"
date: "2026-04-10"
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

drivers:
  - potřeba evidovat specifikace napříč projekty
  - potřeba verzovat změny specifikací
  - potřeba udržet původní záměr řešení
  - potřeba porozumět aplikaci jako celku
  - potřeba regenerovat kód ze specifikací

assessment:
  - specifikace dnes existují roztříštěně
  - historie změn specifikací není dostatečně řízená
  - není jasné, která specifikace je platná
  - není snadné dohledat vazbu mezi specifikací a výsledným kódem
  - globální porozumění aplikaci se ztrácí v množství generovaného kódu

goals:
  - mít jednoznačně evidované specifikace projektů
  - mít historii a verze specifikací
  - mít možnost pochopit aplikaci na úrovni celku
  - mít možnost použít specifikaci jako vstup pro regeneraci kódu
  - oddělit pracovní poznámky od kanonické specifikace

constraints:
  - systém musí být použitelný jedním člověkem bez vysoké režie
  - systém musí fungovat v kombinaci s existujícím osobním toolstackem
  - systém nesmí být složitější než hodnota, kterou přinese
  - systém musí podporovat jak lidské čtení, tak strojové zpracování

principles:
  - uložiště specifikací je systém
  - specifikace jsou primární znalostní artefakty
  - poznámky nejsou totéž co kanonická specifikace
  - každá specifikace musí být dohledatelná a srozumitelná
  - každá významná změna specifikace musí být rekonstruovatelná
  - specifikace má podporovat porozumění i regeneraci

requirements:
  - evidovat specifikace po projektech
  - rozlišovat pracovní poznámky a platnou specifikaci
  - podporovat historii a verze
  - umožnit vazbu specifikace na kód a architekturu
  - umožnit vyhledání aktuální i předchozí verze specifikace
  - podporovat globální pohled na aplikaci

```


# Scope

## In scope
- evidence kanonických specifikací projektů
- verzování specifikací
- vazba specifikace na projekt v Roamu
- vazba specifikace na implementaci v ~/Projects
- uchování architektonického pohledu na celek
- podpora regenerace implementace ze specifikace
- generování čitelného dokumentu ze specifikačních artefaktů

## Out of scope
- pracovní poznámky
- backlog a task management
- samotná správa zdrojového kódu
- běhové řízení agentů


# Architektura systému

## Účel
Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

## Hlavní oddělení
- Roam Research: projektový kontext, pracovní poznámky, aktivity
- SpecSystem: kanonická specifikace
- ~/Projects: implementace a kód

## Hlavní architektonické principy
- jedna aplikace má jeden root specifikace
- root specifikace je kořenová složka projektu ve SpecSystem
- specifikace může mít více artefaktů, ale jeden kanonický vstupní bod
- specifikace musí být čitelná člověkem i strojem
- z artefaktů specifikace musí být možné generovat dokument

## Hlavní vztahy
- Roam projekt odkazuje na root specifikace
- root specifikace odkazuje na implementaci v ~/Projects
- architektura vysvětluje globální pohled na aplikaci
- komponenty popisují rozpad na regenerovatelné části


# Komponenty

```yaml
components:
  - id: spec_root
    name: Root specifikace
    purpose: Vstupní bod pro pochopení projektu

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
    purpose: Uchování důvodů zásadních návrhových voleb

  - id: regeneration_description
    name: Popis regenerace
    purpose: Vymezení toho, jak lze systém znovu vytvořit

  - id: publication_layer
    name: Publikační vrstva
    purpose: Generování čitelného dokumentu ze specifikace
```


# Rozhodnutí

## ADR-001: Specifikace jsou uloženy mimo ~/Projects
### Stav
Přijato

### Důvod
Kód je nahraditelný artefakt. Specifikace je primární znalostní zdroj.

### Dopad
Vzniká oddělený repozitář ~/SpecSystem.

---

## ADR-002: Jedna aplikace má jeden root specifikace
### Stav
Přijato

### Důvod
Je potřeba mít jednoznačný vstupní bod pro porozumění systému.

### Dopad
Každý projekt má jednu kořenovou složku ve SpecSystem.

---

## ADR-003: Roam není kanonické uložiště specifikací
### Stav
Přijato

### Důvod
Roam je vhodný pro myšlení a vazby, ale ne jako kanonický, verzovaný a strojově čitelný zdroj pravdy.

### Dopad
Roam drží projektový kontext. SpecSystem drží platnou specifikaci.

---

## ADR-004: Specifikace musí jít publikovat do čitelného dokumentu
### Stav
Přijato

### Důvod
Kanonický zdroj není totéž co čitelný dokument pro práci a revizi.

### Dopad
Ve specifikaci existuje publikační vrstva a build proces.


# Vazby

```yaml
links:
  roam:
    project_page: "PO/Uložiště specifikací"

  local_paths:
    spec_root: "~/SpecSystem/projects/spec-system"
    projects_root: "~/Projects"

  related_projects: []

  related_tools:
    - Roam Research
    - VS Code
    - iTerm2
    - Git
    - Pandoc
    - ArchiMate Tool

```


# Regenerace

## Cíl
Zachovat takové informace, aby bylo možné systém nebo jeho části znovu vytvořit ze specifikace.

## Nezbytné vstupy
- motivace
- scope
- architektonický pohled
- katalog komponent
- log rozhodnutí
- vazby na implementaci

## Regenerovatelné části
- textová dokumentace
- struktura specifikace projektu
- architektonické popisy
- vstupy pro AI generaci implementace

## Neregenerovatelné části bez doplnění
- nezdokumentovaná implicitní rozhodnutí
- nezachycený provozní kontext
- neuložené experimentální prompty


# Historie

## v0.1
### Změna
Vytvořena první kanonická specifikace systému Uložiště specifikací.

### Důvod
Bootstrap systému pro evidenci a správu specifikací.

### Dopad
Vznikl základ pro odvození šablony všech dalších projektových specifikací.

