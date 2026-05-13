```markdown
- **Source Evidence Repository**
  - Uchování zdrojových dokumentů v raw podobě.
  - Metadata (zdroj, verze, hash).
  - Preprocessing (text, chunking).
  - Opakovatelná extrakce.

- **Obsidian / LLM Wiki**
  - Entity (aplikace, procesy, data, technologie).
  - Pojmy a koncepty.
  - Syntézy dokumentů.
  - Znalostní graf (linkování).

- **SpecSystem**
  - Kanonická specifikace projektu.
  - YAML + Markdown.
  - Verzování (Git).
  - ADR (rozhodnutí).
  - Vazby na model a implementaci.

- **ArchiMate Model Repository**
  - Prvky (elements).
  - Vztahy (relationships).
  - Views.
  - Validace modelu.
  - Import/export Open Exchange XML.

- **LLM Agent (lokální)**
  - Extrakce informací ze zdrojů.
  - Návrhy změn specifikace a modelu.
  - Sumarizace a syntéza.
  - Generování strukturovaných výstupů.
  - Omezující pravidla: nemění kanonickou specifikaci bez potvrzení, nemění model bez validace.

- **Output / Document Generation Layer**
  - Generování dokumentů ze SpecSystem a ArchiMate modelu.
  - Typy výstupů (OHA formulář, zadávací dokumentace, architektonická dokumentace).
  - Šablony (templates): YAML / Markdown / DOCX / HTML.
  - Deterministická transformace.

- **Repositorie**
  - `/srv/workspace/repos/` – centrální repozitář SpecSystem a OpenClaw agentní infrastruktura.
  - `/Users/radimpokorny/SpecSystem/projects/<project-id>/sources/` – zdrojová evidence konkrétního projektu.
  - `/Users/radimpokorny/SpecSystem/shared/wiki/projects/<project-id>/` – společný znalostní báze napříč projekty.
  - `/Users/radimpokorny/SpecSystem/shared/models/archimate/global` – globální ArchiMate pohled napříč projekty.
  - `/Users/radimpokorny/SpecSystem/projects/<project-id>/outputs/` – výstupní dokumentace konkrétního projektu.

- **Vrstvy systému**
  - Roam (myšlení, poznámky).
  - Source Evidence Repository.
  - Obsidian / LLM Wiki.
  - SpecSystem + ArchiMate Model Repository.
  - Document Generation.
  - ~/Projects (implementace).

- **Hlavní architektonické principy**
  - Jedna aplikace má jeden root specifikace.
  - Root specifikace je kořenová složka projektu ve SpecSystem.
  - Specifikace může mít více artefaktů, ale jeden kanonický vstupní bod.
  - Specifikace musí být čitelná člověkem i strojem.
  - Z artefaktů specifikace musí být možné generovat dokument.
  - Interpretace (Wiki) je oddělená od kanonické specifikace.
  - ArchiMate model je formální projekce specifikace.
  - Kód je odvozený artefakt.
  - LLM je asistent, ne autorita.
  - Validace a exporty jsou deterministické.
```
