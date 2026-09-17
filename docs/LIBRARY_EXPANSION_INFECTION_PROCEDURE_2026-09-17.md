# Infection, renal and cardiac reference depth — September 17, 2026

Added **11 adult nursing guides with 69 sections, 138 individually cited blocks and 4,440 body words**, grounded in **16 primary CDC/NIDDK/NHLBI pages**. The guides add practical preparation, observation, complication recognition, care transitions and follow-up. Each has explicit topic assignments and related references: **28 added topic memberships and 31 related-entry edges**.

| Guide | Body words | Sections |
|---|---:|---:|
| CRE: bedside and transfer precautions | 368 | 6 |
| Hemodialysis access: daily observation | 415 | 6 |
| Peritoneal dialysis: infection recognition | 377 | 6 |
| Kidney biopsy: preparation and recovery | 459 | 7 |
| Nephrotic syndrome: nursing follow-up | 375 | 6 |
| Kidney stones: recovery and recurrence prevention | 375 | 6 |
| Cardiac catheterization: preparation and recovery | 467 | 7 |
| Planned cardioversion: preparation and recovery | 317 | 5 |
| Permanent pacemaker: recovery and follow-up | 450 | 7 |
| Implanted defibrillator: shocks and follow-up | 462 | 7 |
| Heart surgery: recovery and nursing support | 375 | 6 |

## Source and clinical review

The [claim-level manifest](../content/curation/infection-procedure-depth/manifest.json) maps every paragraph to its source; [source-fidelity notes](../content/curation/infection-procedure-depth/source-review.md) document scope and exclusions. Extracted source snapshots and retrieval/hash metadata are retained for all 16 pages. Original federal prose supports the adaptations; images, videos, third-party material, dosing tables and unsupported protocol details are excluded.

The content distinguishes acute-care and nursing-home precautions, peritoneal versus exit-site infection findings, procedure preparation versus individualized orders, and an isolated ICD shock requiring provider contact versus repeated shocks requiring emergency assessment. Anticoagulant holds, universal fluid prescriptions, shock-energy algorithms and device-disabling instructions are not inferred from educational sources. Two source-fidelity refinements preserved optional back-electrode positioning for cardioversion and restricted the pacemaker infection wording to the cited source.

All 11 guides conservatively remain **pending Tier A independent clinical review**, with no reviewer sign-off and publication approval false. A successful citation check establishes a working reference, not clinical validity. No production publication, customer release or deployment occurred.

## Shared-workspace snapshot

The [compiled audit](library-audit/2026-09-17-infection-procedure/summary.md) contains **2,106 entries / 646 general references**, **54 collections / 948 memberships / 659 distinct entries**. This includes the other task's six pathogen-specific references and infection-prevention changes; this batch adds 11 entries. The reserved C. difficile, Candida auris and norovirus guides were excluded from this batch before integration to preserve canonical topic ownership.

Every new guide has attached, resolvable citations throughout, specific source URLs and topic membership. Across the full corpus there are zero unresolved attached citation IDs; 752 entries still have at least one block without an attached ID, 1,059 have a search/root source locator, and 1,447 remain outside curated collections while available through A–Z/search. These are structural review signals, not a complete clinical audit. The library count does not establish complete nursing coverage.

## Verification

- Citation verifier: all 11 additions passed with zero problems.
- Final runtime tests: 21 tests across InfectionProcedureDepthTests, LibraryTopicTests, ContentIntegrityTests and EntryLinkRegistryTests passed, including parameterized discovery and every-block citation checks for all 11 entries.
- Compiled audit: two tests passed; every new guide's body word count and intended topic assignments matched the manifest.
- Final simulator app build passed after the source-fidelity wording refinements.
- Simulator inspected peritoneal dialysis, ICD, permanent pacemaker and CRE readers with visible citation markers. Related navigation from ICD to pacemaker reset to the new heading. The peritoneal-dialysis citation opened the matching CDC page, including its July 10, 2026 date.
- Restored normal By topic home without debug entitlement overrides; the simulator displays 2,106 entries.
- Screenshot evidence: [readers and source opening](audit-assets/2026-09-17/infection-procedure/).

Next: required independent clinical review, continued ICU and specialty depth, and source-specific correction of legacy gaps. Concurrent clinical-library, AI and analytics work was preserved.
