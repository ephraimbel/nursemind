# Neurological rehabilitation, digestive nutrition and endocrine follow-up

September 17, 2026. Added **8 practical references / 32 sections / 64 individually cited guidance points / 11 primary federal sources**, with **24 related edges** and **21 memberships** in existing collections. Corrected one older ALS treatment-options bullet using two additional primary sources.

## Added coverage

| Guide | Scope | Proposed clinical review tier |
|---|---|---|
| Parkinson disease: daily function support | Movement, communication and nonmotor symptoms | B — pending |
| ALS: communication and daily support | Adaptive care, nutrition and breathing support | A — pending |
| Guillain-Barré syndrome: recovery support | Rehabilitation, residual symptoms and emotional support | A — pending |
| Peripheral neuropathy: daily function and safety | Sensory changes, mobility and symptom follow-up | B — pending |
| Cirrhosis: nutrition and daily food planning | Meal patterns, protein needs and food safety | B — pending |
| Pancreatic insufficiency: nutrition support | Malabsorption, enzyme timing and follow-up | B — pending |
| Adrenal insufficiency: illness preparation | Emergency recognition and an individualized care plan | A — pending |
| Hypothyroidism: treatment follow-up | Medicine continuity, monitoring and nutrition questions | B — pending |

Existing titles and bodies were checked before authoring. These guides add daily-function and follow-up depth alongside existing disease summaries, swallowing support, mobility assessment, cancer-treatment neuropathy, adrenal dosing references and GI nutrition guides. They introduce no new page, calculator or patient-data workflow. Adrenal preparation deliberately contains no dose multipliers, injection doses or acute treatment algorithm.

## Source fidelity and review limits

The [review manifest](../content/curation/neurology-digestive-endocrine/manifest.json) maps all 64 guidance points to source IDs. Three new guides are proposed Tier A and five Tier B; clinical confirmation of the tiers and independent clinical review remain pending. No reviewer or approval date is recorded. The manifest is a review record, not an enforced release gate.

NIDDK pages were directly retrieved. Four NINDS sources were available through indexed primary-source text but returned HTTP 403 on direct retrieval; their entries explicitly require source refresh before publication. The ALS booklet identifies itself as NIH Publication 25-NS-916, March 2025; revision dates for the other three NINDS pages were not inferred from search crawl dates. Retrieval/source comparison on September 17 does not mean the sources were revised that day, or that these guides passed independent clinical review.

