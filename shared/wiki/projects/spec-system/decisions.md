# Summary

Zdroj obsahuje sérii rozhodnutí (ADR) týkajících se architektury a zásad pro projekt SpecSystem, které ohraničují, jak specifikace a modely jsou uchovány a používány. Tyto rozhodnutí pokrývají aspekty jako uložení specifikací mimo kódování, strukturu projektů, role Roam a Obsidian Wiki v systému, validnost architektonických modelů, publikace dokumentů z specifikací, interpretaci zdrojových dokumentů, roli LLM jako asistenta, traceability napříč vrstvami a architekturu s lokálním první přístupem.

# Concepts

- ADR: Architecture Decision Record - protokol kdy se rozhodnutí v projektu o struktuře systému probíhají.
- Specifikace: primární znalostní zdroj pro porozumění a implementaci systému.
- Traceability: schopnost sledovat a ověřit průběh změn v různých vrstvách systému od počátku do aktuálního stavu.

# Entities

- SpecSystem: repozitář pro uložení specifikací projektů.
- ArchiMate Model Repository: repozitář pro architektonické modely vyplývající z specifikace.
- Source Evidence Repository: umístění pro dokumenty, které jsou pouze důkazy a nezdroje pravdy v systému.
- Obsidian Wiki: společná báze znalostí pro projekty.

# Outputs

- Dokumentace projektu generovaná deterministicky z SpecSystem a ArchiMate modelu.
- Reporty o architektuře projektu generovány stejným procesem jako jiné dokumenty.

# Traceability
Každý prvek v systému musí být traceabilní do počátku, může to zahrnovat následující entity:
- Zdrojový dokument.
- Wiki entita.
- Rozhodnutí (ADR).
- Implementace.

# Local-first architektura
MacBook funguje jako primární pracovní prostředí, kde LLM běží místně pro minimalizaci latence a maximální kontrolu nad daty. VPS (Virtual Private Server) je použito pro sdílení repozitářů, orchestraci a agentní úlohy.

# Summary of ADRs
10 rozhodnutí o struktuře systému, včetně umístění specifikací mimo kódy, role wiki jako společného zdroje znalostí pro projekty a povinnosti traceability mezi vrstvami. Naposledy přijatým rozhodnutím se řeší architektura s lokálním první přístupem a doplňujícím VPS.

# Outputs
- Dokumentace generovaná z SpecSystem.
- Architektonické reporty vyplývající z modelu.
- Společná wiki napříč projekty umístěna v `shared/wiki/`.

# Traceability
Každý prvek se může traceovat do počátku, zahrnuje to zdrojové dokumenty, rozhodnutí a implementace. To umožňuje kontrolní mechanismus pro ověření správnosti systému.

# ADR-012
Obsidian Wiki je umístěna v `shared/wiki/`, projektové znalosti jsou členěny podle ID projektů, což zajišťuje globální a jednotný přístup k informacím napříč projekty.