# Library quality and depth — September 17, 2026

This pass complements the concurrent 23-entry bedside expansion recorded in `LIBRARY_EXPANSION_2026-09-17.md`. It adds three practical references, rebuilds ten lab entries against specific sources, removes a repeated nutrition-marker misconception from six adjacent entries, and introduces a repeatable review of every registered entry and section. Nothing was published or deployed.

## New references

| Entry | Bedside questions addressed |
|---|---|
| Reading laboratory results | Why was this test ordered? Which interval and units apply? What do positive, negative and inconclusive mean? How should a trend or unexpected result be understood? |
| Preparing for laboratory tests | Does this test actually require fasting? What about medicines and supplements? What if preparation was not followed? What needs clarification before collection? |
| Nursing care plans and reassessment | How do goals differ from outcomes? What makes an outcome measurable? How is response evaluated? When should the plan change? |

All three have explicit citations on every body block, a topic collection, searchable registration and related-entry navigation. Sources are NLM-authored MedlinePlus pages, FDA educational material and Open RN Nursing Fundamentals 2e. Open RN attribution identifies the authors/editors, edition, license and adaptation; proprietary instruments, illustrations and third-party tables are excluded.

## Lab citation display

Simulator verification found that interpretation summaries and their nested nursing actions received citation IDs but rendered plain text. `LabEntryView` now uses the existing attributed-text component for both, exposing the source markers across all 156 lab pages. Prealbumin is also tagged as nutrition rather than perfusion.

## Rebuilt laboratory references

BUN, albumin, BNP/NT-proBNP, lipase, procalcitonin, platelets, INR/PT, PT, CK-MB and prealbumin now contain interpretation, contributing conditions, nursing considerations and cautions with specific supporting sources. The first nine were the shortest lab entries in the compiled baseline. Prealbumin was added after a consistency check found it repeated the misconception corrected on the albumin page.

Corrections include:

- Removed automatic warfarin holding/reversal doses and platelet-transfusion commands from reference-range and interpretation sections. These pages explain the results and bedside observations; they do not prescribe treatment from a number.
- Replaced the absolute HIT platelet-transfusion prohibition with a brief, attributed account of the ASH recommendation and its bleeding-risk exceptions. No HIT dosing algorithm or proprietary scoring instrument was copied.
- Corrected the suggestion that prealbumin reliably measures short-term nutritional response. Albumin and prealbumin pages cite ASPEN's position and distinguish nutritional assessment from protein concentrations.
- Removed misleading CK-MB specificity and reinfarction claims, with NLM sources explaining the role of troponin and the need for clinical context.
- Removed routine bowel-rest/aggressive-fluid instructions from the lipase result page and fixed the implication that a procalcitonin cutoff establishes infection or a treatment decision.
- Replaced unsupported numeric cutoffs with laboratory-specific interpretation where the reviewed source does not establish a universal interval. Retained example adult intervals only where the cited Open RN appendix supports them; these are explicitly examples rather than universal targets.
- Replaced broad/search citations on the rewritten entries with the actual supporting pages. A reference-range appendix is not evidence for a treatment algorithm.

Related nutrition-marker mentions were removed from pressure injury, frailty, TPN administration, comprehensive geriatric assessment, NPIAP pressure-injury staging and pressure-injury treatment. Those are narrow corrections: their older whole-entry review dates remain, and the rest of those entries has not been clinically revalidated by this pass.

