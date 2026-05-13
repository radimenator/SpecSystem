```markdown
## Architektonické Invarianty

### Vrstvy systému
1. Roam (myšlení, poznámky)
2. Source Evidence Repository (zdrojová evidence)
3. Obsidian / LLM Wiki (interpretační vrstva)
4. SpecSystem (kanonická specifikace)
5. ArchiMate Model Repository (formální modely)
6. Output / Document Generation Layer (výstupní dokumenty)

### Dependency Flow
- Roam → Source Evidence Repository
- Source Evidence Repository → Obsidian / LLM Wiki
- Obsidian / LLM Wiki → SpecSystem
- SpecSystem → ArchiMate Model Repository
- SpecSystem + ArchiMate Model Repository → Output / Document Generation Layer

### Separation of Concerns
- SPEC: kanonická pravda
- RUNBOOK: operativní práce
- SCRIPT: automatizace
- WIKI: znalostní vrstva

### Source of Truth
- SpecSystem je jediným zdrojem pravdy pro specifikace projektů.

### Execution Model
- Lokální prostředí (MacBook): myšlení, modelování.
- Vzdálené prostředí (VPS – Hetzner): orchestrace, sdílení, automatizace.

### Traceability
- Každá informace musí být dohledatelná ke zdroji.
```
