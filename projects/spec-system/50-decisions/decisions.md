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