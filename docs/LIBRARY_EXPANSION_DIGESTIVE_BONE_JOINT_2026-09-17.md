# Digestive, bone and joint library depth

September 17, 2026. Local development content; independent clinical review is pending.

## Added coverage

Eight adult nursing references add **48 sections, 96 individually cited guidance points and 1,903 body words**, using **21 specific NIDDK and NIAMS source pages**. Each guide has six sections, source metadata, NCLEX tags, search registration and three related-entry links.

| New reference | Added emphasis |
|---|---|
| IBS: daily symptoms & food planning | Symptom history, dietary trials, food reintroduction and follow-up |
| Constipation: adult bowel routine | General adult assessment, toilet routines, medicine review and unresolved symptoms |
| Diverticular disease: food & recovery | Acute versus recovery food plans, individual fiber intake and recurrence discussions |
| Short bowel: nutrition continuity | Adult absorption, changing nutrition support and individualized hydration |
| Osteoporosis: daily fracture prevention | Mobility, home hazards, nutrition and ongoing assessment |
| Osteoarthritis: daily function | Task limitations, sleep, activity, equipment and participation in care |
| Gout: daily care & follow-up | Flare burden, daily coping and treatment continuity |
| Scleroderma: daily support | Skin, oral care, function and organ follow-up |

Existing condition summaries, opioid/cancer constipation guides, gout pharmacology material, osteoporosis screening, ostomy care and nutrition-support procedures were inspected before authoring. The additions provide dedicated daily-care paths and link to existing information; they do not replace or certify those older articles.

## Organization

Two new icon-bearing collections under **Body systems** combine old and new material:

- **Digestive nutrition & symptoms:** 17 selected references and procedures.
- **Bone & joint care:** 14 selected references and procedures.

All eight guides also appear in the existing gastrointestinal or musculoskeletal collections. This pass adds **39 memberships and 24 related edges**. Existing osteoporosis screening and chronic-pain references receive their first curated topic homes.

The compiled registry contains **2,081 entries / 621 general references**, **53 collections / 881 memberships / 632 distinct entries in collections**. The other **1,449 entries** remain available through A–Z and search. Eight IDs were added; none were removed; no new duplicate titles were found.

The preceding parsed snapshot omitted helper-defined ICU collections. These compiled counts include `CriticalCareTopics`, `MedlinePlusTopics` and the new collections; they supersede that partial taxonomy count without rewriting its historical record.

## Targeted older-content corrections

Three bullets across two older entries changed:

- `diagnosis:gout`: removed the blanket prohibition on starting urate-lowering treatment during a flare and the fixed start-delay instruction. Replacements use NIAMS material to distinguish treatment goals and individualized management. The ACR 2020 primary guideline was consulted to verify the conflict, not imported as library content.
- `diagnosis:osteoarthritis`: replaced the blanket exclusion of fatigue with NIAMS-supported symptom-burden wording.

Specific federal citations accompany the replacements. Original whole-entry review dates remain unchanged. These are narrow corrections, not a new approval of either older monograph or its remaining medication content.

## Sources and review

The [curation manifest](../content/curation/digestive-bone-joint-depth/manifest.json) maps every new bullet to a source, retains source review dates and records the three corrections. All 21 clinical pages were read directly. Text reuse follows [NIAMS policy](https://www.niams.nih.gov/disclaimer) and [NIDDK policy](https://www.niddk.nih.gov/copyright); no third-party images, proprietary instruments or medication regimens were added.

NIDDK IBS and constipation pages retain their 2017/2018 review dates. This pass uses stable educational content, excludes old drug/probiotic algorithms and does not represent retrieval in 2026 as a guideline update. Remaining source dates range from 2021 to 2023.

Two guides are proposed Tier A for review because of fluid/organ risks: short-bowel support and scleroderma. Six are proposed Tier B. Tier assignment, required independent clinical review and release approval remain pending. The manifest records workflow status; it is **not an application publication gate**. No production publication or deployment occurred.

## Verification

- Citation checker: 40 entries across the four new/modified content files, zero unresolved citations.
- Simulator tests: 24 tests across five suites passed, including search, related links, collection reachability, SF Symbols and whole-registry attached-citation resolution.
- Compiled body counts for all eight guides match the final authored content; each has cited blocks and specific source URLs.
- Final app build succeeded. On the dedicated content QA simulator, verified both collection screens, short-bowel filtering and navigation, and the IBS, short-bowel and scleroderma readers with citation markers. Five screenshots are retained under `docs/audit-assets/2026-09-17/digestive-bone-joint/`.
- Evidence logs: `/tmp/nursemind-expansion8-tests.log` and `/tmp/nursemind-expansion8-build.log`. The main and attribution-test simulators were not changed.

The whole-library audit still flags 756 entries with at least one block without attached citation IDs and 1,063 entries with a root/search source locator. These are structural review signals, not clinical accuracy scores. More titles do not establish exhaustive nursing coverage; source remediation, depth checks and required clinical review remain necessary.
