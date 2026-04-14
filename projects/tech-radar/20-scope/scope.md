# Scope

## Účel
Tech-radar je osobní systém pro sběr a kuraci technologických článků, který má z novinek vytahovat podněty relevantní pro vlastní projekty a hi-tech bastlení.

## In scope
- Sběr článků z evidovaných zdrojů, primárně přes RSS.
- Zpracování každého RSS itemu jako samostatného článku.
- Cronem spouštěná pipeline pro ingestion, analýzu, scoring a deduplikaci.
- Deduplikace používá URL jako hard-duplicate pravidlo; podobnost titulku nebo zdrojového obsahu může být použita jen jako soft-duplicate heuristika pro rozhodnutí o zahazování nebo aktualizaci kandidáta.
- Ukládání zdrojů, článků a uživatelského stavu do SQLite.
- Analýza článků pomocí OpenClaw agentů.
- Evidence polí title, url, source, section, summary_cz, why_matters_cz, published, fetched_at a score.
- Score je kanonicky normalizované číslo v rozsahu 0.0 až 1.0, kde 1.0 znamená nejvyšší relevanci pro osobní projekty a bastlení.
- Section jako doménový pojem pro kategorie, např. AI, infrastruktura, tooling, Apple/macOS, ostatní.
- Filtrování článků podle section, zdroje a stavu přečteno/uloženo.
- Uživatelské akce otevřít článek, označit jako přečtený, uložit/bookmark a exportovat do Roam.
- Samostatná stránka pro správu zdrojů včetně create, update, include/exclude keywords a enable/disable stavu.
- Roam export jako backendem sestavený textový blok vracený přes interní API a připravený ke zkopírování do clipboardu v UI.
- Retence dat za posledních 30 dní.

## Canonical contracts in scope
- Score je kanonicky normalizované číslo `0.0..1.0`; SPEC nedefinuje přesný výpočet score, pouze povinný rozsah a interpretační význam.
- Section je kanonická textová kategorie; minimální očekávaná taxonomie pro MVP je `AI`, `infrastruktura`, `tooling`, `Apple/macOS`, `ostatní`.
- URL je kanonický identifikátor hard-duplicate pravidla.
- Soft-duplicate kontrola je heuristika a nesmí přebít hard-duplicate pravidlo podle URL.
- Include/exclude keywords jsou lokální pravidla zdroje aplikovaná nad titulkem a dostupným feed summary/description textem.
- Roam export vrací backend textový blok sestavený z minimálně: `title`, `url`, `source`, `section`, `score`, `published`, `summary_cz`, `why_matters_cz`.

## Out of scope
- Veřejný informační web nebo sdílený systém pro více uživatelů.
- Přihlašování a správa identit.
- Automatické vytváření samostatných project ideas.
- Ukládání plného textu článků jako primárního artefaktu.
- Regenerace business logiky pipeline nebo databázového modelu.
- Přepočet a reanalýza starých článků.

## Non-goals
- Maximální pokrytí všech technologických novinek.
- Tlak na uživatele, aby konal podle doporučení systému.
- Provoz bez výpadků AI části.
- Nahrazení osobního úsudku při výběru inspirací.
