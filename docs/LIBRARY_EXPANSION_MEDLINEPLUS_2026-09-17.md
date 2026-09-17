# Specialty reference expansion — September 17, 2026

Added **207 references across 14 new collections**: 173 medical-test/patient-education guides and 34 inherited-condition references. The additions contain **1,488 sections and 229,306 displayed body words**, backed by 207 direct NLM source pages. Word count describes size, not clinical quality.

Combined compiled catalog: **2,015 total entries / 555 general-reference articles**. This includes the other task’s 14 cross-specialty daily-care guides; this pass itself adds 207. The Library now has **46 collections / 649 memberships / 552 distinct topic-assigned entries**. The remaining 1,463 entries remain available through A–Z and search. No existing entry was removed.

| Collection | Added guides | Sections | Body words |
|---|---:|---:|---:|
| Cancer testing & genetics | 15 | 116 | 17,979 |
| Neurologic, hearing & balance tests | 12 | 92 | 16,166 |
| Behavioral health screening | 8 | 59 | 10,316 |
| Digestive diagnostic tests | 15 | 116 | 18,415 |
| Reproductive & prenatal testing | 19 | 146 | 23,490 |
| Infection testing | 26 | 198 | 33,385 |
| Hormone & metabolic testing | 16 | 124 | 17,230 |
| Urine & urinary tract testing | 13 | 101 | 12,160 |
| Blood cell & clotting tests | 13 | 100 | 12,077 |
| Cardiac, pulmonary & imaging tests | 11 | 84 | 13,293 |
| Allergy & autoimmune testing | 5 | 38 | 6,155 |
| Diagnostic panels & examinations | 10 | 71 | 10,918 |
| Child & family screening | 10 | 73 | 12,689 |
| Inherited conditions | 34 | 170 | 25,033 |

## Content and source boundaries

Each guide retains NLM source sections: medical-test purpose, indications, preparation, procedure, risks, result limitations and additional context wherever supplied; inherited-condition descriptions, frequency, causes, inheritance and alternate names. They are labeled NLM patient education. This material supplements nursing diagnoses/procedures and does not add patient-specific orders or independent nursing protocols. All 207 new references have explicit topic membership; 66 curated related-entry edges connect selected guides to relevant existing material and one another.

MedlinePlus explicitly identifies its NLM-authored medical-test information and genetics summaries as public domain and requests attribution. The in-app citation includes the requested credit, exact source URL, displayed source update date, retrieval date, license, formatting changes and a statement distinguishing structural source-fidelity checks from independent clinical review. [NLM reuse policy](https://medlineplus.gov/about/using/usingcontent/). A.D.A.M., ASHP drug content, external linked material, images and resource directories are excluded.

Original source snapshots and HTML hashes are retained under `content/source-snapshots/medlineplus-tests/`. The explicit source selection, topic/link assignments, review tier and two narrowly recorded copy edits are in `content/curation/medical-tests/selection.json`. The original test-anxiety snapshot is preserved; display corrects “medical text” to “medical test” and removes one duplicated introduction. The citation discloses those edits. A general tumor-marker page was excluded after finding overlap and a mislabeled beta-2 microglobulin table; the dedicated B2M guide was retained. Existing MEN-1/MEN-2 articles were also excluded from additions.

## Verification

- All 207 original-source pages were refetched. Every source title, displayed date and section matched the saved snapshots after an importer fix restored nested VNG test details. The parser checks preservation of source text outside two explicitly handled labeled-table layouts and fails closed on unsupported structures or source drift.
- Eight importer tests pass, including license-path boundaries, nested lists, list-adjacent prose, preservation of column labels, exclusion of third-party/navigation areas and copy-edit drift detection. Offline regeneration is deterministic.
- All 207 generated entries have resolved per-section citation IDs and direct source links. No new normalized-title duplicates were introduced.
- 22 targeted simulator tests across four suites pass, including 207-case citation and search/topic checks, source-limit preservation, full-catalog integrity and bidirectional related links. Two compiled-registry audit tests also pass.
- Simulator app build succeeds. HER2, Alport and child-test-preparation readers were visually inspected. The HER2 citation opens its exact NLM page; source attribution and the clinical-review distinction are visible in the Alport footer. Child-preparation → test-anxiety navigation works. Final UI checks also verified the corrected test-anxiety text, Cancer testing & genetics collection, and normal free-tier Library home displaying 2,015 entries. Evidence is under `docs/audit-assets/2026-09-17/medlineplus/`.
- Full catalog audit: `docs/library-audit/2026-09-17-medlineplus/`. The unchanged legacy signals remain 1,063 entries with root/search source URLs and 756 with blocks lacking attached citation IDs; these are structural triage signals, not clinical adjudication.

## Review and publication status

All 207 additions remain **pending independent clinical review**: 64 conservatively assigned Tier A, 143 Tier B. See `content/curation/medical-tests/review-queue.csv`; the whole-library heuristic does not replace this explicit queue. Source fidelity is not clinical sign-off.

Crossing 2,000 entries is a catalog milestone, not evidence that every nursing topic is complete. The next priority remains credentialed review, source-specific ICU/bedside depth, the existing citation-quality queue, and remaining topic assignments. These are local bundled-content changes; no production publication, AI-provider change or calculator-gate change was made.

Importer and reproduction instructions: `content/curation/medical-tests/README.md`.
