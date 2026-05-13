#!/usr/bin/env python3

import sys
from pathlib import Path
import requests

OLLAMA_URL = "http://localhost:11434"
MODEL = "qwen2.5:14b"

FORBIDDEN = [
    "Děkuji",
    "děkuji",
    "Pokud potřebujete",
    "dejte mi vědět",
    "neváhejte",
    "můžu Vám",
    "mohu Vám",
]


def read(path: str) -> str:
    return Path(path).read_text(encoding="utf-8")


def call_ollama(prompt: str) -> str:
    response = requests.post(
        f"{OLLAMA_URL}/api/generate",
        json={
            "model": MODEL,
            "prompt": prompt,
            "stream": False,
            "options": {
                "temperature": 0.1,
                "num_ctx": 8192
            }
        },
        timeout=600,
    )
    response.raise_for_status()
    return response.json()["response"].strip()


def main() -> None:
    if len(sys.argv) != 6:
        print("Usage: extract_memory.py <type> <project-id> <prompt-file> <source-file> <output-file>")
        sys.exit(1)

    mem_type = sys.argv[1]
    project_id = sys.argv[2]
    prompt_file = sys.argv[3]
    source_file = sys.argv[4]
    output_file = Path(sys.argv[5])

    prompt_template = read(prompt_file)
    source_text = read(source_file)

    prompt = f"""
{prompt_template}

STRICT RULES:
- Vrať pouze Markdown.
- Neodpovídej uživateli.
- Neděkuj.
- Nenabízej pomoc.
- Nepoužívej konverzační styl.
- Nepiš úvod typu "Níže uvádím".
- Každý bod musí být odvozený ze zdrojového textu.
- Pokud zdroj neobsahuje relevantní informace, napiš pouze: "_Žádná relevantní fakta ve zdroji._"

PROJECT_ID:
{project_id}

MEMORY_TYPE:
{mem_type}

SOURCE_FILE:
{source_file}

SOURCE_TEXT:
{source_text}
"""

    result = call_ollama(prompt)

    for phrase in FORBIDDEN:
        if phrase in result:
            raise RuntimeError(f"Zakázaná chatbot fráze ve výstupu: {phrase}")

    output_file.write_text(result + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
