# Architektura systému

## Účel
Uložiště specifikací slouží jako kanonický zdroj pravdy pro specifikace projektů.

## Hlavní oddělení
- Roam Research: projektový kontext, pracovní poznámky, aktivity
- SpecSystem: kanonická specifikace
- ~/Projects: implementace a kód

## Hlavní architektonické principy
- jedna aplikace má jeden root specifikace
- root specifikace je kořenová složka projektu ve SpecSystem
- specifikace může mít více artefaktů, ale jeden kanonický vstupní bod
- specifikace musí být čitelná člověkem i strojem
- z artefaktů specifikace musí být možné generovat dokument

## Hlavní vztahy
- Roam projekt odkazuje na root specifikace
- root specifikace odkazuje na implementaci v ~/Projects
- architektura vysvětluje globální pohled na aplikaci
- komponenty popisují rozpad na regenerovatelné části

# SpecSystem + OpenClaw Operating Structure

## Lokální a vzdálené umístění

- MacBook: `/Users/radimpokorny/SpecSystem/`
- VPS: `/srv/workspace/spec-system/`

## Obecné profily agentů (OpenClaw git)

- `/srv/workspace/agent_profiles/`

## Aktivní profil agenta (OpenClaw git)

- `/srv/workspace/ACTIVE_PROFILE`

## Úkoly pro agenty (OpenClaw git)

- `/srv/workspace/tasks`

## Repozitáře projektů (OpenClaw git)

- `/srv/workspace/repos/`

## Předpřipravené prompty pro fáze práce se SPEC (SpecSystem git)

- `/srv/workspace/spec-system/shared/prompts/`

## Specifikace jednotlivých projektů (SpecSystem git)

- `/srv/workspace/spec-system/projects/`

## Šablona specifikace projektu (SpecSystem git)

- `/srv/workspace/spec-system/templates/project-spec/`

----
## Závislosti souborů pro SpecSystem

### Lead Specification Architect
- Co agent umí: `/srv/workspace/agent_profiles/lead-specification-architect.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-define-specification.md`
- Vstup: ROAM specifikace projektu
- Šablona specifikace: `/srv/workspace/spec-system/templates/project-spec/`
- Výstup: `/srv/workspace/spec-system/projects/<project-id>/`, soubory `00` až `80`

### Specification Reviewer
- Co agent umí: `/srv/workspace/agent_profiles/specification-reviewer.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/reviewer-review-specification.md`
- Vstup: `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`
- Výstup: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`

### Specification Test Agent
- Co agent umí: `/srv/workspace/agent_profiles/specification-test-agent.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/tester-validate-specification.md`
- Vstup:
  - `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
- Výstup: `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

### Lead Specification Architect – Reconciliation
- Co agent umí: `/srv/workspace/agent_profiles/lead-specification-architect.md`
- Co má agent udělat: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-reconciliation.md`
- Vstup:
  - `/srv/workspace/spec-system/projects/<project-id>/`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
  - `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`
- Šablona specifikace: `/srv/workspace/spec-system/templates/project-spec/`
- Výstup: aktualizovaná SPEC v `/srv/workspace/spec-system/projects/<project-id>/`, soubory `00` až `80`

---