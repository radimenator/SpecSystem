Tvoje struktura souborů a závislostí pro SpecSystem je dobře organizována a čitelná. Tady jsou klíčové body, které by měly být udržovány pro efektivní fungování systému:

### Struktura adresářů
1. **`projects/<project-id>/`**:
   - Obsahuje kanonickou specifikaci projektu (soubory `00` až `90`).
2. **`shared/wiki/projects/<project-id>/`**:
   - Projektové informace ve společné wiki.
3. **`shared/models/archimate/global/`**:
   - Globální ArchiMate model napříč projekty.
4. **`shared/models/archimate/projects/<project-id>/`**:
   - ArchiMate model konkrétního projektu.
5. **`projects/<project-id>/outputs/`**:
   - Odvozené výstupní dokumenty pro specifický projekt (PDF, HTML apod.).

### Závislosti pro jednotlivé role
1. **Lead Specification Architect**:
   - **Co umí**: `/srv/workspace/agent_profiles/lead-specification-architect.md`
   - **Co má udělat**: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-define-specification.md`
   - **Vstup**: ROAM specifikace projektu, wiki, zdrojová evidence
   - **Šablona**: `/srv/workspace/spec-system/templates/project-spec/`
   - **Výstup**: Specifikace v `projects/<project-id>/`, soubory `00` až `80`

2. **Specification Reviewer**:
   - **Co umí**: `/srv/workspace/agent_profiles/specification-reviewer.md`
   - **Co má udělat**: `/srv/workspace/spec-system/shared/prompts/reviewer-review-specification.md`
   - **Vstup**: Specifikace v `projects/<project-id>/`, typicky soubory `10` až `40`
   - **Výstup**: Výsledky kontrol v `tasks/<date>-<project-id>-spec-review.md`

3. **Specification Test Agent**:
   - **Co umí**: `/srv/workspace/agent_profiles/specification-test-agent.md`
   - **Co má udělat**: `/srv/workspace/spec-system/shared/prompts/tester-validate-specification.md`
   - **Vstup**: Specifikace v `projects/<project-id>/`, typicky soubory `10` až `40`; kontrolní přehledy (`tasks/<date>-<project-id>-spec-review.md`)
   - **Výstup**: Výsledky testování v `tasks/<date>-<project-id>-spec-test.md`

4. **Lead Specification Architect – Reconciliation**:
   - **Co umí**: `/srv/workspace/agent_profiles/lead-specification-architect.md`
   - **Co má udělat**: `/srv/workspace/spec-system/shared/prompts/lead-specification-architect-reconciliation.md`
   - **Vstup**: Specifikace v `projects/<project-id>/`; kontrolní přehledy (`tasks/<date>-<project-id>-spec-review.md` a `tasks/<date>-<project-id>-spec-test.md`)
   - **Šablona**: `/srv/workspace/spec-system/templates/project-spec/`
   - **Výstup**: Aktualizovaná specifikace v `projects/<project-id>/`, soubory `00` až `90`

### Důležité poznámky
- Ujistěte se, že agenti mají přístup k potřebným zdrojům (wiki, specifikace, zdrojová evidence).
- Přesné výsledky a aktualizace jsou klíčové pro efektivní projektové práce.
- Používání šablon pomáhá udržovat konsistentnost specifikací.

Tato struktura a závislosti měly by podpořit smysluplnou, koherentní práci s projekty v SpecSystemu.