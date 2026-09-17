# Cross-category library expansion — September 17, 2026

Added **13 entries** and improved **3 existing entries** across all eight Library categories. The new entries contain **4,770 body words**. This pass maps **151 authored/revised blocks to 22 specific primary sources**, adds **39 related-entry edges** and **44 memberships in existing topic collections**.

| Category | Entry | Change | Final body words |
|---|---|---|---:|
| drug | Cefiderocol | New | 638 |
| drug | Ceftazidime–avibactam | New | 668 |
| drip | Angiotensin II infusion | New | 471 |
| drip | Cangrelor infusion | New | 541 |
| lab | Cystatin C | New | 278 |
| lab | Urine osmolality | New | 274 |
| lab | Urine protein and albumin ratios (UPCR / UACR) | Revised | 298 |
| procedure | 24-hour urine collection | New | 323 |
| procedure | Peak flow measurement | New | 314 |
| diagnosis | Alpha-1 antitrypsin deficiency | New | 337 |
| diagnosis | Central sleep apnea | New | 301 |
| scenario | Falling blood pressure: close the loop | New | 223 |
| scenario | Labor and delivery: speak up with CUS | New | 204 |
| communication | Speaking up for interpreter support | New | 198 |
| reference | Home oxygen and pulse oximetry | Revised | 444 |
| reference | Pulmonary rehabilitation support | Revised | 461 |

The existing urine protein/albumin entry was rewritten rather than duplicated. It separates albumin-specific testing from total protein and replaces generic-source interpretation with specific NIDDK/NLM sources; its stable identifier remains unchanged. The two general references add measurement interpretation, device limitations, rehabilitation goals and follow-up. Across affected entries, the net addition is **5,115 words**; word counts measure size, not clinical completeness.

## Source traceability and clinical scope

The [manifest](../content/curation/cross-category-depth/manifest.json) retains the block map, 22 source records and final content hashes. [Source review notes](../content/curation/cross-category-depth/source-review.md) document label versions, individual source sections, excluded claims and older-source limits. FDA label excerpts preserve adult dosing context, renal adjustment, warnings, units and transition timing; new drug nursing/teaching fields are omitted where no nursing source was used. Lab intervals remain assay-specific. The scenarios use AHRQ's published communication examples, with no invented clinical course or treatment orders.

All sixteen entries/changes remain **pending Tier A independent clinical review before publication**. Citations and automated checks do not establish clinical approval. No content or app release is performed by this library task.

## Integration and validation

- All 21 focused tests in four suites passed, including two checks parameterized over all 16 entries: search/topic/related navigation and complete resolvable claim citations.
- Both compiled-audit tests passed. The citation script checked 17 entries, including the unchanged CPAP entry sharing a file, with zero unresolved citations. Retained source text and final content hashes verified.
- The local AI evidence catalog was regenerated from the expanded library: **42,839 fingerprints**. The Swift/server fixture check passed (7 sources / 7,544 context characters). This refresh was not deployed by this task; release must synchronize the final approved corpus and server catalog.
- Debug simulator app build passed. Drug and lab readers now omit empty optional quick-reference/common-causes headings, keeping source-limited entries readable.
- Simulator evidence is retained in [audit assets](audit-assets/2026-09-17/cross-category/). Reader, navigation and source-opening checks are documented in the validation record there.

## Updated catalog

The [compiled snapshot](library-audit/2026-09-17-cross-category/summary.md) contains **2,139 entries**: 483 drugs, 34 drips, 158 labs, 152 procedures, 577 diagnoses, 41 scenarios, 28 communication entries and 666 general references. There are **54 topic collections, 1,043 memberships and 693 distinct entries reachable through topics**.

All attached citation IDs resolve. Legacy review signals remain: 752 entries contain at least one block without an attached citation ID; 1,059 cite a site root or search URL; 1,446 remain outside selected topic collections. These findings are structural triage, not clinical accuracy scores. Continue credentialed review, legacy-source correction and nursing coverage assessment before describing the library as complete.
