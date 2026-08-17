# App Review Board appeal — Guideline 1.4.2, submission 4b1e6b07

> **2026-08-17 — FIFTH rejection changes the posture.** Build 22 was rejected
> with the same 1.4.2 boilerplate plus reviewer screenshots of the MELD
> (classic) tool — a mortality score with no medication input or output. The
> screenshots prove the review team applies 1.4.2 to any clinical calculator,
> not just dosage math, so the "our calculators aren't dose calculators"
> argument below cannot clear review no matter how true it is. New strategy,
> executed 2026-08-17: (1) build 23 removes the ENTIRE calculator surface
> (`ToolsAvailability.calculatorsEnabled = false`, guard-test pinned) and
> resubmits with calculator-free metadata — see
> `APP_REVIEW_REPLY_BUILD23.md` for the thread reply, reviewer notes, and
> submission checklist; (2) THIS appeal is filed the same day, arguing the
> misapplication and asking whether non-medication clinical scores can be
> restored in a future update. Use the **"Appeal text (2026-08-17 version)"**
> section below; the original build-21 appeal text is retained beneath it for
> history but is superseded.

## Appeal text (2026-08-17 version — paste into the appeal form)

We are appealing the Guideline 1.4.2 rejections of NurseMind 1.2.0
(submission 4b1e6b07-53b8-48a8-92fa-736d4f6b4c35), most recently build 22 on
August 17, 2026, and asking for clarification of the guideline's scope.

The build-22 rejection states the app "calculates medical dosages," and the
attached reviewer screenshots show the MELD (classic) tool. MELD is a
cirrhosis severity score computed from three laboratory values (bilirubin,
INR, creatinine). It does not accept any medication as input and does not
output any medication amount, rate, or volume — nothing in it calculates a
dosage. The same is true of every tool in build 22: after the build-20
remediation, the complete tool set consisted of clinical scores (MEWS, GCS,
Braden, SOFA), physiologic values (MAP, anion gap, QTc), lab-derived indexes
(MELD, FIB-4), anthropometrics (BMI, BSA), and unit conversions. The
complete set of output units contained no mg, mcg, units, mL/hr, or gtt/min.
These are the same instruments that ship in many nursing and medical
reference apps published by individual developers.

To unblock release, we have removed the entire calculator surface — every
score, index, ratio, and conversion, including MELD — in build 23, and
updated all metadata to match. We are not asking the Board to reverse the
rejection of build 22.

We are asking the Board to clarify: does Guideline 1.4.2's
manufacturer/institution requirement extend to clinical scoring tools that
have no medication inputs or outputs (MELD, GCS, Braden, BMI, unit
conversions)? If it does not, we would like to restore that surface in a
future update with the review team's guidance. If it does, we will keep it
removed and would appreciate that being stated so we can plan the product
accordingly.

We would welcome a consultation call if that is easier. Thank you.

---

## Original build-21 posture (superseded 2026-08-17)

Fourth 1.4.2 rejection (2026-08-14, build 21, iPhone 17 Pro Max) was verbatim
boilerplate — "the issues we previously identified still need your attention" —
with no specific feature named, against the build that removed every residual
dose-computation surface and regression-tested the invariant. Per the
2026-08-13 decision: this gets an appeal + consultation-call request, not a
fifth silent resubmit.

## How to file (founder actions, in order)

1. **File the appeal**: App Store Connect → the rejection message thread has an
   option to appeal, or go to https://developer.apple.com/contact/app-store/?topic=appeal
   and reference submission `4b1e6b07-53b8-48a8-92fa-736d4f6b4c35`, app
   NurseMind, version 1.2.0 (21). Paste the appeal text below.
2. **Post the thread reply** (below) in the rejection thread — it walks the
   review team through HOW the concern was fixed, review by review, so the
   next reviewer reads the fix story rather than the template again.
