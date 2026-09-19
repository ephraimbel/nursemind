# Common-condition treatment follow-up — 19 September 2026

Added six detailed adult reference drafts after checking the existing compiled library for gaps. The previous GERD daily-care guide had 155 body words, osteoarthritis daily-function support 233 and osteoporosis daily fracture prevention 228. Migraine and iron-deficiency diagnoses had 339 and 399 words respectively. No dedicated recurrent-UTI prevention guide was found. The additions connect these existing overviews to treatment response, ongoing assessment and primary research.

| Added guide | Body words | Main collections |
|---|---:|---|
| Migraine: prevention and follow-up | 488 | Neurological, medication safety, community care |
| GERD: treatment response and reassessment | 473 | Gastrointestinal, nutrition/elimination, medication safety |
| Iron deficiency: treatment and follow-up | 491 | Blood/immune, labs, medication safety, nutrition |
| Osteoarthritis: pain and treatment follow-up | 488 | Musculoskeletal, mobility, older adults, community care |
| Osteoporosis: treatment continuity | 493 | Musculoskeletal, older adults, medication safety, community care |
| Recurrent UTI: prevention and follow-up | 489 | Renal/urinary, nutrition/elimination, community care |

This expansion adds **2,922 body words, 60 cited clinical blocks, 29 source records, 21 related-entry pairs and 21 collection memberships**. There are 31 new sections. The cumulative collection contains **18 drafts, 8,822 words, 182 cited blocks, 89 sources, 59 related pairs and 55 memberships across 15 existing collections**. All fields of the preceding twelve editorial entries remain unchanged.

## Evidence and editorial decisions

- Migraine includes the [August 2026 AAN–AHS guideline](https://pubmed.ncbi.nlm.nih.gov/42673606/) and the [September 2026 issuer summary](https://americanheadachesociety.org/news/updated-guideline-on-migraine-prevention-medications-for-adults), alongside the dated [PROGRESS trial](https://pubmed.ncbi.nlm.nih.gov/37516125/). The guideline's June 2024 evidence-search cutoff is separate from its publication date.
- GERD adds [PPI indication-review advice](https://pubmed.ncbi.nlm.nih.gov/35183361/) and the [2024 nonerosive-reflux trial](https://pubmed.ncbi.nlm.nih.gov/38750866/). Symptom-free days are distinguished from a cure rate, and the active extension is distinguished from the placebo-controlled phase.
- Iron deficiency cites the [2024 AGA expert review](https://gastro.org/clinical-guidance/management-of-iron-deficiency-anemia/), the [vitamin-C equivalence trial](https://pubmed.ncbi.nlm.nih.gov/33136134/) and [PHOSPHARE-IBD](https://pubmed.ncbi.nlm.nih.gov/36343979/). Conflicting evidence is retained rather than presenting vitamin C as a settled universal requirement. The IV comparison is scoped to its IBD population.
- Osteoarthritis connects NIAMS foundations with the [ACR/AF guideline](https://pubmed.ncbi.nlm.nih.gov/31908163/) and [STEP 9](https://pubmed.ncbi.nlm.nih.gov/39476339/). The trial's symptom and weight outcomes are not described as cartilage regeneration or evidence for every joint or body-weight group.
- Osteoporosis distinguishes treatment continuity from supervised pauses using [Endocrine Society guidance](https://www.endocrine.org/clinical-practice-guidelines/osteoporosis-in-postmenopausal-women), the [FDA safety communication](https://www.fda.gov/drugs/drug-safety-communications/fda-adds-boxed-warning-increased-risk-severe-hypocalcemia-patients-advanced-chronic-kidney-disease) and the [2026 DST report](https://pubmed.ncbi.nlm.nih.gov/41058078/). The latter appeared online in 2025 and measured bone-density outcomes; it does not establish a universal transition regimen.
- Recurrent UTI uses NIDDK's April 2024 pages plus the [D-mannose trial](https://pubmed.ncbi.nlm.nih.gov/38587819/) and [ALTAR](https://pubmed.ncbi.nlm.nih.gov/35535708/). It retains the negative D-mannose result and explains that noninferiority does not imply identical event rates. Trial findings are scoped to adult women.

The 29 new records comprise 14 federal educational/safety sources and 15 factual citations to copyrighted studies or society material, including eight primary trial reports. Source dates, exact URLs, bibliography, access limits and rights notes are in `content/curation/common-conditions/sources.json`. No source contributes more than 200 body words across the cumulative collection. This targeted update is not an exhaustive systematic review or a complete medical index.

NINDS headache, AGA advice and the DST abstract required primary-source indexed text where direct access was blocked or intermittent. The independent reviewer must confirm source destinations and fidelity. PHOSPHARE-IBD's CC BY-NC license is explicitly recorded; no commercially reusable full-text license is asserted. AUA material was excluded from the authoring corpus because of its explicit AI-use restriction. Federal images and third-party material were not reused.

## Publication boundary

All eighteen entries remain pending independent Tier A clinical review, with blank reviewer and approval dates. Source checking is not clinical approval. The existing `DEBUG && COMMON_CONDITIONS_REVIEW` boundary excludes entries, sources, links and collection memberships from ordinary and Release builds. No backend title index, embedding upload, production publication or deployment was performed. These drafts continue the documented user-requested extension beyond the original v1 textbook-only sourcing recipe.

## Validation

- The ordinary-build publication-boundary test passed. All 24 review-build tests across four suites passed, including 15 expected-source retrieval queries, navigation, citation integrity and related-link limits.
- Deterministic generation and exact compiled comparison passed for all eighteen entries and all 55 memberships. The 182 clinical blocks have zero missing or unresolved citation IDs and no nonspecific source locators.
- An isolated Swift compile with the review flag present and DEBUG absent confirmed empty entries, related links and topic memberships across all fifteen collections.
- The compiled review registry contains 2,165 entries, including 687 references and 582 diagnoses. This is eighteen above the ordinary 2,147-entry registry and six above the previous common-conditions snapshot.
- The first navigation run exposed a sixth outbound link on the inherited osteoporosis-screening guide. The new guide now links to DEXA instead; the final complete targeted test run passed without raising the link cap.
- The iOS Simulator app build passed. All six readers were visually inspected on the dedicated NurseMind Content QA Sep17 simulator. The long STEP 9 paragraph displayed fully with its source marker; the osteoporosis → DEXA link opened the expected reader at its top. The migraine guideline citation opened the exact authored PubMed URL. Source-site page rendering was not relied upon for that check.
- Nine screenshots are saved in `docs/audit-assets/2026-09-19/common-longitudinal/`. Exact compiled drafts and the full registry snapshot are in `docs/library-audit/2026-09-19-common-longitudinal/`.
- Logs: `/tmp/nursemind-longitudinal-ordinary-tests.log`, `/tmp/nursemind-longitudinal-review-tests.log`, `/tmp/nursemind-longitudinal-app-build.log`. `git diff --check` passed.

## Review priorities

Review should confirm claim/source fidelity, adult scope, escalation wording, medication boundaries, dates and study applicability. The current full-registry snapshot still has 752 inherited entries with uncited blocks and 1,059 with source-locator issues; this expansion does not claim to resolve those or the previously flagged legacy MASLD treatment statement. The preceding six-entry and twelve-entry audit folders remain historical snapshots.
