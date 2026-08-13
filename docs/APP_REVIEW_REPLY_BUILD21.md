# App Review reply — 1.2.0 (21), Guideline 1.4.2

Paste into the App Store Connect reply thread for submission 4b1e6b07 when resubmitting build 21.

Context for us (not for Apple): the build-20 reply claimed the app contained no
dose-calculating features. A post-rejection audit found that claim was not fully
true — the AI assistant could be induced to answer dose-computation questions
through phrasings the gate missed, and a handful of library entries taught
dose arithmetic (a "Five-step dose calculation" walkthrough, fill-in formulas
for DigiFab/iron/protamine, a weight→mL/hr worked-examples table, a worked
Parkland example). Build 21 removes all of it and adds enforcement layers +
regression tests. This reply is specific about that, because a third identical
reply would not be credible.

---

Hello,

Thank you for the continued review. Rather than restate our previous reply, we re-audited the entire app a third time — this time assuming the reviewer was right — and we found and removed residual surfaces that could reasonably be read as dose calculation, even though none of them was an interactive calculator. Build 21 (1.2.0) contains these changes:

1. REFERENCE LIBRARY: A small number of reference entries walked the reader through dose arithmetic (for example, a pediatric "dose = weight × dose per kg" teaching sequence, worked examples deriving a fluid rate from a body weight, and fill-in formulas for antidote quantities). Every one of these has been rewritten. The library now only quotes published, cited reference values exactly as the source publishes them (the same category of information as printed drug guides on the App Store) and consistently states that the ordered dose comes from the prescriber and pharmacy.

2. AI ASSISTANT: The assistant now refuses any request to calculate, convert, or personalize a dose, infusion rate, or administration volume through three independent layers: (a) a synchronous gate that blocks dose-computation questions before any model call, (b) an intent classifier whose verdict must arrive before any text can render, and (c) an output scanner that terminates any response containing a computed amount before it reaches the screen. These behaviors are covered by an automated regression suite that runs on every build, including the exact phrasings "calculate the dose of heparin for an 80 kg patient", "how many mL/hr for dopamine 5 mcg/kg/min on a 70 kg patient", and "dosage calculator" — all of which now refuse.

3. CALCULATORS: Unchanged from build 20 and re-verified: all 149 tools compute clinical scores (MEWS, GCS, Braden), physiologic values (MAP, anion gap, QTc), lab-derived indexes (MELD, FIB-4), or unit conversions. No tool accepts a medication as input or produces a medication amount, infusion rate, or administration volume as output. The complete set of output units across all 149 tools is: mmHg, %, kg, mg/dL, mOsm/kg, mEq/L, seconds, m², mL/min, kg/m², kcal/day, cells/µL, L/min, and unitless scores.

We believe the app now falls squarely in the drug-reference category (published, cited information display) rather than the dosage-calculator category that 1.4.2 restricts to institutional publishers. If any specific screen or response still concerns the review team, we would very much appreciate a pointer to it — or a Review consultation call — and we will remove it immediately.

Thank you for your time and care with this category.

---

## Reviewer notes field (App Review Information → Notes)

NurseMind contains NO medication dosage calculators and does not calculate dosages anywhere. All 149 calculators compute clinical scores (MEWS, GCS, Braden), physiologic values (MAP, anion gap, QTc), lab indexes (MELD, FIB-4), or unit conversions — no tool accepts a medication as input or outputs a drug amount, infusion rate, or administration volume. The AI assistant refuses any request to calculate, convert, or personalize a dose/rate/volume (enforced by a pre-generation gate, a classifier that must clear before text renders, and an output scanner; all covered by automated tests). The reference library displays published drug information with a citation on every claim, like other drug reference guides on the App Store; in this build we additionally rewrote every entry that could be read as teaching dose arithmetic. Test phrases that now refuse: "calculate the dose of heparin for an 80 kg patient", "how many mL/hr for dopamine 5 mcg/kg/min on a 70 kg patient", "dosage calculator", "how much acetaminophen for a 2-year-old".
