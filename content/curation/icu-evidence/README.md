# ICU evidence review batch — 2026-09-19

16 new entries: 3 drug safety/pharmacology entries, 2 disease entries and 11 focused evidence guides. The batch contains 4,800 words across 123 cited content blocks, supported by 30 source records, including 17 original trial papers, primary drug labels, CDC material and professional-society guidance. These counts describe this batch, not the entire library.

The registry audit found gaps in terlipressin, remimazolam, sulbactam–durlobactam, HRS-AKI and resistant Acinetobacter infection, plus focused appraisal of major ICU trials. Existing ARDS, septic shock, AKI, ventilation and common-sedative entries are connected through related links. Three ICU collections and 43 unique, bidirectional related-entry pairs make the additions navigable in the review build.

## Publication status

Every entry is a Tier A draft with **independent RN review pending**. `sourceFidelityCheckedOn` records source checking, not clinical approval. No clinical reviewer is claimed.

`AGENTS.md` requires “Tier A (paid RN review pre-publication) for high-alert drugs, peds, emergencies.” This batch is intentionally grouped behind a single review boundary. It is included only when **both** `DEBUG` and `ICU_EVIDENCE_REVIEW` are defined. Normal Debug, ordinary evidence-export runs and Release omit its entries, collections and links. Production title and AI evidence manifests were not updated by this task.

The three drug entries preserve selected label text, including the two applicable boxed warnings. They are safety/pharmacology drafts, **not complete administration monographs**: dosing, renal adjustments, dilution/preparation and unsupported OER nursing/teaching sections are intentionally omitted and recorded per entry. Drug pages omit the empty dosing section and navigation target. Completing those sections and independently reviewing the high-risk content are prerequisites to removing the publication boundary.

## Content

| Entry | Category | Body words |
| --- | --- | ---: |
| Preoxygenation & peri-intubation oxygenation | reference | 250 |
| First-attempt intubation evidence | reference | 245 |
| High-risk extubation & preventive support | reference | 251 |
| ARDS treatment evidence | reference | 255 |
| Sepsis fluid strategy evidence | reference | 287 |
| Corticosteroids in septic shock | reference | 267 |
| AKI & timing of kidney support | reference | 293 |
| Stress ulcer prophylaxis in the ICU | reference | 244 |
| Dexmedetomidine & propofol evidence | reference | 268 |
| Remimazolam procedural sedation evidence | reference | 282 |
| Hepatorenal syndrome–AKI | diagnosis | 319 |
| Terlipressin | drug | 470 |
| Remimazolam | drug | 379 |
| Sulbactam–durlobactam | drug | 418 |
| Carbapenem-resistant Acinetobacter infection | diagnosis | 321 |
| CRAB treatment evidence: ATTACK | reference | 251 |

## Sources and fidelity

- `entries.json` is the canonical authored content and per-block citation map; `sources.json` holds stable citation IDs, exact URLs, locators, publishers, use basis and retrieval dates.
- `audit.json` records counts, source-attributed word totals and SHA-256 digests of the three retrieved DailyMed label pages.
- Label sentences were matched against the downloaded structured labels after whitespace normalization and removal of internal label cross-references; no unmatched drug-label sentences remained. ISMP classification wording is separately attributed.
- Copyrighted studies and guidelines are represented by brief, original factual summaries tagged `factCitationOnly`, not reproduced articles, tables or algorithms. Each such source contributes at most 200 body words across this batch. No PMC-hosted article is assumed to be public domain merely because it appears in PMC.
- Current framing includes SSC 2026, IDSA AMR guidance 2026, PADIS 2025, ATS ARDS 2024 and SCCM/ASHP stress-ulcer guidance 2024. Historical trial years remain explicit.
- Trial summaries distinguish primary and secondary outcomes, study population, denominator and statistical uncertainty. Examples include prevention versus rescue after extubation, noninferiority versus superiority in ATTACK, and kidney reversal versus survival in CONFIRM.
- The HRS-AKI diagnosis uses ADQI/ICA 2024 criteria rather than carrying forward a mandatory 48-hour albumin challenge. Remimazolam procedural evidence is not represented as approval for continuous ICU sedation.

## Reproduce

From the repository root:

```sh
python3 scripts/generate-icu-evidence.py
python3 scripts/generate-icu-evidence.py --check
```

The generator writes only the four ICU evidence Swift files. Keep edits in the JSON files and regenerate. The three integration changes live in the existing critical-care helpers; no parent-thread bedside content is modified.

For a local review build, add the following Xcode argument while preserving package-defined conditions:

```sh
'OTHER_SWIFT_FLAGS=$(inherited) -DICU_EVIDENCE_REVIEW'
```

Do not override `SWIFT_ACTIVE_COMPILATION_CONDITIONS`: package dependencies require their own definitions. The dedicated simulator is `NurseMind ICU Evidence Sep19` (`173B93A6-96E7-4691-9160-5338A3B970BD`).

## Validation

- Generator reproducibility, unique new IDs, resolved related-entry endpoints and source-word accounting passed.
- Review-build simulator tests: **27 tests in 5 suites passed**, including parameterized coverage of all 16 new entries, drug safety flags, collection navigation, citation integrity and related-entry validity. After the final metadata and empty-dosing rendering changes, the ICU suite passed again (3 parameterized test functions covering the whole batch).
- Compiling the actual gated entry/source/collection/link files in an isolated Swift harness verified empty outputs for ordinary Debug and for a non-Debug build even when the review flag is supplied. This harness checks the compile-time publication boundary; it is not a full Release app test.
- Review app build succeeded. On the dedicated iPhone 17 Pro simulator, the preoxygenation guide, terlipressin drug page and resistant Acinetobacter disease page rendered with their citations and readable layouts. The drug jump row correctly omits the unpopulated dosing target. Screenshots are in `docs/audit-assets/2026-09-19/icu-evidence/`.
- Current shared production title/evidence-hash files were checked and contain none of this batch’s candidate IDs. Full Release app execution was not performed.

Review checkpoints before publication: independent RN assessment of clinical accuracy and omissions, primary-label dosing/preparation completeness for any intended administration reference, copyright/use-basis confirmation, current guideline reconciliation, and an explicit approved-content update before changing the gate or exporting production evidence.