Primary correction sources: [MedlinePlus medical tests](https://medlineplus.gov/lab-tests/), [Open RN adult ranges](https://www.ncbi.nlm.nih.gov/books/NBK613071/), [ASPEN visceral-protein assessment guidance](https://nutritioncare.org/wp-content/uploads/2024/12/Appropriate-Use-Visceral-Proteins-Nutrition-Screening-Assessment.pdf), and [ASH HIT pocket guide](https://www.hematology.org/-/media/hematology/files/education/clinicians/guidelines-quality/documents/ash_vte_hit_pocketguide.pdf). ASPEN and ASH are factual citations with original concise wording; their tables, instruments and dosing algorithms are not reproduced. [NLM's reuse policy](https://medlineplus.gov/about/using/usingcontent/) distinguishes its reusable medical-test information from third-party drug and encyclopedia content.

## Whole-library review

`ContentDepthAuditTests` reads the actual compiled registry rather than counting source files. It visits drug/drip quick-reference rows, dosing, warnings, interactions and teaching; every lab section; diagnosis assessments and interventions; procedure preparation, steps, aftercare and documentation; and every reference, communication and scenario section.

The export records body size, missing sections, unattached/unresolved citations, source URLs, generic source locators, clinical-review signals and topic membership for every entry. `scripts/audit-library-depth.py` produces:

- `library-audit/2026-09-17/entries.json`: all entries and section measurements.
- `library-audit/2026-09-17/review-queue.csv`: a sortable queue with explicit reasons and an unadjudicated review status.
- `library-audit/2026-09-17/summary.md`: category totals and comparison with the baseline.

The exporter requires a successful test run and checks the record count against the registry count. Run the audit suite separately when exporting: other concurrently running tests can interrupt JSON log lines.

```sh
cd Packages/NursemindCore
xcodebuild test -scheme NursemindCore \
  -destination 'platform=iOS Simulator,id=F45104E2-3B60-4DB3-A589-111AF88ED16E' \
  -derivedDataPath /tmp/nursemind-lab-quality-sep17 \
  -only-testing:NursemindCoreTests/ContentDepthAuditTests \
  CODE_SIGNING_ALLOWED=NO > /tmp/nursemind-library-audit-export.log 2>&1
cd ../..
python3 scripts/audit-library-depth.py /tmp/nursemind-library-audit-export.log \
  --output docs/library-audit/2026-09-17
```

## What completion still requires

The library cannot honestly be described as answering every nursing question. Entry counts, word counts and resolved citation IDs are not clinical validation. The largest observed quality issue is the number of entries citing search pages or broad websites; each claim needs the exact source supporting it. Quick-reference/table rows also lack citation-ID fields in the current model. Neither issue is fixed by automatically assigning a source to a row.

| Section | Required review before declaring coverage complete |
|---|---|
| Drugs and drips | Current product-specific labeling, indications, route and formulation, monitoring, interactions, adverse effects, teaching and high-alert review; replace generic citations. |
| Labs | Assay/population context, specimen instructions, confounders, interpretation limits and relevant nursing observations; avoid turning ranges into prescriptions. |
| Procedures | Indications and relevant contraindications, equipment, preparation, technique, complications, aftercare and documentation; verify against the actual source and local scope. |
| Diagnoses | Definition, presentation, priority observations, usual care context and deterioration cues with exact sources; review numerical treatment claims separately. |
| Scenarios | Trace every clinical claim to evidence and use the required clinical-judgment structure; credentialed review for emergency and other high-risk content. |
| Communication | Actionable scripts, context, escalation, interpreter/accessibility needs and appropriate scope. |
| General reference | Specific bedside questions, clear limits, accessible sources, related navigation and consolidation of overlapping topics. |

Topic collections are curated starting points, not full coverage maps. Many entries remain accessible through A–Z and search without a topic assignment. Existing duplicate titles also need deliberate consolidation that preserves saved IDs and links.

The current project brief requires Tier A clinical review before publishing high-alert, pediatric and emergency content, plus sampled review for Tier B. Source-fidelity review in this pass does not waive those gates. Older documentation saying no clinician review is needed does not override the user's current instructions.

## Validation

- Final compiled inventory: 1,744 entries across all eight categories; 284 general references. The shared workspace gained 26 references: 23 in the concurrent task and three in this pass.
- 39 targeted tests passed across nine suites, including the complete-registry audit. Six lab tests passed again after the citation-rendering correction. Parameterized cases cover all ten rebuilt labs and three new references.
- Source-ID verification passed across 95 enum blocks in the touched content files; no unresolved attached IDs in the full compiled inventory. These checks do not establish clinical accuracy.
- Final app build passed. Simulator checks covered the three new readers, related navigation, citation metadata and opening the MedlinePlus source. The prealbumin accessibility tree confirms superscript markers on its interpretation summary and both nested actions after the renderer fix. Screenshots and that tree are in `audit-assets/2026-09-17/lab-quality/`.
- Debug Pro was used only for reader inspection; the app was relaunched without the override afterward. Appearance preferences were preserved.
- Remaining audit findings: 1,063 entries with search/root source locators, 756 with blocks lacking directly attached IDs, and 249 heuristic clinical-review flags. These sets overlap; the flags neither prove an error nor identify every high-risk topic.
