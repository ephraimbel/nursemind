# Common conditions — adult review drafts

Eighteen entries add five condition overviews and thirteen follow-up guides. The first six address type 2 diabetes, hypertension and obesity. The next six add adult dyslipidemia and chronic constipation diagnoses, plus treatment follow-up for IBS, insomnia, cigarette cessation and MASLD. The third six deepen migraine prevention, GERD reassessment, iron replacement, osteoarthritis function, osteoporosis treatment continuity and recurrent-UTI prevention. They complement existing laboratory, symptom-support and diagnosis entries; they do not establish a complete medical index.

`entries.json` is the editorial source of truth; `sources.json` records exact source locators, rights, access limitations and per-source attributed word counts. All 182 clinical prose/bullet blocks carry source IDs. The cumulative batch contains 8,822 body words, 89 source records, 59 related-entry pairs and 55 memberships across fifteen existing collections. The second expansion adds 2,780 words, 57 blocks, 30 sources, 19 pairs and 18 memberships. The third expansion adds 2,922 words, 60 blocks, 29 sources, 21 pairs and 21 memberships. Each entry has explicit NCLEX category/subcategory tags, including health promotion for cessation and basic care/comfort for bowel and sleep support.

## Publication status

Every entry is pending Tier A independent clinical review. Reviewer and approval dates are intentionally blank in `review-queue.csv`. The source-fidelity date is an authoring/source check, not clinical approval.

Entries, sources, topic IDs and related links require **both** `DEBUG` and `COMMON_CONDITIONS_REVIEW`. Ordinary Debug builds and all Release builds exclude the batch. No backend entry-title index, embeddings or production content has been added. Local review-build retrieval tests only verify evidence discovery; they do not authorize publication or server retrieval.

## Sourcing decisions

- NIH/CDC-authored educational prose supplies the foundation; third-party media are excluded. Foundation pages retain their own publication/review dates and are not labeled as new studies.
- Current clinical context uses ADA 2026, AHA/ACC 2025 and KDIGO 2024. Study summaries identify the actual trial population, comparator, endpoint and relevant limitations: SOUL, BPROAD, SURMOUNT-5 and SURMOUNT-4.
- The follow-up expansion adds the ACC/AHA 2026 dyslipidemia issuer summary, AGA 2026 refractory-constipation advice, AGA/ACG 2023 pharmacotherapy guidance, VA/DoD 2025 insomnia guidance and the November 2025 AASLD MASH update (2026 issue). Primary research includes CLEAR Outcomes, CARIBS, ESSENCE and a 2025 secondary trial analysis in smokers with depression. Expert advice, randomized trials and secondary analyses are identified separately.
- The third expansion includes the August 2026 AAN–AHS migraine guideline and its September issuer summary, AGA 2024 iron-management advice, and eight primary trial reports: PROGRESS, the 2024 nonerosive-reflux trial, the vitamin-C equivalence trial, PHOSPHARE-IBD, STEP 9, the 2026 DST report, D-mannose and ALTAR. Publication years and study populations are explicit. The 2026 migraine guideline searched evidence through June 2024; the DST report appeared online in 2025 before its 2026 issue.
- Copyrighted guidelines and studies are `factCitationOnly`: concise original statements of clinical facts with exact citations. Full source text, figures, tables and algorithms are not stored or reproduced. PMC hosting is not treated as an open commercial license. ADA's restrictions on full-text distribution and AI use are retained in source metadata; these fact summaries do not grant such rights.
- Each source accounts for at most 200 displayed body words across this batch. The generator verifies this conservative allocation, not legal permission or medical correctness.
- Some ADA content was available through primary-publisher indexed text when direct retrieval returned a challenge; those access limitations are recorded. Independent review must confirm the source destination and fidelity.
- AGA guidance and the CARIBS abstract were checked through indexed primary-source text where direct retrieval was unavailable. Rights/access notes retain those limitations, including CARIBS publisher restrictions; no full article was ingested.
- NINDS headache and the DST abstract were checked through primary-source indexed text when direct retrieval was unavailable or intermittent. PHOSPHARE-IBD is CC BY-NC and is used only for original factual citation, not as commercially reusable full text. The AUA recurrent-UTI guideline was excluded from the authoring corpus because its rights terms restrict AI use; the new UTI guide uses NIDDK and primary trial reports.
- The older CDC sick-day page's blanket advice to continue diabetes pills is intentionally not reproduced: current ADA guidance describes illness-specific exceptions for metformin, SGLT2 inhibitors and other classes. There is no individualized dosing, automatic hold/restart instruction or emergency treatment protocol.
- The older NIDDK fatty-liver page's statement that no medicines are approved is excluded; only lifestyle and supplement-safety material is used. Older blanket constipation laxative restrictions and insomnia medication suggestions are also excluded in favor of the separately dated society/VA recommendations. ESSENCE histology outcomes are not described as proven mortality benefit; CARIBS short-term response is not described as a cure or a permanent restrictive diet.

These are review drafts extending the user-requested breadth beyond the original v1 textbook-only diagnosis recipe in `docs/CONTENT_SOURCING.md` §3.5. Federal-source paraphrases, society recommendations and trial context are explicitly attributable, but they are not claimed to satisfy that verbatim textbook recipe or clinical publication approval. The review queue includes nursing application, thresholds, emergency recognition, source rights and source-access confirmation before any promotion.

## Reproduce

From the repository root:

```sh
python3 scripts/generate-common-conditions.py --check
python3 scripts/verify-common-conditions.py /tmp/nursemind-longitudinal-review-tests.log --output docs/library-audit/2026-09-19-common-longitudinal
```

For simulator tests, run `xcodebuild test -scheme NursemindCore` from `Packages/NursemindCore`, adding `-D COMMON_CONDITIONS_REVIEW` to `OTHER_SWIFT_FLAGS` for the review variant. `CommonConditionsTests` checks publication exclusion, discovery, citation integrity and exact compiled-data export. Build the root application with the same review flag for visual inspection.

The earlier `2026-09-19-common-conditions` audit/report is a historical six-entry snapshot. The `2026-09-19-common-follow-up` snapshot verifies the historical twelve-entry batch. The `2026-09-19-common-longitudinal` snapshot verifies all eighteen drafts.
