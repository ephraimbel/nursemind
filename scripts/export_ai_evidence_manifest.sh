#!/bin/bash
set -euo pipefail
simulator_id="${1:?Usage: bash scripts/export_ai_evidence_manifest.sh SIMULATOR_UDID [DERIVED_DATA_PATH]}"
root_dir="$(cd "$(dirname "$0")/.." && pwd)"
derived_data="${2:-/tmp/nursemind-ai-evidence-build}"
export_log="$(mktemp /tmp/nursemind-ai-evidence.XXXXXX)"
trap 'rm -f "$export_log"' EXIT
cd "$root_dir/Packages/NursemindCore"
xcodebuild -scheme NursemindCore -destination "id=$simulator_id" -derivedDataPath "$derived_data" \
  -only-testing:NursemindCoreTests/AIEvidenceManifestTests CODE_SIGNING_ALLOWED=NO test > "$export_log" 2>&1
python3 - "$export_log" "$root_dir" <<'PY'
import json, pathlib, re, shutil, sys
log = pathlib.Path(sys.argv[1]).read_text()
match = re.search(r'AI_EVIDENCE_MANIFEST (.+?) \| (\d+) passages', log)
if not match:
    raise SystemExit('Manifest export did not produce a verified output path.')
source = pathlib.Path(match[1])
values = json.loads(source.read_text())
if len(values) < 500 or len(set(values)) != len(values) or not all(re.fullmatch(r'[0-9a-f]{64}', x) for x in values):
    raise SystemExit('Invalid evidence manifest.')
destination = pathlib.Path(sys.argv[2]) / 'supabase/functions/ai-chat-v2/evidence_sha256.json'
shutil.copyfile(source, destination)
print(f'Exported {len(values)} evidence fingerprints to {destination}')
fixture = re.search(r'AI_REQUEST_FIXTURE (.+)', log)
if fixture:
    print(f'Cross-language fixture: {fixture[1]}')
PY
