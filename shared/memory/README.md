# Memory Policy

## Účel

Memory je dlouhodobá pracovní paměť SpecSystemu.

Není to shrnutí dokumentů.
Není to wiki.
Není to source of truth.

Memory uchovává stabilní znalosti, které má LLM používat při další práci.

## Co si má memory pamatovat

Memory má uchovávat:

- architektonické invarianty
- source-of-truth pravidla
- hranice odpovědností
- vrstvy systému
- dependency flow
- rozhodnutí a jejich důvody
- omezení a zákazy
- stabilní entity
- klíčové pojmy
- otevřené otázky

## Co se nemá ukládat

Memory nemá ukládat:

- celé dokumenty
- dlouhé parafráze
- jednorázové detaily
- provozní šum
- dočasné experimenty
- chatbot odpovědi
- obecná doporučení bez vazby na SPEC

## Kritérium důležitosti

Do memory patří informace, která splňuje alespoň jedno:

- ovlivňuje budoucí návrhové rozhodnutí
- definuje pravidlo systému
- vysvětluje architekturu
- omezuje chování LLM/agenta
- propojuje více vrstev systému
- pomáhá rekonstruovat záměr systému

## Styl

Memory má být:

- stručná
- přesná
- stabilní
- atomická
- dohledatelná ke zdroji
- bez konverzačního stylu

## Zlaté pravidlo

Memory neodpovídá na otázku:
„Co bylo v dokumentu?“

Memory odpovídá na otázku:
„Co si má systém pamatovat pro budoucí práci?“
