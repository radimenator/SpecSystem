#!/usr/bin/env python3

from pathlib import Path
import re
import sys

if len(sys.argv) < 3:
    print("Usage: chunk_markdown.py <input.md> <output-dir>")
    sys.exit(1)

input_file = Path(sys.argv[1])
output_dir = Path(sys.argv[2])

output_dir.mkdir(parents=True, exist_ok=True)

text = input_file.read_text(encoding="utf-8")

sections = re.split(r"(?=^## )", text, flags=re.MULTILINE)

counter = 1

for section in sections:
    section = section.strip()

    if not section:
        continue

    lines = section.splitlines()

    title = lines[0].replace("## ", "").strip()

    slug = (
        title.lower()
        .replace(" ", "-")
        .replace("/", "-")
        .replace("(", "")
        .replace(")", "")
    )

    filename = f"{counter:02d}-{slug}.md"

    output_path = output_dir / filename

    output_path.write_text(section, encoding="utf-8")

    print(f"Created: {output_path}")

    counter += 1
