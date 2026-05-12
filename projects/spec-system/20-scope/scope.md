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
