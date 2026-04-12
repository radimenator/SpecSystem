# Architektura

## Účel architektury
Architektura Tech-radaru odděluje stabilní doménovou vrstvu od regenerovatelných částí systému. Stabilní zůstává databázový model a pipeline pro ingestion, analýzu a deduplikaci. Regenerovatelné jsou UI, API kontrakty a Roam export formát. Návrh používá malé komponenty s jasnými hranicemi, aby byl systém pochopitelný bez čtení kódu a dobře použitelný pro AI-agenty.

## Architektonické vrstvy
- Motivation
  - osobní radar pro technologické novinky relevantní pro vlastní projekty a bastlení
- Business
  - správa zdrojů
  - sběr článků
  - analýza článků
  - deduplikace a scoring
  - export do Roam
- Application
  - worker pro ingestion pipeline
  - analytické a deduplikační služby
  - FastAPI backend
  - Next.js UI
- Technology
  - RSS a vybrané externí webové zdroje
  - OpenClaw agenti
  - SQLite
  - cron na VPS
  - privátní přístup přes Tailscale/VPN

## Hlavní komponenty
- **source management**
  - správa evidovaných zdrojů, jejich URL, include/exclude keywords, enable/disable stavu a priority
- **ingestion pipeline**
  - cronem spouštěný worker, který načítá aktivní zdroje a vytváří kandidátní články z RSS itemů
- **OpenClaw analysis**
  - analýza článků pomocí agentů, generování summary_cz, why_matters_cz, section a score
- **deduplication/scoring**
  - kontrola duplicit podle URL a podobnosti, potvrzení nebo odmítnutí kandidátů pro uložení
- **SQLite storage**
  - perzistence zdrojů, článků a uživatelského stavu jako stabilní doménové vrstvy
- **FastAPI backend**
  - interní aplikační rozhraní pro čtení článků, správu zdrojů a uživatelské akce
- **Next.js UI**
  - dvě obrazovky: přehled článků a správa zdrojů
- **Roam export**
  - generování textového bloku pro clipboard podle stabilní exportní šablony

## Hlavní vztahy
- Source management udržuje seznam aktivních zdrojů a jejich filtračních pravidel ve SQLite.
- Ingestion pipeline čte aktivní zdroje a vytváří vstupní sadu článků ke zpracování.
- OpenClaw analysis zpracuje kandidátní články a vrací strukturované výstupy pro uložení.
- Deduplication/scoring rozhoduje, zda článek uložit, aktualizovat nebo zahodit jako duplicitní.
- SQLite storage poskytuje stabilní perzistenci pro backend i worker.
- FastAPI backend zpřístupňuje články, zdroje a uživatelské akce pro UI.
- Next.js UI zobrazuje články, filtry a správu zdrojů nad API kontrakty backendu.
- Roam export používá uložená data článku a vytváří kopírovatelný textový blok v UI.

## ArchiMate model
- nástroj: zatím neurčeno
- soubor: zatím neurčeno
- hlavní pohledy:
  - business flow zdroj → ingestion → analysis → deduplication/scoring → storage → UI → Roam export
  - application cooperation mezi workerem, backendem, OpenClaw a SQLite
  - deployment view pro VPS, cron, FastAPI, Next.js a privátní VPN přístup
