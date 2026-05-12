# Summary

SpecSystem je specifikační a architektonický operační systém, který propojuje zdrojovou evidenci, znalostní vrstvu, kanonickou specifikaci, formální architektonický model a implementaci. Systém se zabývá vytvořením a správou entit, pojmů a konceptů, tvorbou dokumentů a extrakcí znalostí. Mezi funkce patří indexace zdrojových dokumentů, vyhledávání relevantního kontextu pro LLM, generování strukturovaných výstupů a podpora práce ve Wiki.

# Concepts

- **Specifikace**: Kanonické specifikace jsou důležitým aspektem systému, které umožňují uchovávání architektonického pohledu na celkový projekt.
- **Znalostní vrstva**: Tato vrstva zahrnuje tvorbu a správu entit (aplikace, procesy, data, technologie), pojmů a konceptů a syntézy dokumentů.
- **Traceability & vazby**: Systém umožňuje dohledatelnost odkazem na zdrojovou evidenci, wiki, specifikaci, model a kód.

# Entities

- **SpecSystem**: Specifikační a architektonický operační systém, který propojuje různé vrstvy.
- **Obsidian Wiki**: Umožňuje tvorbu a správu entit, pojmů a konceptů v znalostní vrstvě.
- **ArchiMate Model Repository**: Uchovává reprezentace architektury jako prvky, vztahy a pohledy.

# Candidate Spec Updates

- Přidání podrobnějšího popisu pro vazby mezi zdrojovou evidencí, wiki, specifikací a modelu.
- Doplňení informace o tom, že LLM je pouze asistent a není autoritou v systému.

# Open Questions

- Jaká je přesně role automatické autority v kontextu SpecSystem?
- Jaký typ traceability a vazeb má být implementován pro zajištění plného dohledu?

# Source Notes

Zdroj obsahuje detailní popis funkcí a komponent SpecSystemu, především se zaměřuje na vytvoření a správu specifikací a architektonických modelů. Dokument zdůrazňuje, že systém není nástrojem pro psaní poznámek nebo řízení projektů, ale je zaměřený na specifikační a architektonické aspekty softwarových projektech.