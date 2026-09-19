#!/usr/bin/env python3
"""Rebuild supabase/functions/_shared/entry-titles.json from an Xcode test log.

Usage:
  cd Packages/NursemindCore
  xcodebuild test -scheme NursemindCore \
    -destination 'platform=iOS Simulator,id=<udid>' \
    -only-testing:NursemindCoreTests/EntryTitleManifestTests \
    CODE_SIGNING_ALLOWED=NO > /tmp/entry-titles.log 2>&1
  cd ../..
  python3 scripts/export-entry-titles.py /tmp/entry-titles.log

The feed pipeline (feed-classify) matches every story against this manifest
to fill feed_items.related_entry_ids, so regenerate it in the same commit as
any content round.
"""
import json
import re
import sys
from pathlib import Path

OUT = Path(__file__).resolve().parent.parent / "supabase/functions/_shared/entry-titles.json"
LINE = re.compile(r"NM-TITLE (\{.*\})\s*$")
COUNT = re.compile(r"NM-TITLE-COUNT (\d+)")


def main(log_path: str) -> None:
    log = Path(log_path).read_text()
    if "** TEST SUCCEEDED **" not in log:
        raise SystemExit("A successful completed Xcode test log is required.")
    rows = {}
    for line in log.splitlines():
        m = LINE.search(line)
        if m:
            row = json.loads(m.group(1))
            rows[row["id"]] = row
    expected = COUNT.search(log)
    if not expected or int(expected.group(1)) != len(rows):
        raise SystemExit(f"Expected {expected.group(1) if expected else '?'} rows, parsed {len(rows)}.")
    ordered = [rows[k] for k in sorted(rows)]
    lines = ",\n".join(json.dumps(r, ensure_ascii=False, sort_keys=True, separators=(",", ":")) for r in ordered)
    OUT.write_text("[\n" + lines + "\n]\n")
    print(f"wrote {len(ordered)} entries to {OUT}")


if __name__ == "__main__":
    if len(sys.argv) != 2:
        raise SystemExit(__doc__)
    main(sys.argv[1])
