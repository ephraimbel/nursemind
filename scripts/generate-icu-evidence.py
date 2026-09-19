#!/usr/bin/env python3
"""Render the ICU review batch. --check verifies generated files without writing."""
import argparse
import json
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CURATION = ROOT / 'content/curation/icu-evidence'
SAMPLES = ROOT / 'Packages/NursemindCore/Sources/NursemindCore/Content/Samples'
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('--check', action='store_true')
args = parser.parse_args()
sources = json.loads((CURATION / 'sources.json').read_text())
entries = json.loads((CURATION / 'entries.json').read_text())
source_keys = {s['id'].removeprefix('icu_evidence_'): s for s in sources}

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

def attributed(block):
    ids = ', '.join(quote(source_keys[key]['id']) for key in block['sources'])
    return '.init(' + quote(block['text']) + ', citationIDs: [' + ids + '])'

def source_list(entry):
    keys = list(dict.fromkeys(key for block in blocks(entry) for key in block['sources']))
    return '[' + ', '.join('ICUEvidenceSources.' + key for key in keys) + ']'

def block_array(items):
    return '[\n' + ',\n'.join('            ' + attributed(b) for b in items) + '\n        ]'

seen = set()
for entry in entries:
    identity = entry['kind'] + ':' + entry['id']
    assert identity not in seen, identity
    seen.add(identity)
    assert entry['reviewStatus'] == 'pending-independent-RN-review'
    for block in blocks(entry):
        assert block['text'].strip() and block['sources'], identity
        assert set(block['sources']) <= source_keys.keys(), identity
    assert len(entry['links']) == len(set(entry['links'])), identity

source_swift = 'import Foundation\n\n#if DEBUG && ICU_EVIDENCE_REVIEW\nenum ICUEvidenceSources {\n'
for key, source in source_keys.items():
    source_swift += '    static let ' + key + ' = CitationSource(\n'
    fields = ['id', 'shortName', 'detail', 'publisher', 'license', 'url', 'lastRetrieved']
    source_swift += ',\n'.join('        ' + f + ': ' + ('.' + source[f] if f == 'license' else quote(source[f])) for f in fields)
    source_swift += '\n    )\n\n'
source_swift += '}\n#endif\n'

entry_swift = 'import Foundation\n\n// Tier A drafts are excluded from Release until independent clinical review.\nenum ICUEvidenceDrafts {\n    static let entries: [LibraryEntry] = {\n#if DEBUG && ICU_EVIDENCE_REVIEW\n        return [\n'
entry_swift += ',\n'.join('            .' + e['kind'] + '(entry' + str(i) + ')' for i, e in enumerate(entries))
entry_swift += '\n        ]\n#else\n        return []\n#endif\n    }()\n\n#if DEBUG && ICU_EVIDENCE_REVIEW\n'
for i, entry in enumerate(entries):
    kind = entry['kind']
    model = {'drug': 'DrugEntry', 'diagnosis': 'DiagnosisEntry', 'reference': 'ReferenceEntry'}[kind]
    fields = [('id', quote(entry['id'])), ('title', quote(entry['title'])), ('subtitle', quote(entry['subtitle']))]
    if kind == 'drug':
        fields += [('category', quote(entry['category'])), ('isHighAlert', str(entry['isHighAlert']).lower()), ('isHighRisk', str(entry['isHighRisk']).lower()), ('quickReference', '[]'), ('indications', attributed(entry['indications'])), ('mechanism', attributed(entry['mechanism'])), ('dosing', '[]'), ('contraindications', attributed(entry['contraindications'])), ('warnings', block_array(entry['warnings'])), ('adverseReactions', attributed(entry['adverseReactions'])), ('drugInteractions', block_array(entry['drugInteractions']))]
    else:
        if kind == 'reference':
            fields.append(('eyebrow', quote('REFERENCE · ICU EVIDENCE')))
        fields.append(('nclexTags', '.init(category: .physiologicalIntegrity, subcategory: .physiologicalAdaptation, priorityConcept: .' + entry['concept'] + ')'))
        if kind == 'reference':
            sections = ['.bullets(title: ' + quote(s['title']) + ', ' + block_array(s['blocks']) + ')' for s in entry['sections']]
            fields.append(('sections', '[\n            ' + ',\n            '.join(sections) + '\n        ]'))
        else:
            for key in ['definition', 'pathophysiology', 'presentation', 'diagnosticCriteria', 'priorityAssessments', 'commonInterventions', 'watchFor']:
                if key in entry:
                    fields.append((key, block_array(entry[key]) if isinstance(entry[key], list) else attributed(entry[key])))
    fields += [('citations', source_list(entry)), ('lastSourceFidelityReview', quote(entry['sourceFidelityCheckedOn']))]
    entry_swift += '    private static let entry' + str(i) + ' = ' + model + '(\n'
    entry_swift += ',\n'.join('        ' + k + ': ' + v for k, v in fields)
    entry_swift += '\n    )\n\n'
entry_swift += '#endif\n}\n'

links = set()
for e in entries:
    identity = e['kind'] + ':' + e['id']
    for target in e['links']:
        assert identity != target
        links.add(tuple(sorted([identity, target])))
link_swift = 'import Foundation\n\nextension EntryLinkRegistry {\n    static func icuEvidenceDraftLinks() -> [EntryLink] {\n#if DEBUG && ICU_EVIDENCE_REVIEW\n        return [\n'
link_swift += ',\n'.join('            .init(from: ' + quote(a) + ', to: ' + quote(b) + ', relation: .seeAlso)' for a,b in sorted(links))
link_swift += '\n        ]\n#else\n        return []\n#endif\n    }\n}\n'
collections = [
    ('icu-airway-evidence', 'Airway & ventilation evidence', 'Preoxygenation, intubation, extubation & ARDS', [e for e in entries if e.get('concept') == 'gasExchange']),
    ('icu-organ-support-evidence', 'ICU organ support evidence', 'Shock, kidney support, bleeding prevention & sedation', [e for e in entries if e['kind'] != 'drug' and e.get('concept') != 'gasExchange']),
    ('icu-drug-evidence', 'ICU drug evidence', 'Drug labels, trial context & monitoring limits', [e for e in entries if e['kind'] == 'drug'])
]
topic_swift = 'import Foundation\n\nextension LibraryTopic {\n    static var icuEvidenceDraftCollections: [LibraryTopic] {\n#if DEBUG && ICU_EVIDENCE_REVIEW\n        return [\n'
for slug,title,subtitle,items in collections:
    topic_swift += '            .init(id: ' + quote(slug) + ', group: .criticalCare, title: ' + quote(title) + ',\n                  subtitle: ' + quote(subtitle) + ',\n                  entryIDs: [' + ', '.join(quote(e['kind']+':'+e['id']) for e in items) + ']),\n'
topic_swift += '        ]\n#else\n        return []\n#endif\n    }\n}\n'
files = {
    SAMPLES / 'ICUEvidenceSources.swift': source_swift,
    SAMPLES / 'ICUEvidenceEntries.swift': entry_swift,
    SAMPLES.parent / 'Links/ICUEvidenceLinks.swift': link_swift,
    SAMPLES.parent / 'ICUEvidenceTopics.swift': topic_swift
}
for path, text in files.items():
    if args.check:
        assert path.read_text() == text, 'Generated output differs: ' + str(path)
    else:
        path.write_text(text)
print(('Verified' if args.check else 'Generated') + f' {len(entries)} entries, {len(sources)} sources, {len(links)} related-entry pairs and {len(collections)} collections.')
