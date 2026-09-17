# Topic icons and diagnostic reference depth — September 17, 2026

Added SF Symbol icons to all four **By topic** directories and all 46 topic collections. The rows reuse the A–Z `CategoryGlyphCell`, with the same symbol size and alignment, quiet secondary text color, existing hairline dividers and combined accessibility labels. Decorative symbols are hidden from VoiceOver.

Added **eight references / 61 sections / 11,393 displayed body words**, each with a direct NLM source, saved source snapshot, attribution, topic home and related reading. Twelve curated related edges connect these patient-education guides to existing lab, procedure and nursing references. No existing article was replaced.

| Added guide | Sections | Body words | Review tier |
|---|---:|---:|---|
| [Fall Risk Assessment](https://medlineplus.gov/lab-tests/fall-risk-assessment/) | 7 | 1,132 | B |
| [Helicobacter pylori (H. pylori) Tests](https://medlineplus.gov/lab-tests/helicobacter-pylori-h-pylori-tests/) | 8 | 1,410 | B |
| [Cytomegalovirus (CMV) Tests](https://medlineplus.gov/lab-tests/cytomegalovirus-cmv-tests/) | 8 | 2,250 | A |
| [Bone Marrow Tests](https://medlineplus.gov/lab-tests/bone-marrow-tests/) | 7 | 1,234 | B |
| [Obesity Screening](https://medlineplus.gov/lab-tests/obesity-screening/) | 8 | 1,499 | A |
| [Vision Screening](https://medlineplus.gov/lab-tests/vision-screening/) | 7 | 1,397 | A |
| [Opioid Testing](https://medlineplus.gov/lab-tests/opioid-testing/) | 8 | 1,497 | B |
| [Tricyclic Antidepressant (TCA) Screen](https://medlineplus.gov/lab-tests/tricyclic-antidepressant-tca-screen/) | 8 | 974 | A |

## Source selection and review boundary

The additions retain NLM patient-education wording rather than supplying nursing protocols. Medical-test information is public-domain material with attribution under [NLM’s reuse policy](https://medlineplus.gov/about/using/usingcontent/). The import excludes images, bibliography and linked third-party content. Every displayed section has a resolved citation. Eight selected pages were refetched and compared with the saved title, source date and body sections. Source fidelity is not independent clinical review.

All eight additions remain pending independent clinical review: four Tier A and four Tier B. The combined NLM manifest now contains 215 pending entries (68 Tier A / 147 Tier B). Review-tier assignments are conservative triage, not publication approval. Source-specific preparation instructions and test interpretation require clinical review before publication; a patient-education source is not a standalone bedside protocol. See `content/curation/medical-tests/review-queue.csv`.

Candidate pages rejected in this pass:

- Celiac disease screening: the introduction conflates an autoimmune disorder with an allergic reaction. [NIDDK explicitly distinguishes celiac disease from wheat allergy](https://www.niddk.nih.gov/health-information/digestive-diseases/celiac-disease/definition-facts). The candidate was removed from registration, snapshots, topics and related links; existing celiac material remains.
- TB screening: the source wording could imply that BCG affects both skin and blood tests. [CDC distinguishes them and states that BCG does not cause positive IGRA results](https://www.cdc.gov/tb/hcp/vaccines/index.html).
- MTHFR testing: mixed language around routine testing and methotrexate dosing needs specialist source reconciliation; not imported.
- AFB testing and dysphagia tests were considered but not selected because source statements about infectiousness and pregnancy/procedure risk need reconciliation.

## Verification

- Eight importer tests pass; deterministic generation and citation checks pass for all 215 NLM entries.
- Final targeted simulator run: 23 tests across four suites pass, including all topic SF Symbols resolving to images, catalog integrity, related links, and two 215-case citation/discovery checks.
- Final simulator app build succeeds. Topic-home and ICU collection icons, A–Z comparison, bone-marrow guide preparation and citation footer were visually inspected. The source button opens the exact MedlinePlus bone-marrow page.
- Compiled registry audit and final screenshots: `docs/library-audit/2026-09-17-topic-icons/` and `docs/audit-assets/2026-09-17/topic-icons/`.

Final compiled catalog: **2,035 entries / 575 reference articles**, with **46 collections / 685 memberships / 572 distinct topic-assigned entries**. The remaining 1,463 entries are reachable through A–Z and search. Two registry-audit tests pass. The baseline comparison includes this batch of eight plus the other task’s earlier twelve continuity guides. Legacy structural review signals remain 756 entries with blocks lacking attached citation IDs and 1,063 with root/search source URLs; these are not clinical judgments. The simulator was restored to the normal free-tier By topic home. No production content was published.
