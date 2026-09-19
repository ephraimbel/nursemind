#!/usr/bin/env python3
"""Compare the review-build Swift export with every authored field and citation."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CURATION = ROOT / 'content/curation/recent-evidence'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('test_log', type=Path)
parser.add_argument('--output', type=Path)
args = parser.parse_args()
entries = json.loads((CURATION / 'entries.json').read_text())
sources = json.loads((CURATION / 'sources.json').read_text())
source_keys = {s['id'].removeprefix('recent_evidence_'): s for s in sources}
log = args.test_log.read_text()


def extract(marker):
    offset = log.index(marker) + len(marker)
    return json.JSONDecoder().raw_decode(log[offset:])[0]


def blocks(v):
    if isinstance(v, dict):
        if 'text' in v and 'sources' in v:
            yield v
        else:
            for child in v.values():
                yield from blocks(child)
    elif isinstance(v, list):
        for child in v:
            yield from blocks(child)


def attributed(b):
    return dict(text=b['text'], citationIDs=[source_keys[k]['id'] for k in b['sources']])


expected = []
for e in entries:
    v = {k: e[k] for k in ['id', 'title', 'subtitle']}
    if e['kind'] == 'drug':
        v.update({k: e[k] for k in ['category', 'isHighAlert', 'isHighRisk']})
        v.update(quickReference=[], dosing=[])
        for k in ['indications', 'mechanism', 'contraindications', 'adverseReactions']:
            v[k] = attributed(e[k])
        for k in ['warnings', 'drugInteractions']:
            v[k] = [attributed(b) for b in e[k]]
    else:
        v['nclexTags'] = dict(category='physiologicalIntegrity', subcategory='reductionOfRiskPotential', priorityConcept=e['concept'])
        if e['kind'] == 'reference':
            v['eyebrow'] = 'REFERENCE · STUDY EVIDENCE'
            v['sections'] = [{'bullets': {'title': s['title'], '_1': [attributed(b) for b in s['blocks']]}} for s in e['sections']]
        else:
            v.update(specimen=e['specimen'], referenceRanges=[], interpretationTiers=[])
            v['commonCauses'] = [dict(title=s['title'], causes=[b['text']], citationIDs=attributed(b)['citationIDs']) for s in e['context'] for b in s['blocks']]
            for k in ['nursingActions', 'watchFor']:
                v[k] = [attributed(b) for b in e[k]]
    keys = list(dict.fromkeys(k for b in blocks(e) for k in b['sources']))
    v['citations'] = [{f: source_keys[k][f] for f in ['id', 'shortName', 'detail', 'publisher', 'license', 'url', 'lastRetrieved']} for k in keys]
    v['lastSourceFidelityReview'] = e['sourceFidelityCheckedOn']
    expected.append({e['kind']: {'_0': v}})
actual = extract('NM-RECENT-EVIDENCE:')
assert len(actual) == len(expected)
for a, e in zip(actual, expected):
    assert a == e, 'Compiled entry differs: ' + str(e)
audit = extract('NM-RECENT-AUDIT:')
selected_ids = {e['kind']+':'+e['id'] for e in entries}
selected = [r for r in audit if r['id'] in selected_ids]
assert len(selected) == len(entries)
for r in selected:
    assert not r['uncitedBlocks'] and not r['unresolvedCitationIDs'] and not r['sourceLocatorIssues'], r['id']
    e = next(e for e in entries if e['kind']+':'+e['id'] == r['id'])
    assert set(e['topics']) <= set(r['topicIDs']), r['id']
if args.output:
    args.output.mkdir(parents=True, exist_ok=True)
    (args.output/'compiled-drafts.json').write_text(json.dumps(actual, ensure_ascii=False, indent=2)+'\n')
    (args.output/'entries.json').write_text(json.dumps(audit, ensure_ascii=False, indent=2)+'\n')
print(f'Exact match: {len(actual)} compiled entries and all cited blocks, fields, source records and topic memberships. Review-build registry: {len(audit)} entries.')
