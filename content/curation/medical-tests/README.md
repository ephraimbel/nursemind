# NLM specialty reference batch

This selection adds NLM-authored patient education for diagnostic tests and inherited conditions. It does not supply nurse-authored protocols, prescribing advice, or a declaration that a specialty is complete.

`selection.json` is the explicit source allowlist, collection assignment, related-entry curation and pending clinical-review queue. The reviewed source domains are limited to `medlineplus.gov/lab-tests/` and `medlineplus.gov/genetics/condition/`. Existing drug, lab, procedure and diagnosis entries were compared before selection; common overlapping tests and the existing MEN-1/MEN-2 diagnoses were excluded.

MedlinePlus expressly permits reproduction of its NLM-authored medical-test information and genetics summaries as public-domain content with attribution. See [NLM's reuse policy](https://medlineplus.gov/about/using/usingcontent/). This permission does not extend to A.D.A.M. encyclopedia content, ASHP drug monographs, external linked material or uncredited images. None of those are imported.

Each saved source snapshot contains the original NLM section wording, direct URL, displayed source update date (or an explicit missing-date label), retrieval date, source HTML SHA-256 and attribution. Whitespace, list formatting and two explicitly handled labeled-table layouts are adapted. Two explicitly recorded test-anxiety copy edits correct a typo and remove a repeated introduction at display time; the original snapshot is retained and the in-app citation discloses the edits. Bibliographies, resource directories and images are excluded. The original source remains accessible through the citation in the reader.

## Reproduce and verify

Generation from checked-in snapshots uses the Python standard library. Fetching and source comparisons additionally need the pinned package in `scripts/requirements-content.txt`.

```sh
python3 -m venv /tmp/nursemind-content-tools
/tmp/nursemind-content-tools/bin/pip install -r scripts/requirements-content.txt
python3 scripts/import-medlineplus-references.py --check
/tmp/nursemind-content-tools/bin/python scripts/test_medlineplus_import.py
/tmp/nursemind-content-tools/bin/python scripts/import-medlineplus-references.py --verify-sources --check
```

`--fetch` fetches only missing selected snapshots and generates Swift. `--verify-sources` refetches the exact selected pages, verifies preservation of source text outside the separately checked tables, and compares titles, dates and every section with the stored snapshots. It fails on source drift instead of overwriting the existing reference. Source date and retrieval date are different fields. A source's HTML hash records the retrieved document; the comparison uses clinical-body text so unrelated site chrome does not trigger an update.

The generated `MedlinePlus*References.swift`, `MedlinePlusBundledEntries.swift`, `MedlinePlusTopics.swift` and `MedlinePlusReferenceLinks.swift` files are bundled offline. Edit the selection or reviewed snapshot, then regenerate; do not manually edit generated Swift. The registration is called from `BundledEntries.swift`; the 14 collections are appended to `LibraryTopic.all`. `scripts/propose-links.py` understands both registration files.

## September 17 topic-icon expansion

Eight additional test and screening guides add fall-risk assessment, H. pylori testing, CMV testing, bone-marrow testing, obesity and vision screening, opioid testing and TCA screening. These supplement the existing concise lab, procedure and nursing-care entries through 12 related links. The selection manifest identifies this batch as `2026-09-17-topic-icons`. All eight source pages were refetched and compared with their snapshots.

## Review boundary

All 215 entries remain **pending independent clinical review** in the manifest. Pediatric/family, prenatal/reproductive, inherited-condition and suicide-screening material is conservatively assigned Tier A; the remaining batch is assigned Tier B. These assignments are a review queue, not clinical approval. No medication-dose protocol was added. The retrieval/source-fidelity date does not assert RN review, and this distinction is retained in every citation's details.

Before production publication, complete the applicable review required by the current engineering brief, including source currency and clinical limitations. Patient-facing language and original source recommendations must not be presented as patient-specific nursing orders. This local batch does not change production content, the AI provider, entitlements or calculator availability.
