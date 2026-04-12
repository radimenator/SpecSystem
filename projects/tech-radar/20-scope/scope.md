# Scope

## Účel
Tech-radar je osobní systém pro sběr a kuraci technologických článků, který má z novinek vytahovat podněty relevantní pro vlastní projekty a hi-tech bastlení.

## In scope
- Sběr článků z evidovaných zdrojů, primárně přes RSS.
- Zpracování každého RSS itemu jako samostatného článku.
- Cronem spouštěná pipeline pro ingestion, analýzu, scoring a deduplikaci.
- Ukládání zdrojů, článků a uživatelského stavu do SQLite.
- Analýza článků pomocí OpenClaw agentů.
- Evidence polí title, url, source, section, summary_cz, why_matters_cz, published, fetched_at a score.
- Section jako doménový pojem pro kategorie, např. AI, infrastruktura, tooling, Apple/macOS, ostatní.
- Filtrování článků podle section, zdroje a stavu přečteno/uloženo.
- Uživatelské akce otevřít článek, označit jako přečtený, uložit/bookmark a exportovat do Roam.
- Samostatná stránka pro správu zdrojů včetně include/exclude keywords a enable/disable stavu.
- Roam export jako textový blok připravený ke zkopírování do clipboardu.
- Retence dat za posledních 30 dní.

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
