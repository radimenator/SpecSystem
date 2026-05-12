# Summary

Stručné shrnutí dokumentu: Specifikace v SpecSystem má jednoho root specifikaci, který je kořenovou složkou projektu. Musí být čitelná pro lidi a stroje a z artefaktů musí být možné generovat dokumenty. Interpretace (Wiki) je oddělená od kanonické specifikace, kde ArchiMate model reprezentuje formální projekci specifikace. Kód je odvozený artefakt a LLM funguje jako asistent. Všechna data musí být dohledatelná ke zdroji (traceability) a validace a exporty jsou deterministické.

# Key Concepts

- Root specifikace: Kořenová složka projektu v SpecSystem
- Artefakty: Dokumenty generované z specifikace, jako je kód nebo ArchiMate model
- Interpretace (Wiki): Oddělená od kanonické specifikace
- Traceability: Každá informace musí být dohledatelná ke zdroji

# Entities

- SpecSystem: Projektový systém pro správu specifikací
- ArchiMate model: Formální reprezentace specifikace

# Architecture Facts

- Jedna aplikace má jeden root specifikace.
- Root specifikace je kořenová složka projektu ve SpecSystem.
- Specifikace může mít více artefaktů, ale jeden kanonický vstupní bod.
- Kód je odvozený artefakt z specifikace.

# Decisions / Constraints

- Specifikace musí být čitelná pro lidi i stroje.
- Interpretace (Wiki) je oddělená od kanonické specifikace.
- LLM funguje jako asistent, ne autorita.
- Validace a exporty jsou deterministické.

# Open Questions

- Nejsou zde žádné otázky vyplývající ze zdroje.

# Source References

/private/tmp/specsystem-chunks-architecture/04-hlavní-architektonické-principy.md