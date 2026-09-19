#!/usr/bin/env python3
"""Generate the opt-in common-conditions batch; --check detects content drift."""
import argparse
import csv
import io
import json
from collections import Counter
from pathlib import Path
from urllib.parse import urlparse

ROOT = Path(__file__).resolve().parents[1]
CURATION = ROOT / 'content/curation/common-conditions'
CONTENT = ROOT / 'Packages/NursemindCore/Sources/NursemindCore/Content'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--check', action='store_true')
args = parser.parse_args()
entries = json.loads((CURATION / 'entries.json').read_text())
sources = json.loads((CURATION / 'sources.json').read_text())
source_keys = {s['id'].removeprefix('common_conditions_'): s for s in sources}


def quote(value):
    return json.dumps(value, ensure_ascii=False)


def blocks(value):
    if isinstance(value, dict):
        if 'text' in value and 'sources' in value:
            yield value
        else:
            for child in value.values():
                yield from blocks(child)
    elif isinstance(value, list):
        for child in value:
            yield from blocks(child)


def ids(block):
    return '[' + ', '.join(quote(source_keys[k]['id']) for k in block['sources']) + ']'


def attributed(block):
    return '.init(' + quote(block['text']) + ', citationIDs: ' + ids(block) + ')'


def array(items):
    return '[\n' + ',\n'.join('            ' + attributed(b) for b in items) + '\n        ]' if items else '[]'


assert len(source_keys) == len(sources)
identities = {e['kind'] + ':' + e['id'] for e in entries}
assert len(identities) == len(entries)
usage = Counter()
for e in entries:
    assert e['reviewStatus'] == 'pending-independent-clinical-review'
    assert e['reviewTier'] == 'A'
    assert e['category'] in ['physiologicalIntegrity', 'healthPromotion']
    assert e['subcategory'] in ['reductionOfRiskPotential', 'basicCareAndComfort', 'healthPromotion']
    assert (e['category'] == 'healthPromotion') == (e['subcategory'] == 'healthPromotion')
    assert e['topics'] and e['links']
    assert len(e['links']) == len(set(e['links']))
    assert sum(len(b['text'].split()) for b in blocks(e)) >= 350
    for b in blocks(e):
        assert b['text'].strip() and b['sources']
        assert set(b['sources']) <= source_keys.keys()
        for k in b['sources']:
            usage[k] += len(b['text'].split())
for k,s in source_keys.items():
    assert s['license'] in ['publicDomain', 'ccBy4', 'factCitationOnly']
    assert s['lastRetrieved'] == '2026-09-19'
    assert urlparse(s['url']).scheme == 'https'
    assert urlparse(s['url']).path.strip('/') and not urlparse(s['url']).query.startswith('term=')
    assert usage[k] == s['attributedBodyWords'] and 0 < usage[k] <= 200

source_swift = 'import Foundation\n\n#if DEBUG && COMMON_CONDITIONS_REVIEW\nenum CommonConditionsSources {\n'
for k,s in source_keys.items():
    source_swift += '    static let ' + k + ' = CitationSource(\n'
    source_swift += ',\n'.join('        '+f+': '+('.'+s[f] if f=='license' else quote(s[f])) for f in ['id','shortName','detail','publisher','license','url','lastRetrieved'])
    source_swift += '\n    )\n\n'
source_swift += '}\n#endif\n'

swift = 'import Foundation\n\n// Publication requires independent clinical review; the opt-in flag is for local review only.\nenum CommonConditionsDrafts {\n    static let entries: [LibraryEntry] = {\n#if DEBUG && COMMON_CONDITIONS_REVIEW\n        return [\n'
swift += ',\n'.join('            .'+e['kind']+'(entry'+str(i)+')' for i,e in enumerate(entries))
swift += '\n        ]\n#else\n        return []\n#endif\n    }()\n\n    static func entryIDs(for topic: String) -> [String] {\n#if DEBUG && COMMON_CONDITIONS_REVIEW\n        switch topic {\n'
topics = sorted({t for e in entries for t in e['topics']})
for t in topics:
    swift += '        case '+quote(t)+': return '+quote([e['kind']+':'+e['id'] for e in entries if t in e['topics']])+'\n'
