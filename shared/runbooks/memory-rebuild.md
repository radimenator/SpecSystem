# Memory Rebuild Runbook

## Účel

Rebuild procesu aktualizuje persistentní memory vrstvu systému.

Proces:

- provádí typed extraction,

- aktualizuje dlouhodobou memory,

- negeneruje kanonickou SPEC,

- nemění ArchiMate model,

- neprodukuje formální dokumentaci.

---

## Vstupy

Zdrojové soubory:

- architecture.md

- scope.md

- decisions.md

- další source documents

Extraction prompty:

- `shared/prompts/extraction/`

---

## Výstupy

Persistent memory:

`shared/memory/`

Typy:

- architecture

- concepts

- constraints

- decisions

- entities

- open-questions

---

## Spuštění

Ruční rebuild:

`./shared/scripts/rebuild-memory.sh <project-id>`

Příklad:

`./shared/scripts/rebuild-memory.sh spec-system`

---

## Nightly rebuild

Automatický rebuild může běžet:

- přes launchd,

- v nočním režimu,

- nad všemi projekty.

---

## Důležité principy

Memory:

- není source of truth,

- není wiki,

- není summary dump.

Memory je:

- curated cognition layer,

- dlouhodobá pracovní paměť systému,

- stabilní kontext pro retrieval a reasoning.

---

## Validace

Memory nesmí:

- obsahovat chatbot odpovědi,

- obsahovat poděkování,

- používat konverzační styl,

- obsahovat hallucinations.

Memory musí:

- být stručná,

- být stabilní,

- být dohledatelná ke zdroji,

- obsahovat pouze dlouhodobě relevantní znalosti.

---

## Cíl systému

Cílem není:

„Shrnout dokument.“

Cílem je:

„Uchovat dlouhodobě důležité znalosti systému.“
