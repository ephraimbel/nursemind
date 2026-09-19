# Recent evidence expansion — September 19, 2026

This batch adds 14 locally reviewable entries: six medicines, two diagnostic guides and six clinical evidence references. It contains 3,663 body words in 91 cited blocks, 39 source records, 33 related-entry pairs and 36 memberships across 13 existing collections. Sources include 13 trial reports, a trial secondary analysis, a diagnostic validation study, an observational cohort and a systematic review, alongside current labels, regulatory records and guidance.

**Publication status: pending independent clinical review.** All entries are conservatively queued as Tier A. They are available only when both `DEBUG` and `RECENT_EVIDENCE_REVIEW` are defined. Normal builds, Release builds, normal title exports and production AI evidence exports omit this batch. No clinical reviewer has signed off; automated checks establish traceability and software integrity, not clinical correctness.

## Coverage

| Section | New entries |
| --- | --- |
| Drugs | Suzetrigine, gepotidacin, brensocatib, nerandomilast, donanemab, zuranolone |
| Labs | Plasma p-tau217 / amyloid ratio; self-collected vaginal HPV testing |
| Reference | Lenacapavir HIV prevention; adult RSV vaccination; obesity medication comparisons; diabetic kidney combination therapy; oral semaglutide cardiovascular outcomes; blood-pressure targets in diabetes |

The additions target missing recent therapies and diagnostic methods, plus study interpretation gaps in common cardiometabolic and preventive care. They connect to existing respiratory, neurological, renal, maternity, behavioral-health, medication-safety and community-care collections. They are evidence-focused summaries, not complete medication administration monographs or an exhaustive medical index.

## Source and clinical review

- `entries.json` is the canonical claim-to-source map, navigation map and review status.
- `sources.json` records exact locators, publication versus retrieval dates, source type, inspected material and attribution rights. Label retrieval receipts include SHA-256 hashes. Full source documents are not redistributed.
- `review-queue.csv` records the required independent review; reviewer and sign-off date remain blank.
- All label summaries use `factCitationOnly`, rather than assuming manufacturer-authored labeling is public domain. Factual summaries are original and limited; no copyrighted tables, algorithms or full study text are copied. The one CC BY article is attributed. The generator caps attributed body text at 200 words per source across the entire batch.
- These medication summaries deliberately depart from the older verbatim-label assembly recipe in `docs/CONTENT_SOURCING.md`: they remain restricted review drafts. Review must resolve label completeness, warning fidelity and rights before promotion. Boxed risks are identified for donanemab and zuranolone; their summaries do not replace the full boxed warnings. Dosing, titration instructions and unsupported nursing-implication sections are omitted.
- Diagnostic guides do not fabricate reference ranges, critical thresholds or interpretation tiers. Assay/device-specific populations, validation evidence and limitations are supplied through cited context groups. The reader omits empty quantitative sections and labels this material “Test context.”
- Publication years remain explicit: the 2023 postpartum-depression trial and 2012 NIDDK laboratory definitions are foundational sources, not described as 2026 research. The zuranolone trial correction was inspected. Most research reports were checked through their indexed primary abstracts; full-paper review remains part of the independent review queue.

Particular review targets include the December 2025 gepotidacin indication expansion and indication-specific interactions; the August 2026 nerandomilast administration update; donanemab MRI and ARIA precautions; zuranolone driving restrictions; device-specific HPV follow-up; and distinguishing subgroup results, surrogate endpoints and observational associations from established clinical outcomes.

## Reproduce and inspect

```sh
python3 scripts/generate-recent-evidence.py --check
```

The generator deterministically produces the Swift entries, citations, links and review queue. Run `RecentEvidenceTests` normally to verify exclusion, then with `OTHER_SWIFT_FLAGS='$(inherited) -D RECENT_EVIDENCE_REVIEW'` in a Debug simulator test build to exercise all entries. Run content-integrity, topic and relationship tests with the same flag.

The review test exports the compiled records and a complete registry audit. Compare that output with the editorial records using:

```sh
python3 scripts/verify-recent-evidence.py /tmp/nursemind-recent-review-tests.log \
  --output docs/library-audit/2026-09-19-recent-evidence
```

To inspect a review build, launch with `NM_FAKE_PRO=1` and, for example, `NM_OPEN_ENTRY=lab:plasma-p-tau217-amyloid-ratio`. The flags are local QA conveniences, not a clinical publication mechanism. Do not regenerate production indexes with the review flag. Promotion requires recorded independent review, resolution of the source-recipe exceptions, and an explicit release change.

## Remaining coverage priorities

The existing index is broad but uneven. In the inspected title manifest, hypertension, uncomplicated type 2 diabetes and obesity lacked dedicated diagnosis entries despite related laboratory, drug and reference coverage. Those common-condition overviews are stronger next additions than more rare-drug breadth. Existing legacy entries with generic source URLs or uncited blocks also need claim-level repair before the product can describe its entire library as study-backed. The earlier bedside audit quantified that inherited citation debt; this batch does not silently mark it resolved.

The search cutoff for this work is September 19, 2026. This was a targeted update search of FDA/DailyMed, CDC, NIH, primary papers and official guideline material, not a systematic review of all medical literature or a claim of worldwide completeness.
