# Common-condition follow-up depth — 19 September 2026

Added six adult review drafts: two diagnosis guides and four treatment/follow-up references. The audit identified no dedicated general dyslipidemia or chronic-constipation diagnosis; existing IBS, insomnia and fatty-liver diagnoses and practical support references were relatively brief. The new material adds treatment response, evidence limitations and longitudinal nursing assessment while linking back to those existing entries.

| Added entry | Section | Body words |
|---|---|---:|
| Dyslipidemia in adults | Diagnosis | 533 |
| Chronic constipation in adults | Diagnosis | 484 |
| IBS: treatment response and follow-up | Reference | 411 |
| Insomnia: CBT-I and treatment follow-up | Reference | 419 |
| Smoking cessation: treatment and follow-up | Reference | 447 |
| MASLD: fibrosis assessment and follow-up | Reference | 486 |

This expansion adds **2,780 body words, 57 cited blocks, 30 source records, 19 related-entry pairs and 18 topic memberships**. The references contain 19 sections. It reaches seven existing collections: cardiovascular, gastrointestinal/liver, endocrine/metabolic, respiratory, behavioral health, nutrition/elimination and community/home care.

The cumulative common-conditions collection now has **12 drafts, 5,900 body words, 122 cited blocks, 60 source records, 38 related pairs and 34 memberships across eight collections**. The previous six entries retain exactly the same clinical text and block citations. Canonical JSON now records NCLEX category/subcategory explicitly; bowel/sleep care uses basic care and comfort, and cessation uses health promotion.

## Evidence and source-fidelity decisions

