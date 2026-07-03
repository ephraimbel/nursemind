#!/usr/bin/env python3
"""Source-fidelity QA: verify per-entry citation integrity in NurseMind sample files.

For each entry (enum ...Sample), every citationIDs: ["x", ...] string used in a
section body must resolve to a CitationSource whose Swift variable appears in that
entry's own citations: [a, b, ...] array. At runtime the renderer builds its
citation index from entry.citations only, so a body id that isn't backed by a
source in that array renders as a dropped/blank superscript — an uncited claim.

Handles both content styles:
  - file-level `private let src = CitationSource(id: "x")` shared across entries
  - entry-local `let src = CitationSource(id: "x")` inside a closure (batch files),
    where the same variable name is reused per entry and must shadow file-level.

Usage: python3 scripts/verify-citations.py <file.swift> [file.swift ...]
"""
import re
import sys

FILES = sys.argv[1:]


def collect_var_ids(segment):
    """var -> string id for every `let VAR = CitationSource(... id: "X")` in segment."""
    out = {}
    for m in re.finditer(r'let\s+(\w+)\s*=\s*CitationSource\(', segment):
        tail = segment[m.end():m.end() + 400]
        idm = re.search(r'\bid:\s*"([^"]+)"', tail)
        if idm:
            out[m.group(1)] = idm.group(1)
    return out


def parse_file(path):
    text = open(path).read()

    # Split into entries by `enum XxxSample {`
    enum_positions = [(m.start(), m.group(1))
                      for m in re.finditer(r'(?:public\s+)?enum (\w+)\s*\{', text)]
    entries = []
    for i, (pos, name) in enumerate(enum_positions):
        end = enum_positions[i + 1][0] if i + 1 < len(enum_positions) else len(text)
        entries.append((name, text[pos:end]))

    # File-scoped sources declared before the first entry; entry-local `let`s shadow.
    preamble_end = enum_positions[0][0] if enum_positions else len(text)
    file_var_to_id = collect_var_ids(text[:preamble_end])

    problems = []
    for name, body in entries:
        var_to_id = dict(file_var_to_id)
        var_to_id.update(collect_var_ids(body))  # local shadows file-level

        cm = re.search(r'\bcitations:\s*\[([^\]]*)\]', body)
        declared_vars = [v.strip() for v in cm.group(1).split(',') if v.strip()] if cm else []
        declared_ids = set()
        for v in declared_vars:
            if v in var_to_id:
                declared_ids.add(var_to_id[v])
            else:
                problems.append(f"  [{name}] citations: lists unresolved var '{v}'")

        used = set()
        for cid_list in re.finditer(r'citationIDs:\s*\[([^\]]*)\]', body):
            for s in re.finditer(r'"([^"]+)"', cid_list.group(1)):
                used.add(s.group(1))

        for d in sorted(used - declared_ids):
            problems.append(f"  [{name}] body cites '{d}' — NOT in entry's citations: {sorted(declared_ids)}")
    return entries, problems


total_entries = 0
total_problems = 0
for path in FILES:
    entries, problems = parse_file(path)
    total_entries += len(entries)
    short = path.split('/')[-1]
    if problems:
        total_problems += len(problems)
        print(f"\n✗ {short}  ({len(entries)} entries)")
        for p in problems:
            print(p)
    else:
        print(f"✓ {short}  ({len(entries)} entries, all citations resolve)")

print(f"\n{'=' * 50}")
print(f"Entries checked: {total_entries}  |  Problems: {total_problems}")
sys.exit(1 if total_problems else 0)
