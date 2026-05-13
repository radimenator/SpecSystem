# Historie

## v0.1
### Změna
Vytvořena první kanonická specifikace systému Uložiště specifikací.

### Důvod
Bootstrap systému pro evidenci a správu specifikací.

### Dopad
Vznikl základ pro odvození šablony všech dalších projektových specifikací.
***

## v0.2
### Změna
Transformace systému z „uložiště specifikací“ na vrstvený systém:
- evidence → znalosti → specifikace → model → výstupy

### Důvod
Původní koncept neřešil:
- práci se zdrojovými dokumenty
- interpretaci znalostí
- formální model architektury

### Dopad
Vznikl SpecSystem jako:
knowledge + specification + architecture operating system

## v0.3

### Změna

Zavedena Persistent Memory Layer jako samostatná vrstva mezi zdrojovou evidencí, LLM extraction a Wiki.

Memory je rozdělena do typovaných oblastí:

- architecture
- concepts
- constraints
- decisions
- entities
- open-questions

### Důvod

Původní wiki-first přístup vedl k riziku, že se Wiki stane pouze generovaným summary dumpem.

Bylo potřeba oddělit:

- zdrojové dokumenty
- kanonickou specifikaci
- interpretační Wiki
- dlouhodobou pracovní paměť systému

### Dopad

Vznikla vrstva `shared/memory/`.

Vznikly extraction prompty v `shared/prompts/extraction/`.

SpecSystem se posunul od modelu:

Source → Wiki

k modelu:

Source → Typed Extraction → Persistent Memory → Wiki / Agents / Retrieval

Memory se stává curated cognition layer pro dlouhodobý reasoning LLM a agentů.