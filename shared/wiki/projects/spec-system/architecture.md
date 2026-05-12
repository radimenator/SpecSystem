Tvé popisy závislostí mezi různými agenty a jejich vstupy/výstupy pro SpecSystem jsou velmi stručné a jasně definované. Upravím je trochu, aby byly ještě více čitelné a kompletní:

### Lead Specification Architect

- **Co agent umí:** `/srv/workspace/agent_profiles/lead-specification-architect.md`
- **Co má agent udělat:** Založit kanonickou specifikaci projektu.
  - Návod: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-define-specification.md`
- **Vstupy:**
  - ROAM specifikace projektu
  - Společná wiki (Obsidian/LLM Wiki): `/srv/workspace/spec-system/shared/wiki/`
  - Zdrojové evidence konkrétního projektu: `/srv/workspace/spec-system/projects/<project-id>/sources/`
- **Šablona specifikace:** `/srv/workspace/spec-system/templates/project-spec/`
- **Výstupy:**
  - Kanonická specifikace v souborech `00` až `80`: `/srv/workspace/spec-system/projects/<project-id>/`

### Specification Reviewer

- **Co agent umí:** `/srv/workspace/agent_profiles/specification-reviewer.md`
- **Co má agent udělat:** Provést audit specifikace.
  - Návod: `/srv/workspace/spec-system/shared/prompts/reviewer-review-specification.md`
- **Vstupy:**
  - Kanonická specifikace projektu: `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`.
- **Výstup:**
  - Zpráva auditu: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`

### Specification Test Agent

- **Co agent umí:** `/srv/workspace/agent_profiles/specification-test-agent.md`
- **Co má agent udělat:** Provést validaci specifikace.
  - Návod: `/srv/workspace/spec-system/shared/prompts/tester-validate-specification.md`
- **Vstupy:**
  - Kanonická specifikace projektu: `/srv/workspace/spec-system/projects/<project-id>/`, typicky soubory `10` až `40`.
  - Auditovací zpráva: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
- **Výstup:**
  - Zpráva validace: `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`

### Lead Specification Architect – Reconciliation

- **Co agent umí:** `/srv/workspace/agent_profiles/lead-specification-architect.md`
- **Co má agent udělat:** Integrace názorů auditu a validace do kanonické specifikace.
  - Návod: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-reconciliation.md`
- **Vstupy:**
  - Kanonická specifikace projektu: `/srv/workspace/spec-system/projects/<project-id>/`
  - Auditovací zpráva: `/srv/workspace/tasks/<date>-<project-id>-spec-review.md`
  - Zpráva validace: `/srv/workspace/tasks/<date>-<project-id>-spec-test.md`
- **Šablona specifikace:** `/srv/workspace/spec-system/templates/project-spec/`
- **Výstupy:**
  - Aktualizovaná kanonická specifikace v souborech `00` až `90`: `/srv/workspace/spec-system/projects/<project-id>/`

Toto uspořádání by mělo pomoci jasněji identifikovat a následně lépe spravovat závislosti mezi různými částmi systému.