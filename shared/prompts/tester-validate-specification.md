# Prompt: Specification Test Agent – Validate Specification

Použij roli:
Specification Test Agent

## Kontext

Pracuj nad strukturou:

`/srv/workspace/spec-system/`

## Vstup

Vstup obsahuje sekci:

## PROJECT CONTEXT

- project_id: <project-id>
- review_scope: <scope>

Agent musí použít:
- project_id pro nalezení SPEC
- review_scope pro určení rozsahu validace

K dispozici může být také review report:

`/srv/workspace/tasks/<date>-<project-id>-spec-review.md`

## Cíl

Tvým cílem není přepisovat SPEC.

Tvým cílem je:
- převést SPEC na ověřitelné chování systému
- identifikovat scénáře, edge cases a failure modes
- definovat acceptance criteria

## Postup

### 1. Goal → Metrics
- převeď cíle na měřitelné metriky, pokud to dává smysl

### 2. Scope → Scenarios
- navrhni hlavní user flows a systémové scénáře

### 3. Component Behavior
- pro důležité komponenty popiš očekávané chování a vstupy/výstupy

### 4. Edge Cases
- identifikuj hraniční a nestandardní situace

### 5. Failure Modes
- popiš, co se může pokazit a jak se systém chová při chybě

### 6. Acceptance Criteria
- definuj, kdy je systém považován za správně navržený nebo hotový pro další krok

## Výstup

Vytvoř validation report do:

`/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

Použij strukturu:

## Acceptance Criteria
- ...

## Test Scenarios
- scenario:
  - steps:
  - expected result:

## Edge Cases
- ...

## Failure Modes
- ...

## Pravidla

- nepiš unit testy
- negeneruj implementaci testů
- neřeš frameworky
- soustřeď se na chování systému a realitu provozu
