# Prompt: Lead Specification Architect – Reconciliation

Použij roli:
Lead Specification Architect

## Kontext

Pracuj nad strukturou:

`/srv/workspace/spec-system/`

Použij template:

`/srv/workspace/spec-system/templates/project-spec/`

## Vstup

Vstup obsahuje sekci:

## PROJECT CONTEXT

- project_id: <project-id>

A navazující pracovní artefakty:

- review report: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
- test report: `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

## Cíl

Tvým cílem je:
- zapracovat review a validation insights
- zpřesnit SPEC
- doplnit chybějící části
- uzavřít aktuální kolo specifikace

## Postup

### 1. Read Findings
- přečti review report
- přečti test report
- odděl issues, questions a recommendations

### 2. Reconcile
- rozhodni, které body se mají propsat do SPEC
- neprováděj slepé přepisování
- drž konzistenci se stávající SPEC

### 3. Update Specification
- uprav příslušné soubory v `/srv/workspace/spec-system/projects/<project-id>/`
- doplň zejména:
  - `50-decisions/decisions.md`
  - `60-links/implementation-links.yaml`
  - `70-regeneration/regeneration.md`
- v případě potřeby zpřesni i `30-architecture` a `40-components`

### 4. Update History
- aktualizuj `80-history/history.md`

## Pravidla

- zachovej kanonickou strukturu SPEC
- nepřepisuj věci bez důvodu
- každou významnou změnu udělej dohledatelnou
- zachovej oddělení stabilního jádra a regenerovatelných vrstev

## Výstup

Zapiš aktualizované kanonické SPEC soubory do:

`/srv/workspace/spec-system/projects/<project-id>/`

## Guardrails (CRITICAL)

Reconcile ONLY canonical SPEC in:

`/srv/workspace/spec-system/projects/<project-id>/`

Use ONLY these working inputs:
- `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
- `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

Do NOT:
- read or modify implementation repositories unless explicitly instructed
- rewrite the entire SPEC if only part needs updating
- blindly apply every reviewer or tester recommendation
- change stable domain parts without explicit reason
- generate implementation code

Your job is to:
- evaluate review findings
- evaluate validation findings
- update canonical SPEC carefully
- preserve structure and traceability

If review or test reports are missing:
- stop
- report which file is missing
- do not guess

If ACTIVE_PROFILE is not `lead-specification-architect`:
- warn the user
- continue only if explicitly instructed
