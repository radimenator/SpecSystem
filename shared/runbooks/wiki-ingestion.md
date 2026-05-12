# Wiki Ingestion

## Účel

Ingest SPEC artefaktů a source evidence do LLM Wiki.

---

# Pořadí ingestu

1. architecture.md
2. scope.md
3. decisions.md
4. source evidence

---

# Ingest SPEC artefaktů

## Architecture

```bash
./shared/scripts/ingest-source.sh \
  spec-system \
  projects/spec-system/30-architecture/architecture.md
```

## Scope
```bash
./shared/scripts/ingest-source.sh \
  spec-system \
  projects/spec-system/20-scope/scope.md
```

## Decisions
```bash
./shared/scripts/ingest-source.sh \
  spec-system \
  projects/spec-system/50-decisions/decisions.md
```

## Výstup
```text
shared/wiki/projects/<project-id>/
```

# Troubleshooting

## Ollama neběží

```bash
ollama serve
```

## Test API
```bash
curl http://localhost:11434/api/tags
```
Missing embedding model
```bash
ollama pull nomic-embed-text
```


