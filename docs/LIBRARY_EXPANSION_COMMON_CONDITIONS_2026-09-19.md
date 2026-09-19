# Common-condition depth — 19 September 2026

Added six review-only adult entries: three foundational diagnosis guides and three deeper follow-up references. This fills the missing dedicated type 2 diabetes, hypertension and obesity overviews identified in the preceding audit, while complementing existing home-BP, CGM, complication and screening content.

| Entry | Section | Body words |
|---|---|---:|
| Type 2 diabetes mellitus | diagnosis | 610 |
| Hypertension in adults | diagnosis | 609 |
| Obesity in adults | diagnosis | 665 |
| Diabetes sick-day safety | reference | 442 |
| Hypertension medication follow-up | reference | 391 |
| Obesity: long-term treatment support | reference | 403 |

The batch adds **3,120 body words, 65 individually cited clinical blocks, 30 source records, 19 related-entry pairs and 16 memberships across five existing collections**. Diagnosis guides cover definition, pathophysiology, presentation, criteria, assessment, treatment evidence and complications. The follow-up references contain 15 sections.

## Evidence and editorial checks

Current recommendations were checked against [ADA 2026](https://diabetesjournals.org/care/issue/49/Supplement_1), the [AHA/ACC 2025 hypertension guideline summary](https://professional.heart.org/en/science-news/2025-high-blood-pressure-guideline/top-things-to-know) and [KDIGO 2024](https://kdigo.org/wp-content/uploads/2024/03/KDIGO-2024-CKD-Guideline.pdf). Trial context comes from [SOUL](https://pubmed.ncbi.nlm.nih.gov/40162642/), [BPROAD](https://pubmed.ncbi.nlm.nih.gov/39555827/), [SURMOUNT-5](https://pubmed.ncbi.nlm.nih.gov/40353578/) and [SURMOUNT-4](https://jamanetwork.com/journals/jama/fullarticle/2812936). Federal foundation content is separately attributed to the exact NIH/CDC pages, with older source dates preserved where stated.

Specific source-fidelity decisions:

- Adult diabetes criteria require confirmation unless the clinical presentation is unequivocal. A separate passage distinguishes diagnosing diabetes from determining type, including the role of autoantibody evaluation when type 1 features overlap.
- A1C interpretation limitations and the lack of established CGM diagnostic thresholds are explicit.
- Sick-day medication review follows the 2026 drug-specific exceptions; older blanket advice to continue all diabetes pills was not copied. Type 1 basal-insulin continuity is scoped explicitly to that population.
- Hypertension classification, therapeutic goals and emergency recognition are separate. A severely elevated value alone is not equated with acute target-organ injury. Pregnancy needs a separate pathway.
- ACE-inhibitor/ARB laboratory follow-up is explicitly CKD-specific. Findings prompt prescriber assessment rather than automatic hold or restart orders.
- Obesity assessment describes BMI limits, eating-disorder context and health/function goals. SURMOUNT-4 percentages distinguish the initial weight loss from changes using randomization weight as baseline; the trial population excluded diabetes.
- Each source contributes at most 200 body words across the batch. No copyrighted table, algorithm, image or full-text article is reproduced. `factCitationOnly` is not treated as an open license, including when the source is hosted by PMC. Direct-access challenges on two ADA sources are recorded for independent confirmation.

## Integration and publication boundary

Editorial JSON and source records live in `content/curation/common-conditions/`. `generate-common-conditions.py` writes the Swift entries, citations, links and review queue; `--check` detects drift. `verify-common-conditions.py` compares every compiled field and citation against that JSON and checks actual topic membership.

The additions require `DEBUG && COMMON_CONDITIONS_REVIEW`. Ordinary app builds and Release builds exclude entries, source objects, related links and topic IDs. This batch does not alter production source indexes or embeddings. It is independent of the earlier recent-evidence and ICU review flags.

All six entries await Tier A independent clinical review; no reviewer or approval date is invented. The federal-source/society-guideline diagnosis drafts extend beyond the original textbook-verbatim v1 recipe and are explicitly recorded as review candidates. A source-check date does not assert clinical approval or that all available literature has been systematically reviewed.

## Validation

- Ordinary-build publication-boundary test passed; isolated Swift compilation also confirmed exclusion without DEBUG even when the review flag is defined.
- 24 review-build tests passed across CommonConditionsTests, LibraryTopicTests, EntryLinkRegistryTests and ContentIntegrityTests. Coverage includes every new entry, exact compiled export, source integrity, local retrieval, all related-link endpoints and global duplicate-title invariants.
- Canonical JSON/Swift generation check and exact compiled-field comparison passed. The review snapshot contains 2,153 entries; this batch adds six to the ordinary 2,147-entry registry.
- Final iOS Simulator app build succeeded. All six readers were inspected on the isolated NurseMind Content QA Sep17 simulator. Diagnosis-to-follow-up navigation worked for diabetes, hypertension and obesity. Screenshots confirm readable source markers and the intended clinical sections. The CDC citation opened the exact authored URL in Safari; remote page rendering was not relied upon for this navigation check.
- Audit: `docs/library-audit/2026-09-19-common-conditions/`. Screenshots: `docs/audit-assets/2026-09-19/common-conditions/`. Logs: `/tmp/nursemind-common-normal-tests.log`, `/tmp/nursemind-common-review-tests.log`, `/tmp/nursemind-common-integrity-tests.log`, `/tmp/nursemind-common-app-build.log`.
- The inherited whole-library signals remain 752 entries with uncited blocks and 1,059 with source-locator issues; the six new entries have neither. No broader clinical-validation claim is made.

## Remaining gaps

This adds depth to three common conditions; it does not establish a complete medical index. Existing corpus source-quality debt remains separate. Required next work is clinical review of this batch, reconciliation of overlapping legacy diabetes teaching against current guidance, and further deliberate common-condition coverage.
