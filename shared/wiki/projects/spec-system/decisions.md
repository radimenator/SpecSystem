# Summary

Zdroj obsahuje několik rozhodnutí (ADRs) týkajících se struktury a fungování systému SpecSystem, zahrnující koncepty jako ukládání specifikací mimo projektovou složku, jednotlivých root specifikace pro každý projekt, oddělení kanonického uložiště specifikací a evidence zdrojů. Dodržuje se princip traceability přes vrstvy a povinnost mít plnou kontrolu nad daty i možnost práce offline.

# Concepts

- **Specifikace**: Primární znalostní zdroj, který je v rámci SpecSystem ukládán odděleně.
- **Evidence**: Dokumenty a modely jako potenciální neaktuální nebo neúplné zdroje informací.
- **Traceability**: Potřeba sledovatelnosti, aby se mohlo ověřit správnost specifikace.

# Entities

- **SpecSystem**: Oddělený repozitář pro uložení kanonických specifikací.
- **Source Evidence Repository**: Repositář pro uchování zdrojové evidence, která není považována za pravdu.
- **Outputs/ vrstva**: Vrstva generující dokumenty odvozené ze SpecSystemu a ArchiMate modelu.

# Candidate Spec Updates

- Přidání detailů o význame kanonických specifikací SpecSystemu při sestavování výstupních dokumentů.
- Detailnější definice pro traceability, zahrnující konkrétní mechanismy pro sledovatelnost.

# Trace

- **Obsidian Wiki**: Umístěno ve `shared/wiki/` pro společné používání napříč projekty.
- **ArchiMate model**: Použit při generování dokumentů jako architektonických reportů.
- **LLM role**: Asistent, který může navrhovat změny a extrahovat data, ale nemůže měnit kanonickou specifikaci bez potvrzení.

# Traceability

- Každá specifikace, rozhodnutí, implementace a entita v wiki má traceable připojení k zdrojovým dokumentům nebo jinému prvkovi systému.

# Summary Notes
Rozhodnutí (ADRs) podtrhují důležitost oddělení mezi specifikacemi, evidence a výstupy. SpecSystem funguje jako centrální zdroj pravdy pro aplikace, zatímco jiné vrstvy slouží ke komunikaci nebo pro práci s informacemi před jejich použitím v specifikacích. Obsidian Wiki je nástrojem pro sdílení znalostí mezi projekty podle určitého strukturálního schématu, zajišťující plnou kontrolu uživatelů nad svými daty i při offline práci. LLM je poskytovatelem asistencí a návrhů bez omezení autority v kanonických specifikacích.

# ADRs
- [ADR-010: Traceability is Mandatory Across Layers](https://example.com/adr/010)
- [ADR-012: Obsidian Wiki as Cross-project Shared Knowledge Base](https://example.com/adr/012)