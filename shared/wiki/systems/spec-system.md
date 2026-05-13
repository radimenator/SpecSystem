## Purpose

The architecture is designed to support a structured and transparent workflow for managing project specifications, evidence repositories, interpretation layers, formal models, and output documents. It ensures that each component has well-defined responsibilities and dependencies, facilitating clear traceability and accountability.

## Layers

1. Roam (thinking, notes)
2. Source Evidence Repository
3. Obsidian / LLM Wiki
4. SpecSystem (canonical specification)
5. ArchiMate Model Repository
6. Output / Document Generation Layer

## Dependency Flow

- Roam → Source Evidence Repository
- Source Evidence Repository → Obsidian / LLM Wiki
- Obsidian / LLM Wiki → SpecSystem
- SpecSystem → ArchiMate Model Repository
- SpecSystem + ArchiMate Model Repository → Output / Document Generation Layer

## Separation of Concerns

- SPEC: canonical truth for project specifications.
- RUNBOOK: operational work.
- SCRIPT: automation scripts.
- WIKI: knowledge layer.

## Execution Model

- Local Environment (MacBook): thinking, modeling.
- Remote Environment (VPS – Hetzner): orchestration, sharing, automation.

## Constraints

- SpecSystem is the single source of truth for project specifications.
- All information must be traceable to its origin.

## Related Concepts

- Source Evidence Repository
- Obsidian / LLM Wiki
- ArchiMate Model Repository
- Output / Document Generation Layer

## Related Decisions

- Single-source-of-truth policy for SpecSystem.
- Use of local and remote environments based on task type.

## Traceability Notes

- Each piece of information must be traceable to its source.