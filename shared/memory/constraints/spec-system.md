```markdown
- **Technická omezení**
  - Jedna aplikace má jeden root specifikace.
  - Root specifikace je kořenová složka projektu ve SpecSystem.
  - Specifikace může mít více artefaktů, ale jeden kanonický vstupní bod.
  - Specifikace musí být čitelná člověkem i strojem.

- **Procesní omezení**
  - Zdrojové dokumenty jsou evidence, nikoliv automatická pravda.
  - Interpretace (Wiki) je oddělená od kanonické specifikace.
  - LLM je asistent, ne autorita.
  - Validace a exporty jsou deterministické.

- **Validační pravidla**
  - Každá informace musí být dohledatelná ke zdroji (traceability).
  - Specifikace může být změněna pouze po potvrzení.
  - Model může být změněn pouze po validaci.

- **Bezpečnostní omezení**
  - Citlivá data zůstávají lokálně na MacBooku, nikoliv v VPS prostředí.

- **Deterministic Rules**
  - Generování dokumentů je deterministické (bez LLM v kritické části).
```
