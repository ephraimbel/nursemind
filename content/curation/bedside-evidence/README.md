# Bedside evidence curation — 2026-09-19

Eight new references and source-specific expansions to four existing daily-care references. The batch adds 84 individually cited blocks / 3,175 body words, using 20 source records: 12 research reports (10 reviews, one cluster-randomized trial and one quality-improvement study), three nursing textbook chapters, four implementation-toolkit pages and one federal education page.

## Review state

All 12 changed entries remain pending independent clinical review. Repositioning and dysphagia are conservatively assigned Tier A; the other ten are Tier B. No reviewer or publication approval has been recorded. The review queue is `review-queue.csv`; the exact new text, source mappings and review state are in `manifest.json`.

**The manifest is an editorial record, not a runtime publication gate.** These entries are compiled into the local development registry. Review and release control must happen before a production app or backend deployment includes this batch. The updated title index and AI evidence fingerprints are local artifacts; neither was deployed by this task.

## Source boundaries

- Research findings are separated from nursing implementation guidance. Each study summary identifies its population, outcome and relevant limits. Selected research was published in 2019–2024; this is not an exhaustive or continuously updated systematic review.
- Open RN adaptations use original nursing prose under CC BY 4.0, with attribution and a changes notice. Excluded: StatPearls/OpenStax-derived developmental sections, externally attributed intervention lists, proprietary NANDA/NIC material, Braden instruments, figures and third-party tables.
- PMC availability alone is not treated as permission. CC BY sources include license links and author/publisher attribution. Other or incompletely established licenses use `factCitationOnly`: brief, original factual paraphrases, no copied source prose, tables, figures or protocols. Each such source contributes fewer than 200 body words across this batch. This limit is a conservative editorial constraint, not a legal finding.
- NLM Medical Test prose and the explicitly public-domain VA evidence report use their applicable federal reuse permissions. Linked third-party content is excluded. Contractor-authored AHRQ toolkit material is conservatively treated as factual citation only, not assumed public domain.
- Study results do not establish patient-specific treatment instructions. No drug doses, fixed turning schedule, fluid prescription, screening instrument or feeding target was added.
- The expanded references retain their previous whole-entry source-review dates. The manifest dates only this addition; it does not represent a new review of every older block.

## Reproduce structural checks

From `Packages/NursemindCore`, run `BedsideEvidenceTests` on an iOS simulator and capture the complete successful xcodebuild log. Then, from the repository root:

```sh
python3 scripts/verify-bedside-evidence.py /path/to/successful-test.log
```

The comparison checks compiled text and source metadata against the manifest, attached citation resolution, duplicate IDs and factual-summary length. Swift tests additionally cover exact-title search, topic visibility, related navigation, NCLEX parent categories and retrieval of the relevant studies. Automated checks cannot establish clinical accuracy or grant review approval.

## Source inventory

| Source | Evidence type | Reuse treatment |
|---|---|---|
| [Burton et al. — Non-ICU delirium prevention (2021)](https://pubmed.ncbi.nlm.nih.gov/34826144/) | systematicReview | `factCitationOnly` |
| [Open RN — Cognitive impairments, section 6.2](https://www.ncbi.nlm.nih.gov/books/NBK610835/) | nursingTextbook | `ccBy4` |
| [Morris et al. — Hospital falls interventions (2022)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9078046/) | systematicReview | `ccBy4` |
| [Open RN — Mobility, sections 13.2–13.3](https://www.ncbi.nlm.nih.gov/books/NBK610826/) | nursingTextbook | `ccBy4` |
| [Yap et al. — TEAM-UP repositioning trial (2022)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9119401/) | clusterRandomizedTrial | `factCitationOnly` |
| [Open RN — Integumentary assessment, section 10.6](https://www.ncbi.nlm.nih.gov/books/NBK610817/) | nursingTextbook | `ccBy4` |
| [Viñas et al. — Dysphagia and hydration (2022)](https://pmc.ncbi.nlm.nih.gov/articles/PMC9228104/) | systematicAndScopingReviews | `factCitationOnly` |
| [MedlinePlus — Dysphagia tests](https://medlineplus.gov/lab-tests/dysphagia-tests/) | federalEducation | `publicDomain` |
| [Becker et al. — Discharge communication (2021)](https://pmc.ncbi.nlm.nih.gov/articles/PMC8397933/) | systematicReview | `ccBy4` |
| [AHRQ — Re-Engineered Discharge, Tool 3](https://www.ahrq.gov/patient-safety/settings/hospital/red/toolkit/redtool3.html) | implementationToolkit | `factCitationOnly` |
| [Talevski et al. — Teach-back implementation (2020)](https://pmc.ncbi.nlm.nih.gov/articles/PMC7156054/) | systematicReview | `ccBy4` |
| [AHRQ — Use the teach-back method, Tool 5](https://www.ahrq.gov/health-literacy/improve/precautions/tool5.html) | implementationToolkit | `factCitationOnly` |
| [Schnipper et al. — MARQUIS2 medication reconciliation](https://pmc.ncbi.nlm.nih.gov/articles/PMC10964422/) | qualityImprovementStudy | `factCitationOnly` |
| [AHRQ — MATCH medication reconciliation, chapter 3](https://www.ahrq.gov/patient-safety/settings/hospital/match/chapter-3.html) | implementationToolkit | `factCitationOnly` |
| [Acharya et al. — Inpatient sleep interventions (2024)](https://pmc.ncbi.nlm.nih.gov/articles/PMC11004792/) | systematicReview | `ccBy4` |
| [Gomes et al. — Nutritional support in medical inpatients (2019)](https://pmc.ncbi.nlm.nih.gov/articles/PMC6902795/) | systematicReview | `ccBy4` |
| [Loyd et al. — Hospital walking programs (2023)](https://onlinelibrary.wiley.com/doi/10.1002/nop2.1496) | systematicReview | `factCitationOnly` |
| [Ehrenzeller & Klompas — Toothbrushing and pneumonia (2024)](https://pmc.ncbi.nlm.nih.gov/articles/PMC10728803/) | systematicReview | `factCitationOnly` |
| [VA Evidence Synthesis — Post-discharge contacts (2024)](https://www.ncbi.nlm.nih.gov/books/NBK613007/) | systematicReview | `publicDomain` |
| [AHRQ — Postdischarge follow-up phone call, Tool 5](https://www.ahrq.gov/patient-safety/settings/hospital/red/toolkit/redtool5.html) | implementationToolkit | `factCitationOnly` |
