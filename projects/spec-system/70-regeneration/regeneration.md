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
