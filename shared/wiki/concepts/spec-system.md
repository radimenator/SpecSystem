## Specifikace (SPEC)

### Definition

A canonical source of truth for project specifications.

### Purpose

To serve as the definitive reference for defining and documenting project requirements, motivations, scope, architecture, components, decisions, links, regeneration processes, history, and validation criteria.

### Relationships

- **Roam Research:** Refers to the root specification.
- **~/Projects:** Implementation details are referenced from the root specification.
- **Wiki:** Formalizes interpretations and knowledge synthesis based on source evidence and Roam notes.
- **ArchiMate Model Repository:** Models derived from SpecSystem for architectural representation.

### Constraints

- Each project must have a single root specification.
- Root specifications must be human-readable and machine-readable.
- Artifacts from specifications can generate documents but are not the primary truth.

## Runbook

### Definition

A documentation of operational workflows and manual procedures.

## Script

### Definition

An implementation for automation and deterministic operations.

## Wiki

### Definition

Interpretative and knowledge layer (entities, concepts, syntheses).

## Architecture

### Layer Responsibility Separation
- **Roam Research:** Project context, work notes.
- **Source Evidence Repository:** Source documents and models (PDF, DOCX, CSV).
- **Obsidian / LLM Wiki:** Cognitive layer (entities, concepts, syntheses).
- **SpecSystem:** Canonical specification.
- **ArchiMate Model Repository:** Formal architectural graph.
- **~/Projects:** Implementation and code.

### Relationships

- Roam project references root specification.
- Root specification references implementation in ~/Projects.
- Source Evidence → Wiki (extraction, synthesis).
- Wiki → SpecSystem (formalization).
- SpecSystem → ArchiMate (modeling).
- ArchiMate → SpecSystem (reverse validation).

## Main Architectural Principles

- Deterministic validations and exports.
- Canonical specification is the sole entry point for artifacts.
- Source documents are evidence, not automatic truth.

## Local vs Remote Environment

- **Local:** Work in Roam Research, Obsidian / LLM Wiki, editing specifications.
- **Remote (VPS):** Central repository of SpecSystem, agent infrastructure.

### Directory Structure

#### Project Dependent Directories
```
/Users/radimpokorny/SpecSystem/projects/<project-id>/
├── 00-meta/
├── 10-motivation/
├── 20-scope/
├── 30-architecture/
├── 40-components/
├── 50-decisions/
├── 60-links/
├── 70-regeneration/
├── 80-history/
├── 90-validation/
└── outputs/
```

#### Shared Directories
```
/Users/radimpokorny/SpecSystem/shared/wiki/projects/<project-id>/
/users/radimpokorny/specsystem/shared/models/archimate/global/
users/radimpokorny/specsystem/shared/models/archimate/projects/<project-id>/
```

## File Dependencies

### Lead Specification Architect
- **Input:** ROAM project specification, Wiki, Source Evidence.
- **Output:** Canonical specifications in `/srv/workspace/spec-system/projects/<project-id>/`.

### Specification Reviewer
- **Input:** Project specification files (10 to 40).
- **Output:** Revision report.

### Specification Test Agent
- **Input:** Project specification, revision report.
- **Output:** Testing report.

### Lead Specification Architect – Reconciliation
- **Input:** Project specification, revision and testing reports.
- **Output:** Updated canonical specifications.