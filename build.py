#!/usr/bin/env python3
"""Gom notes.md + Solution.swift trong problems/ và concurrency/, nhúng vào template.html để tạo index.html."""
import json
import re
from pathlib import Path

ROOT = Path(__file__).parent
problems = []

# thư mục -> tab trên trang web
CATEGORIES = {"problems": "algorithms", "concurrency": "concurrency"}
dirs = [(d, cat) for folder, cat in CATEGORIES.items() for d in sorted((ROOT / folder).glob("*/"))]

for d, cat in dirs:
    notes = d / "notes.md"
    code = d / "Solution.swift"
    if not notes.exists() or not code.exists():
        continue

    _, front, body = notes.read_text(encoding="utf-8").split("---\n", 2)
    meta = {}
    for line in front.strip().splitlines():
        k, v = line.split(":", 1)
        meta[k.strip()] = v.strip()

    sections = []
    for part in re.split(r"^## ", body, flags=re.M)[1:]:
        title, _, text = part.partition("\n")
        sections.append({"title": title.strip(), "text": text.strip()})

    problems.append({
        "id": int(meta["id"]),
        "category": cat,
        "title": meta["title"],
        "slug": meta["slug"],
        "difficulty": meta["difficulty"],
        "topics": [t.strip() for t in meta.get("topics", "").split(",") if t.strip()],
        "date": meta["date"],
        "time": meta.get("time", ""),
        "space": meta.get("space", ""),
        "status": meta.get("status", ""),
        "sections": sections,
        "code": code.read_text(encoding="utf-8").rstrip() + "\n",
    })

problems.sort(key=lambda p: p["id"])
data = json.dumps(problems, ensure_ascii=False).replace("</", "<\\/")
html = (ROOT / "template.html").read_text(encoding="utf-8")
html = html.replace("/*__DATA__*/", "window.LC_DATA = " + data + ";")
(ROOT / "index.html").write_text(html, encoding="utf-8")
print(f"index.html: {len(problems)} bài")
