#!/usr/bin/env python3

import sys
import subprocess
from pathlib import Path

ROOT = Path.home() / "SpecSystem"

OLLAMA_MODEL = "qwen2.5:14b"

PROMPT_DIR = ROOT / "shared/prompts/wiki"
MEMORY_DIR = ROOT / "shared/memory"
WIKI_DIR = ROOT / "shared/wiki"

PAGE_TYPES = {
    "architecture": {
        "prompt": "generate-architecture-page.md",
        "output_dir": "systems",
    },
    "concepts": {"prompt": "generate-concept-page.md", "output_dir": "concepts"},
    "entities": {"prompt": "generate-entity-page.md", "output_dir": "entities"},
}


def read_text(path: Path) -> str:
    return path.read_text(encoding="utf-8")


def write_text(path: Path, content: str):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content, encoding="utf-8")


def call_ollama(prompt: str) -> str:
    result = subprocess.run(
        ["ollama", "run", OLLAMA_MODEL],
        input=prompt.encode("utf-8"),
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE,
        check=True,
    )

    return result.stdout.decode("utf-8").strip()


def build_prompt(system_prompt: str, memory_content: str) -> str:
    return f"""
{system_prompt}

=== MEMORY CONTENT ===

{memory_content}

=== INSTRUCTIONS ===

- Vrať pouze validní markdown.
- Nepiš žádné komentáře mimo markdown.
- Nepiš věty typu:
  - "Děkuji"
  - "Na základě dokumentu"
  - "Zdroj neobsahuje"
  - "Nebyly nalezeny informace"
- Nepopisuj proces generování.
- Chovej se jako deterministic documentation generator.
"""


def generate_page(memory_type: str, source_file: Path):
    config = PAGE_TYPES[memory_type]

    prompt_file = PROMPT_DIR / config["prompt"]

    system_prompt = read_text(prompt_file)
    memory_content = read_text(source_file)

    full_prompt = build_prompt(system_prompt, memory_content)

    print(f"[wiki] generating: {memory_type}/{source_file.name}")

    output = call_ollama(full_prompt)

    target_dir = WIKI_DIR / config["output_dir"]
    target_file = target_dir / source_file.name

    write_text(target_file, output)

    print(f"[wiki] written: {target_file}")


def main():
    print("=======================================")
    print("Generating wiki pages")
    print("=======================================")

    for memory_type in PAGE_TYPES.keys():
        source_dir = MEMORY_DIR / memory_type

        if not source_dir.exists():
            print(f"[skip] missing directory: {source_dir}")
            continue

        for file in source_dir.glob("*.md"):
            if file.name == "index.md":
                continue

            generate_page(memory_type, file)

    print("=======================================")
    print("Wiki generation complete")
    print("=======================================")


if __name__ == "__main__":
    main()
