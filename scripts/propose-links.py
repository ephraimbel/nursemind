#!/usr/bin/env python3
"""Propose candidate library cross-links for human curation.

Scans every bundled entry's Swift literal for mentions of other entries'
titles, drops pairs that already exist in Content/Links/, and emits candidate
EntryLink lines grouped by hub with a suggested relation per category pair.

Output is a REVIEW QUEUE, not data: nothing here ships until a human accepts
an edge into a Content/Links/*.swift file, where the registry tests then
enforce it. Runtime never sees inferred links.

Usage:
  python3 scripts/propose-links.py                 # report to stdout
  python3 scripts/propose-links.py --min-score 20  # raise the noise floor
  python3 scripts/propose-links.py --hub drug:heparin   # one hub only
"""

import argparse
import re
import sys
from collections import defaultdict
from pathlib import Path

REPO = Path(__file__).resolve().parent.parent
SAMPLES = REPO / "Packages/NursemindCore/Sources/NursemindCore/Content/Samples"
LINKS = REPO / "Packages/NursemindCore/Sources/NursemindCore/Content/Links"

# Titles that are too generic to mean a cross-reference when they appear in
# prose. Lowercased, matched against the normalized title.
GENERIC_TITLES = {
    "pain", "fever", "anxiety", "depression", "obesity", "falls", "delirium",
    "glucose", "sodium", "potassium", "calcium", "magnesium", "insulin",
    "oxygen", "restraints", "delegation", "prioritization", "hand hygiene",
    "brief", "huddle", "debrief", "check-back", "call-out",
}

# Suggested relation per (from-category, to-category); everything else
# defaults to seeAlso. The suggestion is a starting point for the curator —
# the registry tests enforce whichever relation is actually chosen.
SUGGESTED_RELATION = {
    ("drug", "lab"): "monitorsWith",
    ("drip", "lab"): "monitorsWith",
    ("drug", "diagnosis"): "usedFor",
    ("drip", "diagnosis"): "usedFor",
    ("diagnosis", "lab"): "assessedBy",
    ("diagnosis", "procedure"): "assessedBy",
    ("procedure", "diagnosis"): "performedFor",
    ("lab", "lab"): "interpretWith",
}


def parse_symbol_categories() -> dict[str, str]:
    """SampleSymbol -> wrapper category, from BundledEntries.swift appends."""
    text = (SAMPLES / "BundledEntries.swift").read_text()
    out = {}
    for cat, symbol in re.findall(r"entries\.append\(\.([a-z]+)\((\w+)\.entry\)\)", text):
        out[symbol] = cat
    return out


def parse_entries(symbol_categories: dict[str, str]):
    """id -> {category, title, body} parsed from enum blocks in Samples."""
    entries = {}
    enum_header = re.compile(r"^(?:public |internal )?enum (\w+)\b")
    for path in sorted(SAMPLES.glob("*.swift")):
        if path.name == "BundledEntries.swift":
            continue
        lines = path.read_text().splitlines()
        blocks: list[tuple[str, list[str]]] = []
        for line in lines:
            m = enum_header.match(line)
            if m:
                blocks.append((m.group(1), []))
            elif blocks:
                blocks[-1][1].append(line)
        for symbol, block_lines in blocks:
            category = symbol_categories.get(symbol)
            if category is None:
                continue
            body = "\n".join(block_lines)
            id_m = re.search(r'id:\s*"([a-z0-9-]+)"', body)
            title_m = re.search(r'title:\s*"([^"]+)"', body)
            if not id_m or not title_m:
                continue
            full_id = f"{category}:{id_m.group(1)}"
            entries[full_id] = {
                "category": category,
                "title": title_m.group(1),
                "body": body.lower(),
            }
    return entries


def parse_existing_pairs() -> set[frozenset]:
    pairs = set()
    for path in LINKS.glob("*.swift"):
        for frm, to in re.findall(
            r'EntryLink\(from:\s*"([^"]+)",\s*to:\s*"([^"]+)"', path.read_text()
        ):
            pairs.add(frozenset((frm, to)))
    return pairs


def normalized_title(title: str) -> str:
    t = title.lower()
    t = re.sub(r"\s*\(.*?\)", "", t)          # drop parentheticals
    t = re.sub(r"\s*[—·].*$", "", t)          # drop em-dash/interpunct tails
    return t.strip()


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--min-score", type=int, default=12,
                    help="minimum mentions x title-length score (default 12)")
    ap.add_argument("--hub", help="only propose links for this entry id")
    ap.add_argument("--max-per-hub", type=int, default=8)
    args = ap.parse_args()

    symbol_categories = parse_symbol_categories()
    entries = parse_entries(symbol_categories)
    existing = parse_existing_pairs()
    print(f"parsed {len(entries)} entries, {len(existing)} existing linked pairs",
          file=sys.stderr)

    # Match patterns: normalized title (>= 5 chars, not generic), compiled
    # once with word boundaries.
    patterns = {}
    for full_id, e in entries.items():
        t = normalized_title(e["title"])
        if len(t) < 5 or t in GENERIC_TITLES:
            continue
        patterns[full_id] = re.compile(r"\b" + re.escape(t) + r"\b")

    candidates: dict[str, list] = defaultdict(list)
    for src_id, src in entries.items():
        if args.hub and src_id != args.hub:
            continue
        for dst_id, pattern in patterns.items():
            if dst_id == src_id:
                continue
            if frozenset((src_id, dst_id)) in existing:
                continue
            # An entry quoting its own name family (heparin vs heparin drip)
            # is navigationally useful, so same-stem pairs are kept.
            count = len(pattern.findall(src["body"]))
            if count == 0:
                continue
            score = count * len(normalized_title(entries[dst_id]["title"]))
            if score < args.min_score:
                continue
            candidates[src_id].append((score, count, dst_id))

    emitted = 0
    for src_id in sorted(candidates, key=lambda k: -len(candidates[k])):
        rows = sorted(candidates[src_id], reverse=True)[: args.max_per_hub]
        src_cat = entries[src_id]["category"]
        print(f"\n// ===== {src_id} — {entries[src_id]['title']} =====")
        for score, count, dst_id in rows:
            dst_cat = entries[dst_id]["category"]
            relation = SUGGESTED_RELATION.get((src_cat, dst_cat), "seeAlso")
            print(
                f'EntryLink(from: "{src_id}", to: "{dst_id}", relation: .{relation}),'
                f"  // {count}x mention · {entries[dst_id]['title']}"
            )
            emitted += 1
    print(f"\n{emitted} candidates across {len(candidates)} hubs", file=sys.stderr)
    return 0


if __name__ == "__main__":
    sys.exit(main())
