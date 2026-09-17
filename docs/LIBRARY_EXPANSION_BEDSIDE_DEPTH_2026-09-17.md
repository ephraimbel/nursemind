# Adult bedside reference depth — September 17, 2026

Eight focused guides added and six existing references rebuilt, preserving their stable IDs and public sample symbols. The batch contains **113 sections, 223 individually cited guidance blocks, 7,784 body words and 14 source records**. Existing pages grew from 2,535 to 3,456 words; new guides add 4,328 words, for a net increase of 5,249 words. Depth comes from assessment, interpretation boundaries, device-specific precautions, reassessment and communication, not a word-count target.

| Reference | Before words | Current words | Sections |
|---|---:|---:|---:|
| Central venous catheters (CVC) | 539 | 576 | 8 |
| CLABSI prevention bundle | 222 | 552 | 8 |
| CAUTI prevention bundle | 275 | 595 | 8 |
| Chest tube drainage system | 580 | 599 | 8 |
| Wound assessment and care | 439 | 555 | 8 |
| Blood transfusion administration | 480 | 579 | 8 |
| Feeding tubes: placement and connection safety | New | 543 | 8 |
| Enteral feeding: tolerance and monitoring | New | 546 | 8 |
| Enteral tubes: medication safety | New | 569 | 9 |
| NG decompression: bedside monitoring | New | 543 | 8 |
| Neurological checks: serial bedside assessment | New | 524 | 8 |
| Fluid volume: interpreting bedside trends | New | 537 | 8 |
| Surgical drains: assessment and output | New | 532 | 8 |
| Peripheral IV: complications and reassessment | New | 534 | 8 |

The new and expanded material is connected through **37 added related-entry edges and 21 added memberships** in existing icon-bearing collections. Six existing entries were moved into the dedicated BedsideDepth source files without changing their identifiers. The source-fidelity dates apply to these complete replacements; unrelated legacy material was not relabeled as reviewed.

## Source and safety work

Specific Open RN chapters replace broad textbook links. Original CDC summaries support CLABSI and CAUTI guidance, including the 2017 adult chlorhexidine-dressing update. BCIT attribution is retained for permitted derivative text. Source passages marked as StatPearls derivatives, images, videos, restricted scales and learning activities were excluded. The eviQ source is limited to an 80-word factual paraphrase, not a copied algorithm.

Corrections include the PICC central-line classification, CKD site-selection exception, catheter/dressing/tubing distinctions, replacement of a compromised urinary drainage system, chamber-specific chest-drain observations, transfusion reaction handling, and reliable initial feeding-tube confirmation. Universal flush volumes, transfusion rates, chest-drain output thresholds and improvised rescue maneuvers were not carried into the rewritten pages. These entries remain adult educational references, with local orders, competence and device instructions explicit.

The [claim map and review status](../content/curation/bedside-depth/manifest.json) and [source-fidelity record](../content/curation/bedside-depth/source-review.md) document the details. All 14 entries conservatively remain in the Tier A independent clinical-review queue with no reviewer sign-off and publication approval false. No production publication or deployment occurred.

## Checked shared-workspace snapshot

The compiled audit contains **2,089 entries / 629 general references**, **53 collections / 902 memberships / 641 distinct entries**. This includes two separate concurrent eight-guide batches; this task adds eight entries, not 24. There are no unresolved attached citation IDs. All 14 entries in this pass have attached citations for every content block, specific supporting source URLs and topic membership.

The whole corpus still has 752 entries with at least one block lacking an attached citation ID, 1,059 with a search/root source URL, and 1,448 outside curated topic collections. Those are structural review signals, not adjudicated clinical errors. The collection remains incomplete as a nursing reference; the total entry count is not a completeness or clinical-quality certification. See the [compiled audit](library-audit/2026-09-17-bedside-depth/summary.md).

## Verification

- Citation verifier: 14 entries, zero unresolved IDs.
- Runtime tests: 21 tests across BedsideDepthTests, LibraryTopicTests, ContentIntegrityTests and EntryLinkRegistryTests passed, including parameterized discovery/citation checks for all 14 entries.
- Compiled audit: two tests passed; manifest body counts matched the compiled output for every expanded entry.
- Final iOS simulator app build passed; git diff whitespace check passed.
- Simulator inspected feeding-tube placement, related medication-safety navigation, CAUTI and chest-drain readers. Confirmed citation markers, readable long-page layout, corrected closed-system wording and related-navigation reset to the heading. The Open RN feeding-tube citation opened the matching NCBI chapter. Restored the normal By topic home without debug entitlement overrides.
- Screenshots: [reader and navigation evidence](audit-assets/2026-09-17/bedside-depth/).

Next: independent clinical review of the expanded pages; source-specific review of older related procedures; remaining critical-care and specialty gaps. Existing unrelated analytics and concurrent content work remain intact.