NINDS and NIDDK original educational prose was paraphrased with attribution under their [NINDS reuse policy](https://www.ninds.nih.gov/publications/publications-help) and [NIDDK copyright policy](https://www.niddk.nih.gov/copyright). No photographs, logos, figures, licensed assessment forms, third-party handouts or linked drug monographs were imported. No agency endorsement is implied.

Scope choices:

- Parkinson support covers function and nonmotor symptoms without medicine selection, a protein-restriction regimen, or unsourced swallowing maneuvers.
- ALS support covers communication, equipment and changing nutrition/respiratory needs without FVC cutoffs, ventilation settings or feeding-tube timing criteria.
- Guillain–Barré recovery includes ongoing monitoring context and individual rehabilitation; it does not supply intubation criteria, immunotherapy doses or a guaranteed recovery timetable.
- General neuropathy support complements the existing oncology guide and omits diagnostic thresholds, surgical selection and drug regimens.
- Cirrhosis food planning avoids blanket protein restriction and fixed sodium targets.
- Pancreatic support addresses exocrine insufficiency using 2023 NIDDK sources. The older 2017 pancreatitis page’s acute fasting language was not imported.
- Adrenal preparation excludes the source’s fixed pregnancy dosing assertions and numerical sick-day schedules.
- Thyroid follow-up excludes dose changes and fixed laboratory intervals; pregnancy is a prompt for clinician contact, not a dosing protocol.

## Targeted ALS correction

`diagnosis:als` in `DiagnosesRound11.swift` previously listed AMX0035 / Relyvrio as a treatment supported by early trials. Its treatment-options bullet now cites [NINDS’s ALS overview](https://www.ninds.nih.gov/current-research/focus-disorders/focus-amyotrophic-lateral-sclerosis) for therapy examples and the [manufacturer’s April 4, 2024 announcement](https://investors.amylyx.com/news-releases/news-release-details/amylyx-pharmaceuticals-announces-formal-intention-remove) for the end of availability to new patients and announced market-removal process. The manufacturer material is fact-only paraphrase, not reproduced press-release prose. The correction does not assert the exact date of formal NDA withdrawal.

This is a narrow treatment-availability correction. The older entry’s May 4 source-review date remains unchanged; remaining diagnostic, respiratory and medication claims still require the broader source-quality and clinical review already recorded in the Library audit. The correction is pending Tier A review.

## Source record

| Source | Source date | Retrieval scope |
|---|---|---|
| [Parkinson’s Disease](https://www.ninds.nih.gov/current-research/focus-disorders/parkinsons-disease-research/parkinsons-disease-challenges-progress-and-promise) | Not stated in retrieved text | indexed primary-source text; direct page returned HTTP 403 |
| [Amyotrophic Lateral Sclerosis (ALS)](https://www.ninds.nih.gov/sites/default/files/2025-05/NINDS_ALS_Booklet_Digital-508c.pdf) | March 2025 | indexed primary-source booklet text; direct PDF returned HTTP 403 |
| [Guillain-Barré Syndrome](https://www.ninds.nih.gov/health-information/disorders/guillain-barre-syndrome) | Not stated in retrieved text | indexed primary-source text; direct page returned HTTP 403 |
| [Peripheral Neuropathy](https://www.ninds.nih.gov/health-information/disorders/peripheral-neuropathy) | Not stated in retrieved text | indexed primary-source text; direct page returned HTTP 403 |
| [Eating, Diet, & Nutrition for Cirrhosis](https://www.niddk.nih.gov/health-information/liver-disease/cirrhosis/eating-diet-nutrition) | June 2023 | direct page |
| [Symptoms & Causes for Exocrine Pancreatic Insufficiency](https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/symptoms-causes) | January 2023 | direct page |
| [Treatment for Exocrine Pancreatic Insufficiency](https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/treatment) | January 2023 | direct page |
| [Eating, Diet, & Nutrition for Exocrine Pancreatic Insufficiency](https://www.niddk.nih.gov/health-information/digestive-diseases/exocrine-pancreatic-insufficiency/eating-diet-nutrition) | January 2023 | direct page |
| [Definition & Facts of Adrenal Insufficiency & Addison’s Disease](https://www.niddk.nih.gov/health-information/endocrine-diseases/adrenal-insufficiency-addisons-disease/definition-facts) | September 2018 | direct page |
| [Treatment for Adrenal Insufficiency & Addison’s Disease](https://www.niddk.nih.gov/health-information/endocrine-diseases/adrenal-insufficiency-addisons-disease/treatment) | September 2018 | direct page |
| [Hypothyroidism (Underactive Thyroid)](https://www.niddk.nih.gov/health-information/endocrine-diseases/hypothyroidism) | March 2021 | direct page |

## Integration snapshot

Combined parsed registry: **2,073 entries / 613 references**, **46 collections / 735 memberships / 590 distinct entries**. The remaining **1,483** entries are available through A–Z and search. The other chat added 20 ICU/respiratory/rhythm references during this pass; those changes are retained and are included in the combined counts, not claimed as this batch’s work.

All eight additions have existing topic homes, related targets and unique IDs/titles. No catalog entries were removed. New files: `NeuromuscularDailySupportReferences.swift`, `LiverPancreaticNutritionReferences.swift`, `EndocrineFollowUpReferences.swift` and `NeurologyDigestiveEndocrineLinks.swift`.

## Verification

- Citation resolver: **22 entries checked / zero unresolved citation issues** across the three new files and the older ALS-containing file.
- Static checks: all new IDs, topic memberships and related targets resolve; no new normalized-title duplicates; 24 unique new unordered edges; all 64 manifest claims match the Swift text.
- Runtime tests: **21 tests in four suites passed** (`NeurologyDigestiveEndocrineTests`, `ContentIntegrityTests`, `EntryLinkRegistryTests`, `LibraryTopicTests`). The new parameterized checks cover all eight entries in search, topics, related navigation and per-block citation resolution. A later citation-date label edit changes metadata only.
- Final app build: **succeeded**. Three readers inspected on the isolated content QA simulator: [adrenal preparation](audit-assets/2026-09-17/neuro-endocrine/adrenal.png), [pancreatic nutrition](audit-assets/2026-09-17/neuro-endocrine/pancreatic.png) and [ALS support](audit-assets/2026-09-17/neuro-endocrine/als-support.png). Headers, opening text and citation markers rendered correctly. These are representative rendering checks; source-link opening was not retested.
- `git diff --check`: passed.

All changes are local development content. Nothing was published or deployed. Catalog size does not establish clinical accuracy, completeness or release readiness.
