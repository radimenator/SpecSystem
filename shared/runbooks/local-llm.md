# Local LLM

## Účel

Lokální LLM slouží pro:

- ingestion dokumentů,
- syntézu wiki,
- extrakci entit,
- RAG retrieval,
- návrhy změn SPEC,
- práci agentů.

---

# Používané modely

## Chat / reasoning model

```text
qwen2.5:14b
```

## Embedding model
```text
nomic-embed-text
```

# Spuštění Ollama

## Start serveru
```bash
ollama serve
```

# Kontrola dostupnosti

## List modelů
```bash
curl http://localhost:11434/api/tags
```

# Instalace modelů

## Qwen

```bash
ollama pull qwen2.5:14b
```

## Embeddings
```bash
ollama pull nomic-embed-text
```

# Test embedding API

```bash
curl http://localhost:11434/api/embed -d '{
  "model": "nomic-embed-text",
  "input": "Testovací embedding."
}'
```

# Test chat modelu

```bash
ollama run qwen2.5:14b
```

# Ingestion pipeline
```bash
Source / SPEC
        ↓
wiki_ingest.py
        ↓
Ollama API
        ↓
Wiki syntéza
        ↓
shared/wiki/
```

# Hlavní skripty

## Ingest source

```text
shared/scripts/ingest-source.sh
```

## Wiki ingest

```text
shared/scripts/wiki_ingest.py
```

# Důležité endpointy

## Chat

```text
http://localhost:11434/api/generate
```

## Embeddings
```text
http://localhost:11434/api/embed
```

# Troubleshooting

## Ollama neběží
```bash
ollama serve
```

## Chybí model
```bash
ollama pull <model>
```

## Test API
```bash
curl http://localhost:11434/api/tags
```


