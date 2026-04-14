# Rozhodnutí

---

## ADR-001: Score je kanonicky normalizované číslo 0.0 až 1.0

### Stav
Schváleno

### Kontext
SPEC potřebuje jednotný kontrakt pro score napříč analýzou, ukládáním, filtrováním a UI. Bez toho vzniká prostor pro nekonzistentní regeneraci.

### Rozhodnutí
Kanonická škála score je `0.0..1.0`, kde `1.0` znamená nejvyšší relevanci pro osobní projekty a bastlení. SPEC fixuje rozsah a význam score, nikoli konkrétní výpočetní algoritmus.

### Důsledky
Backend, UI i worker musí používat stejný datový typ a interpretaci. Implementace může měnit heuristiku výpočtu, pokud zachová tento output contract.

---

## ADR-002: URL je hard-duplicate pravidlo, podobnost je pouze soft-duplicate heuristika

### Stav
Schváleno

### Kontext
Deduplikace byla popsána příliš vágně a hrozilo, že různé implementace budou zacházet s podobností titulku nebo obsahu odlišně.

### Rozhodnutí
Shoda URL je kanonický hard duplicate. Podobnost titulku nebo zdrojového obsahu je pouze podpůrná soft-duplicate heuristika a nesmí přebít hard-duplicate pravidlo.

### Důsledky
Regenerované implementace musí držet stabilní chování v případě shodné URL. Soft deduplikace může používat různé prahy nebo algoritmy, ale jen jako heuristiku.

---

## ADR-003: Roam export je backend-owned contract

### Stav
Schváleno

### Kontext
Bylo potřeba odstranit nejasnost, zda je Roam export generován v UI nebo backendu.

### Rozhodnutí
Roam export je vlastněn backendem. Backend vrací textový blok připravený ke zkopírování a UI jej pouze vyžádá a nabídne do clipboardu.

### Důsledky
Formát exportu zůstává oddělený od UI implementace. Regenerace frontendu nesmí přesouvat ownership exportní šablony do klienta.

---

## ADR-004: OpenClaw analysis má stabilní output contract a heuristický interní postup

### Stav
Schváleno

### Kontext
SPEC vyžaduje OpenClaw analýzu, ale neobsahuje přesný prompt ani scoring postup. Bez rozhodnutí není jasné, co musí být stabilní a co může být implementační detail.

### Rozhodnutí
Stabilní je pouze output contract analýzy: `summary_cz`, `why_matters_cz`, `section`, `score`. Prompting, model selection a scoring heuristika nejsou fixované SPEC a mohou se měnit.

### Důsledky
Systém zůstává regenerovatelný i při změně interní analytické implementace. Regenerace musí zachovat datový výstup, nikoli konkrétní prompt.