3. **Verify live ASC keywords** one more time before anything else ships:
   the field must not contain both `medication`/`drug` AND `calculator`
   (order-independent combination creates the phrase match "medication
   calculator"). The 2026-08-13 session dropped them — confirm it saved.
4. Do NOT submit a new binary while the appeal is open unless Apple asks for
   one. Build 22 is uploaded and waiting in TestFlight if they do.
5. **When build 22 is submitted** (whenever that happens): first replace the
   App Review Information → Notes field with the "Reviewer notes for build
   22" section below, so the fix explanation is inside the review UI itself.

---

## Appeal text (paste into the appeal form)

We are appealing the Guideline 1.4.2 rejection of NurseMind 1.2.0 (build 21),
submission 4b1e6b07-53b8-48a8-92fa-736d4f6b4c35, because the reviewed build
does not contain the feature the guideline restricts: it has no functionality
that calculates a medication dosage.

NurseMind is a nursing reference library. It bundles three things: (1) a
cited reference library of published drug, lab, and clinical information —
the same category of content as printed drug guides and other drug-reference
apps on the App Store; (2) clinical score and physiology calculators; and
(3) an AI assistant that only answers from the cited library and refuses
dosage questions.

On the specific concern of 1.4.2:

1. CALCULATORS. Build 21 contains 149 tools. Every one computes a clinical
score (MEWS, GCS, Braden, SOFA), a physiologic value (MAP, anion gap, QTc),
a lab-derived index (MELD, FIB-4), an anthropometric value (BMI, BSA), or a
unit conversion (°C↔°F, kg↔lb, lab SI units). No tool accepts a medication
as an input, and no tool outputs a medication amount, concentration,
infusion rate, or administration volume. The complete set of output units
across all 149 tools is: mmHg, %, kg, kg/m², m², mg/dL, mEq/L, mOsm/kg,
mL/min, seconds, kcal/day, cells/µL, L/min, and unitless scores. There is
no mg, mcg, units, mL/hr, or gtt/min output anywhere in the app.

2. AI ASSISTANT. Requests to calculate, convert, or personalize a dose,
rate, or volume are refused through three independent, automatically tested
layers: a synchronous gate before any model call, an intent classifier whose
verdict must arrive before any text renders (it fails closed), and an output
scanner that terminates any response containing a computed amount. Example
phrases that refuse: "calculate the dose of heparin for an 80 kg patient",
"how many mL/hr for dopamine 5 mcg/kg/min on a 70 kg patient", "how much
acetaminophen for a 2-year-old", "dosage calculator".

3. REFERENCE LIBRARY. Drug entries display published, cited reference values
exactly as the source publishes them, with a citation on every claim, and
consistently state that the ordered dose comes from the prescriber and
pharmacy. Nothing in the library walks the reader through dose arithmetic.

Across the four reviews of this submission we have acted on every concern we
could identify: we removed every calculator that produced a fluid or
medication administration value, rewrote App Store metadata that referenced
tools that never existed in the app, rewrote the small number of library
entries that could be read as teaching dose arithmetic, and added the AI
enforcement layers above, each time documenting the changes in our reply.
The most recent two rejections repeated the same template text without
identifying any feature, so we are no longer able to determine what, if
anything, still concerns the review team — while the app, as reviewed, does
not calculate dosages.

We respectfully ask the Review Board to either overturn the rejection or
tell us the specific screen, tool, or response that is being read as a
dosage calculator — we will remove it immediately. We would also welcome a
Review consultation call. We have deliberately built this app to stay on the
reference side of the line 1.4.2 draws, because we agree with the line.

Thank you for your time.

---

## Reply for the rejection thread (post after filing the appeal)

This is what the next reviewer reads first — it tells them exactly HOW the
1.4.2 concern was fixed, review by review, not just that it was.

Hello,

Thank you for the continued review. We have filed an appeal with the App
Review Board for submission 4b1e6b07 and would welcome a consultation call.
For the review team's reference, here is specifically how the 1.4.2 concern
has been addressed, review by review:

WHAT WE REMOVED. Every tool that produced a medication or fluid
administration value was removed from the app: the drip-rate, weight-based
dose, pediatric dose, opioid conversion, heparin nomogram, and Parkland
calculators were never shipped; the Free Water Deficit and Sodium
Correction Rate tools (which output fluid replacement targets) were removed
after the second review; and in the current build we additionally removed
the Adjusted Body Weight tool because its main clinical use is
dosing-weight selection, even though it outputs only kilograms. The app now
contains 148 tools, and every one outputs a clinical score (MEWS, GCS,
Braden), a physiologic value (MAP, anion gap, QTc), a lab index (MELD,
FIB-4), an anthropometric value (BMI, BSA), or a unit conversion. No tool
accepts a medication as input; no output anywhere is mg, mcg, units, mL/hr,
or gtt/min.

WHAT WE REWROTE. After the third review we audited every reference entry
and rewrote the small number that walked the reader through dose arithmetic
(a pediatric "dose = weight × dose per kg" teaching sequence, worked
weight-to-rate examples, fill-in antidote formulas). The library now only
quotes published values exactly as the cited source publishes them — the
same category of information as printed drug guides — and states that the
ordered dose comes from the prescriber and pharmacy. In the current build
we also removed drug names and dose thresholds from calculator screens
where they appeared as descriptive text (for example, the SOFA
cardiovascular options and the Caprini result text).

HOW THE AI IS CONSTRAINED. The assistant refuses any request to calculate,
convert, or personalize a dose, infusion rate, or administration volume,
through three independent layers: a synchronous gate before any model call,
an intent classifier whose verdict must arrive before any text renders (it
fails closed), and an output scanner that terminates any response
containing a computed amount. Phrases that refuse include "calculate the
dose of heparin for an 80 kg patient", "how many mL/hr for dopamine 5
mcg/kg/min on a 70 kg patient", and "how much acetaminophen for a
2-year-old".

HOW THIS IS ENFORCED PERMANENTLY. An automated regression suite runs on
every build and fails the build if: any calculator reappears whose id or
description matches dose computation; any of the removed tools is
reintroduced; any library entry teaches dose arithmetic (a full-corpus
scan, no sampling); or any of the refusal phrasings above stops refusing.
This is not a copy fix — it is an enforced invariant of the codebase.

If any specific screen, tool, or response still concerns the review team,
a pointer to it is all we need and we will remove it immediately.

Thank you.

---

## Reviewer notes for build 22 (paste into App Review Information → Notes before submitting)

This field is shown inside the review UI itself — it is the one place the
reviewer is guaranteed to look. It leads with HOW the concern was fixed.

RESPONDING TO GUIDELINE 1.4.2 — WHAT CHANGED AND HOW IT IS ENFORCED:

NurseMind does not calculate medication dosages anywhere, and this build
completes four rounds of remediation: (1) REMOVED — every tool that output
a medication or fluid administration value is gone (drip rate, weight-based
dose, peds dose, opioid conversion, heparin nomogram, Parkland were never
shipped; Free Water Deficit and Na Correction Rate removed in 1.2.0 (20);
Adjusted Body Weight removed in this build because its main use is
dosing-weight selection). All 148 remaining tools output clinical scores
(MEWS, GCS, Braden), physiologic values (MAP, anion gap, QTc), lab indexes
(MELD, FIB-4), or unit conversions — no tool accepts a medication as input
or outputs mg, mcg, units, mL/hr, or gtt/min. (2) REWROTE — every
reference entry that could be read as teaching dose arithmetic was
rewritten to display only published, cited values (like printed drug
guides); drug names and dose thresholds were removed from calculator
screens where they appeared as descriptive text. (3) AI CONSTRAINED — the
assistant refuses all dose-calculation requests via three independent
layers (pre-generation gate, classifier that must clear before text
renders and fails closed, output scanner that kills any computed amount).
Test phrases that refuse: "calculate the dose of heparin for an 80 kg
patient", "how many mL/hr for dopamine 5 mcg/kg/min on a 70 kg patient",
"dosage calculator", "how much acetaminophen for a 2-year-old".
(4) ENFORCED PERMANENTLY — an automated regression suite runs on every
build and fails it if a dose-computing tool, entry, or AI response path is
ever reintroduced.

Demo account: not required (no login wall). The Tools tab shows all 148
calculators; the six free ones open without a subscription and every
locked tool's title/subtitle is visible for verification.

---

## Build 22 (uploaded to ASC 2026-08-14, processing → TestFlight)

Residual pattern-match surfaces scrubbed this session — none were violations,
all were strings a reviewer could grep-match against dosing:

- Adjusted Body Weight calculator removed entirely (its only clinical use is
  dosing-weight selection; its own disclaimer argued with the guideline).
  Registry is now 148 tools; counts reconciled in marketing + listing copy.
- `ardsnet-vt` renamed to `pbw` (id, struct, subtitle) — the old id/type name
  said "tidal volume" while the screen didn't.
- SOFA cardiovascular rows no longer render named vasopressors with
  mcg/kg/min thresholds in the tappable options; banding moved to the cited
  note.
- Caprini high-risk result no longer names LMWH/UFH.
- Rule of Nines note no longer says "for resuscitation calculations" (a live
  pointer at Parkland).
- CrCl note dropped "FDA drug labeling" / dosing-weight-selection framing.
- Heparin drip entry: "round to nearest 50 units/hr" arithmetic instruction
  replaced with the prescriber/pharmacy convention; protamine 1 mg : 100
  units reversal ratio replaced with "per facility protocol".
- IBW note dropped the defensive "this app does not calculate medication
  dosages" argument (screens should not argue with the guideline).
- NEW `CalculatorRegistryGuardTests`: (a) no registry title/subtitle may
  match dose/drip/infusion/rate-unit patterns; (b) every 1.4.2-cut
  calculator id (fwd, na-correction-rate, parkland, drip-rate, adjbw, …) is
  asserted absent — this is the test that makes a bad merge from `main`
  fail loudly, since `main` still carries fwd + na-correction-rate.
