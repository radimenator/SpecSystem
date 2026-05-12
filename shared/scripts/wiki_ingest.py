#!/usr/bin/env python3

import argparse
import json
from pathlib import Path
import requests

OLLAMA_URL = "http://localhost:11434"
CHAT_MODEL = "qwen2.5:14b"
EMBED_MODEL = "nomic-embed-text"


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def call_ollama(prompt: str) -> str:
    response = requests.post(
        f"{OLLAMA_URL}/api/generate",
        json={
            "model": CHAT_MODEL,
            "prompt": prompt,
            "stream": False,
        },
        timeout=300,
    )
    response.raise_for_status()
    return response.json()["response"]


def embed_text(text: str) -> list[float]:
    response = requests.post(
        f"{OLLAMA_URL}/api/embed",
        json={
            "model": EMBED_MODEL,
            "input": text,
        },
        timeout=120,
    )
    response.raise_for_status()
    data = response.json()
    return data["embeddings"][0]


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("project_id")
    parser.add_argument("source_file")
    args = parser.parse_args()

    root = Path.home() / "SpecSystem"
    source_file = Path(args.source_file).expanduser().resolve()

    prompt_file = root / "shared/prompts/wiki-extract-source.md"
    wiki_project_dir = root / "shared/wiki/projects" / args.project_id
    embeddings_dir = root / "local/rag/embeddings" / args.project_id

    wiki_project_dir.mkdir(parents=True, exist_ok=True)
    embeddings_dir.mkdir(parents=True, exist_ok=True)

    prompt_template = read_text(prompt_file)
    source_text = read_text(source_file)

    prompt = f"""{prompt_template}

    DŮLEŽITÉ:
    Výstup musí být pouze obsah wiki stránky.
    Zakázané jsou konverzační fráze, poděkování, nabídky pomoci a obecné rady.
    Piš česky.
    Buď věcný a stručný.
    Nevytvářej obsah, který není podložen zdrojem.

    # Source file

    {source_file}

    # Source text

    {source_text}
    """

    markdown = call_ollama(prompt)
    embedding = embed_text(source_text[:8000])

    output_md = wiki_project_dir / f"{source_file.stem}.md"
    output_json = embeddings_dir / f"{source_file.stem}.embedding.json"

    output_md.write_text(markdown, encoding="utf-8")
    output_json.write_text(
        json.dumps(
            {
                "project_id": args.project_id,
                "source_file": str(source_file),
                "embedding_model": EMBED_MODEL,
                "embedding": embedding,
            },
            ensure_ascii=False,
            indent=2,
        ),
        encoding="utf-8",
    )

    print(f"Wiki výstup: {output_md}")
    print(f"Embedding: {output_json}")


if __name__ == "__main__":
    main()
