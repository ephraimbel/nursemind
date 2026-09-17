# Respiratory, vascular and hematology expansion — September 17, 2026

Added **10 adult nursing guides with 67 sections, 134 individually cited blocks and 4,168 body words**, supported by **19 primary NIH pages**. New content adds preparation, observations, warning signs and follow-up for respiratory procedures/testing, pleural disease, vascular recovery and blood disorders. Every guide is searchable, assigned to existing icon-bearing topics and linked to related care: **25 topic memberships and 29 related-entry edges**.

| Guide | Body words | Sections |
|---|---:|---:|
| Bronchoscopy and BAL: preparation and recovery | 463 | 7 |
| Thoracentesis: observation and recovery | 444 | 7 |
| Pulmonary function tests: nursing preparation | 446 | 7 |
| Pleural effusion: ongoing nursing assessment | 391 | 6 |
| After DVT or PE: recovery and follow-up | 432 | 7 |
| Peripheral artery disease: foot and limb care | 428 | 7 |
| Immune thrombocytopenia: nursing follow-up | 438 | 7 |
| Aplastic anemia: nursing support and follow-up | 347 | 6 |
| Hemolytic anemia: assessment and follow-up | 358 | 6 |
| Vitamin B12 deficiency: nursing follow-up | 421 | 7 |

Also completed the stopped task's six-guide infection-prevention batch: recovered source evidence, verified its 96 claim-mapped blocks and 20 older-entry corrections, ran current checks and wrote its [completion report](LIBRARY_EXPANSION_INFECTION_PREVENTION_2026-09-17.md). Those six guides were already registered before this expansion and are not counted again as additions.

## Sources and review status

The [manifest](../content/curation/respiratory-hematology-depth/manifest.json) maps every block to its source. The [source review](../content/curation/respiratory-hematology-depth/source-review.md) records scope, permitted reuse and source defects excluded from the adaptation. All 19 sources have retained extracted-text snapshots with verified hashes and retrieval metadata. Sources are NHLBI federal prose and NLM-authored Medical Tests text; third-party referenced material and images are excluded.

Checks specifically avoided the source's erroneous diffusion-test carbon-dioxide wording, romiplostim route grouping, annual pneumococcal-vaccine wording and inconsistent B12 numerical tables. No universal anticoagulation duration, procedural medicine hold, drainage amount, transfusion trigger or patient-specific dose is supplied. A final pulmonary-testing sentence was narrowed so its attached source supports its entire wording.

All ten new guides and the resumed batch's six guides remain **pending independent Tier A clinical review**. Source fidelity and successful software checks do not establish clinical approval. This is local development work, with no production publication or deployment; the review manifests are not runtime publication gates.

## Verified snapshot

The [compiled audit](library-audit/2026-09-17-respiratory-hematology/summary.md) contains **2,116 entries / 656 general references**, with **54 collections / 973 memberships / 669 distinct entries**. No baseline entry was removed. The new ten guides all have specific source URLs and citations attached to every content block; compiled body counts and intended topic assignments match the manifest.

Across the whole library, no attached citation ID is unresolved. Legacy review signals remain: 752 entries have at least one block without an attached citation ID, 1,059 cite a root/search URL, and 1,447 are available through search/A–Z but outside curated collections. These are structural flags, not adjudicated clinical errors. Entry count does not establish a complete nursing reference.

## Verification

- New-guide citation check: ten entries, zero problems; resumed-source-file check: 23 entries, zero problems.
- Final combined runtime tests: 24 tests across RespiratoryHematologyDepthTests, InfectionPreventionDepthTests, LibraryTopicTests, ContentIntegrityTests and EntryLinkRegistryTests passed.
- Two final audit tests passed; all ten compiled body counts, citations and intended topic memberships matched the claim manifest.
- Final simulator app build and git whitespace checks passed.
- Simulator inspected bronchoscopy, pulmonary testing and ITP readers; navigation from bronchoscopy to pulmonary testing reset to the new heading. Verified final pulmonary-testing wording and opening of the matching NLM source.
- Resumed-batch verification inspected the C. difficile reader and opened its matching CDC hand-hygiene source. Evidence is retained separately for each batch.
- Confirmed all six recovered guides in the Pathogen-specific precautions collection; restored the normal library home with 2,116 entries and no debug entitlement override.
- [New reader/navigation screenshots](audit-assets/2026-09-17/respiratory-hematology/) and [resumed-task screenshots](audit-assets/2026-09-17/infection-prevention/).

Next: independent clinical review, further ICU/specialty depth and source-specific legacy corrections. Existing AI, analytics and other workspace changes were preserved.