- Dyslipidemia: [ACC/AHA’s March 2026 guideline announcement](https://www.acc.org/About-ACC/Press-Releases/2026/03/13/18/01/ACCAHA-Issue-Updated-Guideline-for-Managing-Lipids-Cholesterol) supplies current risk-assessment and treatment context, identified as the issuing societies’ summary. NIH pages support foundational assessment. [CLEAR Outcomes](https://pubmed.ncbi.nlm.nih.gov/36876740/) is dated 2023 and scoped to statin-intolerant adults with or at high cardiovascular risk; its composite endpoint, adverse effects and lack of significant all-cause mortality reduction are explicit.
- Constipation: [AGA 2026 advice](https://gastro.org/clinical-guidance/evaluation-and-management-of-refractory-constipation/) explains reassessment before labeling symptoms refractory or considering surgery. [AGA/ACG 2023 guidance](https://gastro.org/clinical-guidance/pharmacological-management-of-chronic-idiopathic-constipation-cic/) supplies pharmacotherapy context. Older NIH blanket stimulant/laxative restrictions are excluded. No obstruction-treatment or surgical protocol is reproduced.
- IBS: [CARIBS](https://pubmed.ncbi.nlm.nih.gov/38643782/) is a 2024 single-center trial with a four-week comparison. The summary distinguishes 304 randomized from 294 who began treatment by reporting the latter denominator, defines the response endpoint and does not equate response with cure. Diet reintroduction and follow-up complement existing symptom/food support.
- Insomnia: [VA/DoD 2025 guidance](https://www.healthquality.va.gov/guidelines/CD/insomnia/I-OSA-CPG_2025-Guideline_final_20250915.pdf) anchors CBT-I, its safety adaptations and medication boundaries. Sleep hygiene is not presented as sufficient stand-alone chronic-insomnia treatment. No unsupervised sleep-restriction schedule is supplied.
- Smoking: CDC adult-cigarette guidance distinguishes counseling, combination NRT, withdrawal and special-population limits. A [2025 secondary trial analysis](https://pubmed.ncbi.nlm.nih.gov/39659160/) provides depression-specific context; it is not described as a newly randomized trial or proof of zero individual neuropsychiatric risk.
- MASLD/MASH: [ESSENCE](https://pubmed.ncbi.nlm.nih.gov/40305708/) is the 2025 planned 72-week interim histology analysis, with the correct placebo response of 34.3%. Histology is not represented as established mortality or decompensation benefit. [AASLD’s November 2025 update](https://pubmed.ncbi.nlm.nih.gov/41201884/) was published in a 2026 issue and supplies current selection/monitoring context. The older NIH treatment page’s obsolete claim that no medicines are approved is explicitly excluded. FIB-4 limitations, specialist assessment and selective biopsy use are distinguished from automatic diagnosis or prescribing.

All new blocks map to exact source IDs; dates, source types, rights and access limitations are recorded in `content/curation/common-conditions/sources.json`. Sources contribute at most 200 body words across the cumulative batch. Copyrighted studies/guidelines are concise original factual summaries (`factCitationOnly`), not licensed full-text ingestion. AGA recommendations and the CARIBS abstract were checked through indexed primary text where direct access failed; independent review must confirm those destinations and fidelity. This is a targeted literature/source check, not an exhaustive systematic review of all medical evidence.

## Publication and integration

The existing deterministic common-conditions generator and verifier now cover all twelve drafts. Search, related links, local evidence retrieval and collections require `DEBUG && COMMON_CONDITIONS_REVIEW`. Ordinary and Release builds exclude the batch, even if a Release build is given the review flag. No production publication, backend title index or embedding upload was performed.

All twelve entries remain pending independent Tier A clinical review with blank reviewer/approval dates. Source checking is not clinical approval. These user-requested broader drafts continue the documented extension beyond the original v1 textbook-verbatim diagnosis recipe.

## Validation

- One ordinary-build publication-boundary test and 24 review-build tests across CommonConditionsTests, LibraryTopicTests, EntryLinkRegistryTests and ContentIntegrityTests passed. All nine common-condition retrieval queries resolved their expected evidence, including each of the six additions.
- Deterministic generation and exact compiled-field comparison passed for all twelve entries. Their 122 clinical blocks have no uncited or unresolved citation IDs; all 34 intended memberships resolve.
- An isolated Swift compile without DEBUG, with COMMON_CONDITIONS_REVIEW still defined, confirmed empty entries, links and topic IDs for all eight collections.
- The compiled review registry has 2,159 entries (582 diagnoses and 681 references). This is twelve above the ordinary 2,147-entry registry and six above the previous common-conditions snapshot.
- The iOS Simulator app build passed. All six readers were inspected on the isolated NurseMind Content QA Sep17 simulator. Constipation → IBS and insomnia → smoking-cessation related links opened the expected readers at the top. The long ESSENCE evidence paragraph displayed completely with its source marker. The cholesterol citation opened the exact authored ACC URL in Safari; source-page rendering was not relied upon for this check.
- Audit: `docs/library-audit/2026-09-19-common-follow-up/`. Eight screenshots: `docs/audit-assets/2026-09-19/common-follow-up/`.
- Logs: `/tmp/nursemind-common-followup-ordinary-tests.log`, `/tmp/nursemind-common-followup-review-tests.log`, `/tmp/nursemind-common-followup-app-build.log`. `git diff --check` passed.

## Remaining clinical review

The six additions are ready for independent source/clinical review, not publication. Review should check adult scope, nursing escalation language, condition-specific medication boundaries, accessible source destinations and whether overlap with older entries needs consolidation.

A targeted legacy reconciliation remains necessary in `Packages/NursemindCore/Sources/NursemindCore/Content/Samples/DiagnosesRound12.swift`: the MASLD diagnosis describes weight loss as the only proven fibrosis intervention and uses generic source records. That older passage should be reviewed against ESSENCE and the subsequent AASLD treatment update before publication alongside the new guide. The new reference does not validate the linked legacy entry. Existing whole-library debt remains 752 entries with uncited-block signals and 1,059 with source-locator signals; this expansion makes no whole-library clinical-validation claim.
