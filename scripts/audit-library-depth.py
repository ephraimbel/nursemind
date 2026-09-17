#!/usr/bin/env python3
"""Export the compiled library's ContentDepthAuditTests output for content review."""

import argparse
import csv
import json
import re
import statistics
from collections import Counter
from pathlib import Path


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("test_log", type=Path)
    parser.add_argument("--output", type=Path, required=True)
    parser.add_argument("--baseline", type=Path)
    args = parser.parse_args()
    log = args.test_log.read_text()
    if "** TEST SUCCEEDED **" not in log:
        raise SystemExit("A successful completed Xcode test log is required.")
    records = {}
    for line in log.splitlines():
        match = re.search(r"NM-DEPTH (\{.*\})", line)
        if match:
            row = json.loads(match.group(1))
            if row["id"] in records and records[row["id"]] != row:
                raise SystemExit(f"Conflicting audit records: {row['id']}")
            records[row["id"]] = row
    if not records:
        raise SystemExit("No NM-DEPTH records found. Run ContentDepthAuditTests first.")
    counts = re.findall(r"NM-DEPTH-COUNT (\d+)", log)
    if not counts or len(records) != int(counts[-1]):
        raise SystemExit("Incomplete audit output. Run only the ContentDepthAuditTests suite to avoid interleaved test output.")
    rows = sorted(records.values(), key=lambda row: row["id"])
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output / "entries.json").write_text(json.dumps(rows, indent=2, ensure_ascii=False) + "\n")

    queue = []
    for row in rows:
        reasons = []
        signals = row.get("clinicalReviewSignals", [])
        locators = row.get("sourceLocatorIssues", [])
        if signals:
            reasons.append("Clinical reviewer triage: " + "; ".join(signals))
        if row["unresolvedCitationIDs"]:
            reasons.append("Unresolved citation IDs: " + ", ".join(row["unresolvedCitationIDs"]))
        if locators:
            reasons.append("Source locator review: " + "; ".join(locators))
        if row["uncitedBlocks"]:
            reasons.append(f"{len(row['uncitedBlocks'])} blocks without attached citation IDs")
        if row["absentSections"]:
            reasons.append("Check absent sections: " + ", ".join(row["absentSections"]))
        if row["words"] < 150:
            reasons.append("Short entry: review usefulness; do not pad to a word target")
        if not row.get("topicIDs"):
            reasons.append("Not assigned to a selected topic collection")
        if reasons:
            priority = 1 if signals or row["unresolvedCitationIDs"] else 2 if locators or row["uncitedBlocks"] else 3
            queue.append({"priority": priority, "id": row["id"], "title": row["title"],
                          "category": row["category"], "words": row["words"],
                          "review_reasons": " | ".join(reasons), "review_status": "Not adjudicated"})
    queue.sort(key=lambda row: (row["priority"], row["category"], row["words"], row["id"]))
    with (args.output / "review-queue.csv").open("w", newline="") as stream:
        writer = csv.DictWriter(stream, fieldnames=["priority", "id", "title", "category", "words", "review_reasons", "review_status"], lineterminator="\n")
        writer.writeheader()
        writer.writerows(queue)

    lines = ["# Compiled library review snapshot", "",
             "Generated from a successful simulator test run. These are structural review signals, not clinical accuracy scores or publication approval. Word count measures size, not usefulness. Optional sections may legitimately be absent.", "",
             f"- Registered entries: **{len(rows):,}**.",
             f"- Entries with unresolved attached citation IDs: **{sum(bool(r['unresolvedCitationIDs']) for r in rows):,}**.",
             f"- Entries with at least one block lacking attached citation IDs: **{sum(bool(r['uncitedBlocks']) for r in rows):,}**.",
             f"- Entries citing a search URL or site root: **{sum(bool(r.get('sourceLocatorIssues')) for r in rows):,}**.",
             f"- Entries flagged for clinical-review triage: **{sum(bool(r.get('clinicalReviewSignals')) for r in rows):,}**.",
             f"- Entries reachable through selected topic collections: **{sum(bool(r.get('topicIDs')) for r in rows):,}**.", "",
             "Quick-reference/table rows currently cannot carry citation IDs in the data model. A missing attached ID is not proof that a claim has no supporting source. Conversely, a resolved citation ID is not proof that the source supports the claim. The review signals do not detect every pediatric or emergency topic.", "",
             "| Section | Entries | Median body words | Under 150 words | Entries with absent sections |", "|---|---:|---:|---:|---:|"]
    for category in sorted({r["category"] for r in rows}):
        group = [r for r in rows if r["category"] == category]
        lines.append(f"| {category} | {len(group)} | {statistics.median(r['words'] for r in group):g} | {sum(r['words'] < 150 for r in group)} | {sum(bool(r['absentSections']) for r in group)} |")
    lines += ["", "## Absent-section review", ""]
    for category in sorted({r["category"] for r in rows}):
        counts = Counter(s for r in rows if r["category"] == category for s in r["absentSections"])
        if counts:
            lines.append(f"- {category}: " + "; ".join(f"{s} ({n})" for s, n in sorted(counts.items())) + ".")
    if args.baseline:
        before = {r["id"]: r for r in json.loads(args.baseline.read_text())}
        lines += ["", "## Changes from baseline", "",
                  f"New registered entries: {len(set(records) - set(before))}. This is the shared workspace total and can include concurrent work.", "",
                  "| Existing entry | Before words | After words |", "|---|---:|---:|"]
        for row in rows:
            old = before.get(row["id"])
            if old and old["words"] != row["words"]:
                lines.append(f"| {row['id']} | {old['words']} | {row['words']} |")
    lines += ["", "## Review order", "",
              "1. Credentialed review of high-alert, pediatric, emergency and treatment instructions. Source-fidelity checks do not waive the project brief’s clinical-review gates.",
              "2. Replace generic/search citations with the actual source supporting each claim; verify numeric values against that source and the applicable population.",
              "3. Review missing sections for clinical relevance, then improve concise entries where bedside questions remain unanswered.",
              "4. Extend topic navigation after content checks; consolidate overlapping titles without breaking stable entry IDs.", "",
              "See `entries.json` for every section and source URL, and `review-queue.csv` for a sortable queue. No entry receives clinical approval from this script.", ""]
    (args.output / "summary.md").write_text("\n".join(lines))
    print(f"Exported {len(rows)} entries and {len(queue)} review candidates to {args.output}")


if __name__ == "__main__":
    main()
