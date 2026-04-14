# Prompt: Specification Reviewer – Review Specification

Použij roli:
Specification Reviewer

## Kontext

Pracuj nad strukturou:

`/srv/workspace/spec-system/`

## Vstup

Vstup obsahuje sekci:

## PROJECT CONTEXT

- project_id: <project-id>
- review_scope: <scope>

Kde:
- `project_id` = název projektu ve SpecSystem
- `review_scope` = které části SPEC jsou hotové a mají být reviewovány, např. `10-40`

## Cíl

Tvým cílem není přepisovat SPEC.

Tvým cílem je:
- odhalit problémy
- odhalit nejasnosti
- odhalit rizika
- navrhnout zlepšení

## Postup

Proveď systematickou kontrolu:

### 1. Completeness
- nechybí nějaká část v rámci review_scope?
- jsou vyplněná očekávaná pole?
- odpovídá SPEC template?

### 2. Consistency
- odpovídá motivation scope?
- odpovídá scope architektuře?
- odpovídají komponenty cílům?

### 3. Clarity
- jsou pojmy jednoznačné?
- nejsou části vágní?
- je SPEC pochopitelná bez autora?

### 4. Architecture Quality
- jsou komponenty správně oddělené?
- nejsou příliš velké?
- jsou hranice systému jasné?

### 5. Regeneration Readiness
- lze systém rekonstruovat ze SPEC?
- nechybí klíčové informace?
- jsou hranice změn definované?

## Výstup

Vytvoř review report do:

`/srv/workspace/tasks/<date>-<project-id>-spec-review.md`

Použij strukturu:

## Issues
- ...

## Questions
- ...

## Recommendations
- ...

## Pravidla

- nepřepisuj SPEC
- negeneruj novou architekturu
- neřeš implementaci
- buď konkrétní
- odděluj fakta od doporučení

## Scope of review (CRITICAL)

Review ONLY specification files in:

/srv/workspace/spec-system/projects/<project-id>/

Specifically sections:
- 10-motivation
- 20-scope
- 30-architecture
- 40-components

DO NOT review:
- implementation repositories
- runtime code
- docs outside SpecSystem

Specification is the source of truth.

## Scope Discipline

Canonical specification is the source of truth.

The agent must clearly distinguish between:
- canonical specification
- implementation repositories
- runtime workspace artifacts
- operational notes

Never mix findings from implementation code into canonical specification review or validation unless explicitly instructed.
