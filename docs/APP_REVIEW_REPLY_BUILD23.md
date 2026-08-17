# Build 23 — thread reply + reviewer notes (fifth 1.4.2 rejection, 2026-08-17)

Fifth rejection (2026-08-17, build 22) repeated the 1.4.2 boilerplate and
attached screenshots of the MELD (classic) tool — a cirrhosis mortality
score with no medication input or output. Reading: this review team treats
ANY clinical calculator as in-scope for 1.4.2 regardless of dosage, and the
publisher-of-record requirement cannot be satisfied in-app. Response:
build 23 removes the entire calculator surface; the Review Board appeal is
filed in parallel (see `APP_REVIEW_APPEAL_142.md`, 2026-08-17 section).

---

## Thread reply (paste into the rejection thread when submitting build 23)

Thank you for the review and for including screenshots — they identified
the surface of concern clearly.

We have removed it. Build 23 contains no calculators of any kind. The
entire Tools section — every clinical score, severity index, physiologic
ratio, and unit conversion, including the MELD tool shown in the review
screenshots — has been removed from the app. There is no calculator
navigation entry, no calculator search result, no calculator content, and
no reference to calculators anywhere in the app or its metadata.

What remains is a cited reference library (published drug, lab, and
clinical information displayed exactly as its sources publish it) and an
AI assistant that answers only from that library, refuses dosage
questions, and never performs patient-specific calculations. The app has
never collected patient information, and the previously-removed dosage
functionality remains removed.

App metadata (description, promotional text, keywords, screenshots) has
been updated in this submission to match — no calculator claims remain.

We appreciate your patience across these reviews and are happy to answer
any questions.

## Reviewer notes for build 23 (App Review Information → Notes field)

NurseMind is a cited nursing reference library with an AI assistant.

Responding to the Guideline 1.4.2 rejections of builds 19-22:

REMOVED — Build 23 removes the entire calculator/tools surface from the
app, including the MELD tool shown in the review screenshots for build 22.
There are no calculators in this build: no dose calculators (removed in
build 20), no clinical scores, no physiologic ratios, no unit converters.
The Tools navigation, calculator search results, and Spotlight calculator
entries are all gone.

WHAT THE APP CONTAINS — (1) A reference library of published drug, lab,
procedure, and clinical information, each entry cited to its primary
source (openFDA, DailyMed, Open RN, OpenStax, VA PBM, CDC, NIH) and
displayed as the source publishes it. (2) An AI assistant that answers
only from that cited library. It refuses to diagnose, prescribe, or
calculate or personalize any dose, rate, or volume; refusals are enforced
by a pre-request gate, a fail-closed intent classifier, and an output
validator, all covered by automated tests that run on every build.

NO PHI — The app has no patient-data fields and scrubs free-text input
server-side before any model receives it.

Metadata in this submission (description, promotional text, keywords,
screenshots) has been updated to remove all calculator references.

---

## Submission checklist (build 23)

- [ ] Bump build number to 23 (version stays 1.2.0), archive, upload
- [ ] ASC description ← APP_STORE_LISTING.md (calculator-free rewrite)
- [ ] ASC promotional text ← same doc
- [ ] ASC keywords ← `nclex,nursing,drug,lab,iv,icu,reference,rn,sbar,guide,study,nurse,bedside,student,clinical`
- [ ] Subtitle: replace "Evidence-based Clinical Tools" with "The cited reference for nurses"
- [ ] Screenshots: DELETE tools.png (calculator screenshot) from the live set
- [ ] What's New ← build-23 text (no tools mentions)
- [ ] App Review notes ← "Reviewer notes for build 23" above
- [ ] Post the thread reply above in the rejection thread
- [ ] File the Review Board appeal the same day (APP_REVIEW_APPEAL_142.md §2026-08-17)
- [ ] Subscription group description: remove "advanced specialty calculators" if still live
