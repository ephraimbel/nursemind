#!/usr/bin/env python3
"""Compare the compiled bedside evidence batch with its claim-to-source manifest."""

import argparse
import collections
import json
import re
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("test_log", type=Path)
    args = parser.parse_args()
    root = Path(__file__).resolve().parent.parent
    manifest = json.loads((root / "content/curation/bedside-evidence/manifest.json").read_text())
    log = args.test_log.read_text()
    if "** TEST SUCCEEDED **" not in log:
        raise SystemExit("A successful simulator test run is required.")
    compiled = {}
    for match in re.finditer(r"NM-BEDSIDE-EVIDENCE (\{[^\n]+\})", log):
        record = json.loads(match[1])
        if record["id"] in compiled and compiled[record["id"]] != record:
            raise SystemExit(f"Conflicting compiled records: {record['id']}")
        compiled[record["id"]] = record
    entries = manifest["entries"] + manifest["expandedEntries"]
    assert len({e["id"] for e in entries}) == len(entries), "Duplicate manifest entries"
    assert set(compiled) == {e["id"] for e in entries}, "Missing or unexpected compiled entries"
    sources = {s["id"]: s for s in manifest["sources"]}
    assert len(sources) == len(manifest["sources"]), "Duplicate source IDs"
    words = collections.Counter()
    for entry in entries:
        actual = compiled[entry["id"]]
        if entry in manifest["entries"]:
            assert actual["sections"] == entry["sections"], f"Body drift: {entry['id']}"
        else:
            assert actual["sections"][-len(entry["sections"]):] == entry["sections"], entry["id"]
        declared = {s["id"]: s for s in actual["citations"]}
        for section in entry["sections"]:
            for block in section["blocks"]:
                assert block["text"].strip() and block["citationIDs"], entry["id"]
                assert set(block["citationIDs"]) <= set(declared), entry["id"]
                for source_id in block["citationIDs"]:
                    words[source_id] += len(block["text"].split())
                    if source_id in sources:
                        for key in ("id", "shortName", "detail", "publisher", "license", "url", "lastRetrieved"):
                            assert declared[source_id][key] == sources[source_id][key], (source_id, key)
    for source_id, count in words.items():
        if source_id in sources and sources[source_id]["license"] == "factCitationOnly":
            assert count <= 200, f"Factual summary exceeds reuse budget: {source_id} ({count})"
    assert not manifest["clinicalReview"]["publicationApproved"], "Review status requires independent adjudication"
    blocks = sum(len(s["blocks"]) for e in entries for s in e["sections"])
    print(f"Verified {len(entries)} compiled entries, {blocks} added cited blocks, "
          f"{sum(words.values())} added body words and {len(sources)} source records.")
    print("Structural/source-mapping verification only; independent clinical review remains pending.")


if __name__ == "__main__":
    main()