swift += '        default: return []\n        }\n#else\n        return []\n#endif\n    }\n\n#if DEBUG && COMMON_CONDITIONS_REVIEW\n'
for i,e in enumerate(entries):
    kind=e['kind']
    fields=[('id',quote(e['id'])),('title',quote(e['title'])),('subtitle',quote(e['subtitle']))]
    if kind=='reference':
        fields.append(('eyebrow',quote('REFERENCE · COMMON CONDITIONS')))
    fields.append(('nclexTags','.init(category: .'+e['category']+', subcategory: .'+e['subcategory']+', priorityConcept: .'+e['concept']+')'))
    if kind=='diagnosis':
        for key in ['definition','pathophysiology']:
            fields.append((key,attributed(e[key])))
        for key in ['presentation','diagnosticCriteria','priorityAssessments','commonInterventions','watchFor']:
            fields.append((key,array(e[key])))
    elif kind=='reference':
        sections=['.bullets(title: '+quote(s['title'])+', '+array(s['blocks'])+')' for s in e['sections']]
        fields.append(('sections','[\n            '+',\n            '.join(sections)+'\n        ]'))
    else:
        raise ValueError('Unsupported category: '+kind)
    keys=list(dict.fromkeys(k for b in blocks(e) for k in b['sources']))
    fields += [('citations','['+', '.join('CommonConditionsSources.'+k for k in keys)+']'),('lastSourceFidelityReview',quote(e['sourceFidelityCheckedOn']))]
    model={'diagnosis':'DiagnosisEntry','reference':'ReferenceEntry'}[kind]
    swift += '    private static let entry'+str(i)+' = '+model+'(\n'+',\n'.join('        '+k+': '+v for k,v in fields)+'\n    )\n\n'
swift += '#endif\n}\n'

pairs=sorted({tuple(sorted([e['kind']+':'+e['id'],t])) for e in entries for t in e['links']})
assert all(a!=b for a,b in pairs)
link_swift='import Foundation\n\nextension EntryLinkRegistry {\n    static func commonConditionsDraftLinks() -> [EntryLink] {\n#if DEBUG && COMMON_CONDITIONS_REVIEW\n        return [\n'
link_swift+=',\n'.join('            .init(from: '+quote(a)+', to: '+quote(b)+', relation: .seeAlso)' for a,b in pairs)
link_swift+='\n        ]\n#else\n        return []\n#endif\n    }\n}\n'
queue=io.StringIO()
w=csv.writer(queue,lineterminator='\n')
w.writerow(['entry_id','title','tier','status','reviewer','reviewed_on','source_fidelity_checked_on','review_focus'])
for e in entries:
    focus='Source fidelity, adult scope, clinical thresholds, recognition and escalation, medication boundaries, current guideline and trial context; clinician review required'
    w.writerow([e['kind']+':'+e['id'],e['title'],'A',e['reviewStatus'],'','',e['sourceFidelityCheckedOn'],focus])
files={CONTENT/'Samples/CommonConditionsSources.swift':source_swift,CONTENT/'Samples/CommonConditionsEntries.swift':swift,CONTENT/'Links/CommonConditionsLinks.swift':link_swift,CURATION/'review-queue.csv':queue.getvalue()}
for path,body in files.items():
    if args.check:
        assert path.read_text()==body,'Generated output differs: '+str(path)
    else:
        path.write_text(body)
print(('Verified' if args.check else 'Generated')+f' {len(entries)} drafts, {len(sources)} sources, {len(pairs)} related pairs, {len(topics)} topic integrations; '+str(sum(len(b['text'].split()) for e in entries for b in blocks(e)))+' body words.')
