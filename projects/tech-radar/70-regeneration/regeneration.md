# Regenerace

## Princip
Systém je regenerovatelný ze specifikace.

## Vstupy pro regeneraci
- specifikace
- kontext
- data

## Regenerovatelné části
- backend
- frontend
- HTTP API kontrakty nad stabilním storage modelem
- Roam export formát při zachování backend ownership
- testy

## Neregenerovatelné části
- data
- stabilní SQLite datový model
- externí integrace

## Co musí být explicitní pro regeneraci
- kanonická škála a význam `score`
- hard-duplicate pravidlo podle URL
- ownership Roam exportu
- minimální output contract OpenClaw analýzy
- minimální capability backend API pro articles a sources
- minimální schema tabulek `sources`, `articles`, `article_state`

## Co zůstává heuristika
- scoring algorithm
- promptování a volba modelu pro OpenClaw analýzu
- soft-duplicate threshold a podobnostní algoritmus
- konkrétní UI kompozice v rámci definovaných obrazovek
- konkrétní endpoint path suffixes a request/response shape pod zachovanou capability hranicí

## Pravidla
- malé komponenty
- jasné hranice
- izolace změn
- neměnit stabilní storage contract při regeneraci UI nebo API bez explicitního rozhodnutí
- neodvozovat behavior z existující implementace, pokud je v konfliktu se SPEC

## Triggery regenerace
- změna specifikace
- pokles metrik
- refactoring