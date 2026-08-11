# App Review reply — 1.2.0 (20), Guideline 1.4.2

Paste into the App Store Connect reply thread for submission 4b1e6b07 when resubmitting build 20.

---

Hello, and thank you for the detailed review.

We have taken Guideline 1.4.2 seriously and re-audited every one of the app's tools against it, then made changes in this new build (1.2.0, build 20) so that no feature in NurseMind calculates a medication dosage.

What changed in build 20:

1. We removed the two tools whose results could be read as patient-specific administration quantities: "Free Water Deficit" (which produced a fluid-replacement volume) and "Na Correction Rate" (which projected the effect of IV fluids). Neither exists in this build.

2. The "Predicted Body Weight" tool no longer computes any patient-specific volume. It returns only the published ARDSNet body-weight estimate; ventilator settings language defers to the provider and respiratory therapy.

3. The remaining 149 calculators compute clinical scores (e.g., MEWS, NEWS2, Glasgow Coma Scale, Braden, Morse), physiologic values (e.g., mean arterial pressure, anion gap, QTc), lab-derived indexes (e.g., MELD, FIB-4), and unit conversions (e.g., kg ↔ lb, °C ↔ °F). None of them accepts a medication as input or produces a medication amount, infusion rate, or administration volume as output.

4. The AI assistant is now explicitly prevented — at the system level, not just by policy text — from calculating a dose from patient parameters. If a user asks it to compute an amount for a specific weight or age, it refuses and directs the user to their facility's ordering process. It can only restate published, cited reference information from FDA drug labeling and open-licensed nursing textbooks, the same class of information a printed drug guide provides.

5. We corrected app and website copy that inaccurately implied dosage tools existed (it was aspirational marketing language from an earlier roadmap; the tools were never shipped).

On the library content: NurseMind's reference entries display published drug information (indications, warnings, monitoring, and labeled dosing ranges) sourced from FDA labeling via openFDA/DailyMed and openly licensed nursing textbooks, with a citation on every claim. This is static reference content — the same category of information as other drug reference guides available on the App Store — and the app performs no calculation on it.

We believe this addresses the guideline's concern: the app is a cited nursing reference with score/index/conversion calculators, not a drug dosage calculator. We would be glad to make any further changes you recommend, and we appreciate the care this category of app rightly receives.

Thank you for your time.

---

## Reviewer notes field (App Review Information → Notes)

NurseMind contains NO medication dosage calculators. All 149 calculators compute clinical scores (MEWS, GCS, Braden), physiologic values (MAP, anion gap, QTc), lab indexes (MELD, FIB-4), or unit conversions. No tool accepts a medication as input or outputs a drug dose, infusion rate, or administration volume. In build 20 we additionally removed two fluid-related tools (Free Water Deficit, Na Correction Rate) and removed patient-specific volume display from the Predicted Body Weight tool to remove any ambiguity. The AI assistant refuses to calculate doses from patient parameters and only restates cited, published reference information from FDA labeling (openFDA/DailyMed) and CC-licensed nursing textbooks. The reference library displays published drug information with citations, like other drug reference guides on the App Store.
