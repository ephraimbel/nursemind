# Simulator validation — September 17, 2026

Device: NurseMind Digestive Urology QA Sep17, iPhone 17 Pro, iOS 26.3; UDID `01FE88B0-B907-4C81-900B-7607CE474438`. This task reused its own content-validation device. Debug deep-entry/Pro flags were used only for reader inspection; the app was relaunched without those flags afterward.

- Cefiderocol: title, indication, high-risk label, dosing jump and renal adjustment render correctly. No empty Quick reference heading or jump button. The citation opens the specific FETROJA DailyMed label in Safari.
- Angiotensin II: adult dose, ng/kg/min units, first-three-hour/maintenance distinction and dilution block render without clipping.
- Cangrelor: bolus/infusion and three oral-transition options are visible with source attribution.
- Cystatin C: assay-specific range context, interpretation, citations and related entries resolve. After the final renderer fix, Interpretation flows directly to Nursing actions, with no empty Common causes heading.
- Timed urine collection: numbered steps, start/end timing and inline citations render correctly.
- Central sleep apnea: definition, mechanism, evaluation and linked oxygen reference load correctly. Tapping the oxygen related-entry link opens the intended revised reference.
- Oxygen reference: additional display interpretation and device-limit sections are visible.
- AHRQ check-back scenario: published numeric dialogue, source attribution and debrief sections render correctly.
- Interpreter communication: CUS/check-back sections, citations and related communication entries render correctly.

The 21 focused tests covered all sixteen affected entries, including search, topic memberships, related targets and citation resolution. Two compiled audit tests passed. App build and the local AI evidence export/Swift-server fixture verification passed. Source-fidelity and UI verification do not constitute independent clinical approval.
