# Bedside evidence expansion — 2026-09-19

The audited library snapshot grew from 2,139 to **2,147 entries**, including 674 general references. Concurrent work after this snapshot can increase the shared total further. Eight study-backed guides and four expanded daily-care references add **84 cited blocks / 3,175 body words**. Twenty specific source records include 12 research reports. All additions remain pending independent clinical review; no production deployment occurred.

## Gaps selected

The compiled baseline showed broad condition coverage but uneven source specificity, bedside depth and discoverability. Entry count alone does not establish completeness or clinical quality.

1. **Claim-level source quality:** 1,059 entries cite at least one search URL or site root; 752 have at least one block without an attached citation ID. These are structural signals, not findings that all affected content is unsupported: some quick-reference rows cannot carry IDs in the current model. This batch does not clear that legacy backlog.
2. **Thin daily-care coverage:** mobility, nutrition, sleep and oral-care references contained only 142–164 body words. The additions provide study context and the boundaries of the findings.
3. **Evidence behind common workflows:** delirium prevention, falls, repositioning, hydration with dysphagia, discharge communication, teach-back, medication reconciliation and follow-up calls benefit from explicit distinctions between a trial result, a toolkit recommendation and an individual care plan.
4. **Findability:** every new guide is in an existing topic collection, has three related references, and is available through title search and AI evidence retrieval. Added 11 topic memberships and 24 related links. The library now has 701 distinct entries in selected topic collections; 1,446 remain outside those collections but are available through the registry.

## New guides

| Guide | Cited blocks | Body words |
|---|---:|---:|
| Delirium prevention on adult wards | 9 | 336 |
| Inpatient falls: individualized prevention | 7 | 254 |
| Pressure injury prevention: repositioning context | 9 | 336 |
| Dysphagia: hydration and thickened fluids | 8 | 306 |
| Discharge communication: a usable transition plan | 9 | 329 |
| Teach-back and show-me: checking understanding | 9 | 330 |
| Medication reconciliation across transitions | 9 | 329 |
| Post-discharge calls: follow-up and evidence | 8 | 312 |

## Existing references expanded

| Reference | Before | After | Added |
|---|---:|---:|---:|
| Bedside mobility assessment | 142 | 306 | 164 |
| Bedside nutrition assessment | 159 | 318 | 159 |
| Hospital oral care | 164 | 328 | 164 |
| Hospital sleep support | 153 | 309 | 156 |

Word counts describe content size; they are not quality scores. The studies were selected for these specific nursing questions, not as proof of complete topic coverage.

## How evidence is represented

Each guide distinguishes the population studied, measured outcome and limitations from practical reference guidance. Examples include non-ICU delirium prevention rather than established-delirium treatment; nursing-home repositioning with specified support surfaces rather than a universal hospital interval; hydration rather than pneumonia outcomes in dysphagia; medication discrepancies rather than assumed reductions in patient harm; and post-discharge telephone contact without an unsupported readmission guarantee.

Research and guidance sources, exact appended text, license treatment and citation mappings are preserved in [the curation manifest](../content/curation/bedside-evidence/manifest.json). [The curation README](../content/curation/bedside-evidence/README.md) lists all 20 source links and reuse boundaries. Sources include Cochrane, JAMA, Age and Ageing, BMJ Quality & Safety, PLOS, a VA evidence synthesis, Open RN, AHRQ and NLM. Selected research dates to 2019–2024; this is not an exhaustive literature review through the present date.

## Validation

- 23 targeted simulator tests passed across five suites: batch mapping/retrieval, topic navigation, related links, content integrity and citation resolution.
- Four index/audit tests passed across three suites; export contains 2,147 entries and 42,923 evidence fingerprints.
- The manifest comparison verified all 12 compiled entries, every added block and all 20 source records against the editorial record. Each block carries a resolvable citation.
- The exported Swift request passed the TypeScript server evidence contract check against the local fingerprint manifest.
- Final iOS app build passed. Simulator inspection covered the delirium, pressure-injury and oral-care readers, including the new oral-care study section; the TEAM-UP citation launched PMC in Safari. [Screenshots](audit-assets/2026-09-19/bedside-evidence/) preserve representative views.
- A final focused run passed seven tests: all four content-batch checks plus three library-history queue regression checks. The manifest comparison also passed again on that compiled output.
- The full-library [compiled audit](library-audit/2026-09-19-bedside-evidence/summary.md) records the unchanged legacy gaps and the exact before/after additions.

## Simulator-discovered reliability fix

The first QA launch crashed while flushing saved library-view history: `LibraryViewLogger.flushOfflineQueue()` called `removeFirst(snapshot.count)` after another flush had already consumed that batch. The logger now permits one flush at a time and removes only successfully sent records, preserving new records even if the queue reached its capacity during the network request. Regression checks cover overlapping flushes, capacity eviction and retry after failure. This does not change what is logged.

## Release and next work

Two Tier A and ten Tier B review assignments remain open in [the review queue](../content/curation/bedside-evidence/review-queue.csv). The manifest is not a runtime gate: this local batch is compiled into the app and requires release control before production. Source-fidelity and automated checks do not replace credentialed clinical review. Existing whole-entry review dates were preserved for the four expanded references.

The highest-value next pass is replacing generic legacy citations with claim-specific sources, starting with high-alert, pediatric and emergency material, while completing the independent review queue. Continue depth work from actual bedside questions and measured coverage; the current count does not substantiate a “largest medical library” claim.
