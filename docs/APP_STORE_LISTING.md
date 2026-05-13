# App Store Listing — Copy-paste source

All the strings to paste into App Store Connect. Each section maps to a specific ASC field. Counts assume the ASC limits.

**Version:** 1.0
**Bundle ID:** `app.nursemind.ios`
**SKU:** `nursemind-ios`

---

## App Information

### App Name (30 chars max)
```
NurseMind: Nursing Companion
```
*28 chars. Already set.*

### Subtitle (30 chars max)
```
Drug guide, NCLEX, AI co-pilot
```
*30 chars. Tight — three highest-volume nursing search terms.*

**Alternate options if you want to swap:**
- `Drug guide, NCLEX, calculators` *(30 — bundle-forward)*
- `The cited reference for nurses` *(30 — premium-forward)*
- `Nursing reference + AI co-pilot` *(31 — over by 1)*

### Privacy Policy URL
```
https://nursemind.app/privacy
```

### License Agreement URL (Terms of Use)
```
https://nursemind.app/terms
```

### Support URL
```
https://nursemind.app/support
```

### Marketing URL
```
https://nursemind.app
```

### Primary Category
**Medical**

### Secondary Category
**Education**

### Content Rights Declaration
**Yes — contains, displays, or accesses third-party content.**
*Sources: openFDA / DailyMed (public domain), Open RN (CC BY 4.0), OpenStax Nursing (CC BY 4.0), VA PBM (public domain), CDC (public domain), NIH treatment guidelines (public domain), LiverTox (public domain), MedlinePlus NLM-authored sections (public domain), PubMed Central CC BY/CC0 articles. All sources are credited per their license terms in the in-app Editorial Standards view and at https://nursemind.app/editorial-standards.*

---

## Promotional Text (170 chars max — updateable without re-review)
```
Now in beta. A nursing reference redesigned for clarity. Cited library, full calculator suite, AI co-pilot that cites or refuses. Drug guide + NCLEX, scoped to your specialty.
```
*169 chars. Use this surface for time-sensitive announcements; it can be edited from ASC any time without triggering a new review.*

---

## Description (4000 chars max)

```
NurseMind is a clinical reference and self-directed learning tool for nursing students and licensed nurses. Cited library, the complete suite of nursing calculators, and an AI co-pilot that cites or refuses — in one iOS app.

INSIDE
————
The reference, the calculator, and the co-pilot — in one place.

· LIBRARY · 1,200+ entries across drugs, drips, labs, procedures, diagnoses, scenarios, communication, and reference. Every clinical claim is tied to a primary source — openFDA, DailyMed, Open RN, OpenStax, VA PBM, CDC, NIH, and other accredited references. If we can't cite it, we don't show it.

· CALCULATORS · 149 calculators across hemodynamics, renal, respiratory, hepatic, hematology, electrolytes, anti-coagulation, and more. Every result returns the formula and an interpretive band. Always free, in their entirety.

· ASK NURSEMIND · An AI co-pilot grounded in the library. It explains pathophysiology, walks through clinical reasoning concepts, and surfaces guideline-based information for educational purposes. It does not diagnose. It does not prescribe. It does not direct treatment for a specific patient. Every numerical claim is cited; responses without citations are rejected and regenerated.

DESIGN
——————
Editorial-modern, not enterprise-corporate. Hairlines, not cards. Instrument Serif headings, Inter body, JetBrains Mono numerics. A single deep accent. Generous whitespace. Built to feel premium at the moment you open it.

NCLEX-ALIGNED
—————————————
Content is structured against the 2026 NCLEX-RN Test Plan and the NCSBN Clinical Judgment Measurement Model. Useful for practicing RNs, LPNs, and CNAs as a reference; useful for students preparing for the NCLEX as a study aid. NurseMind is not affiliated with, endorsed by, or sponsored by NCSBN.

PRIVACY
———————
NurseMind is architecturally prevented from collecting Protected Health Information. There is no patient name, MRN, or chart field anywhere in the product. Inputs are scrubbed at the edge before any model receives them. We use the minimum analytics necessary to ship a quality product, and we never sell data. See https://nursemind.app/privacy.

PRO
———
Most of NurseMind is free. Pro unlocks the full clinical scenario set, advanced specialty calculators, cross-device sync, offline mode, and a generous 50 daily AI questions (Free is 5/day).

· Pro Monthly — $14.99/month
· Pro Yearly — $99.99/year, with a 3-day free trial. Billed yearly. Cancel any time in iOS Settings.

NOT FOR CLINICAL USE
————————————————————
NurseMind is a study and self-directed learning tool. It is not clinical decision support, not a medical device, and not for use during patient care. It does not replace independent verification by a licensed provider. Always defer to facility protocols, physician orders, and your own licensed clinical judgment.

——————————————————————
NurseMind, Inc. · Built in the United States · hello@nursemind.app
```

*~3,300 chars. Plenty of headroom under 4000.*

---

## Keywords (100 chars max, comma-separated, no spaces after commas)
```
medications,pharmacology,calculator,labs,RN,LPN,nurse,study,reference,prep,peds,drip,ICU,ER,med
```
*99 chars. Targets the top long-tail nursing search terms not already covered by the app name and subtitle (which carry "NCLEX," "drug guide," and "AI co-pilot" — the highest-volume terms).*

---

## What's New (4000 chars max — first version)
```
NurseMind v1.0 — the first release.

· The full clinical reference library, cited at every claim
· 149 nursing calculators with formulas and interpretive bands
· Ask NurseMind — an AI co-pilot grounded in the library that cites or refuses
· 3 free AI questions a day; Pro unlocks 50 a day, the full scenario set, offline mode, and cross-device sync

Built for clarity. Not for clinical use. Always defer to facility protocols and licensed clinical judgment.

We read every email at hello@nursemind.app. Tell us what to build next.
```

---

## Age Rating

Apple's questionnaire. Answer each:

| Question | Answer |
|---|---|
| Cartoon or Fantasy Violence | None |
| Realistic Violence | None |
| Prolonged Graphic or Sadistic Realistic Violence | None |
| Sexual Content or Nudity | None |
| Graphic Sexual Content and Nudity | None |
| Profanity or Crude Humor | None |
| Alcohol, Tobacco, or Drug Use or References | **Infrequent/Mild** (educational drug references in nursing context) |
| Mature/Suggestive Themes | None |
| Horror/Fear Themes | None |
| Medical/Treatment Information | **Frequent/Intense** (the entire library is medical reference content) |
| Gambling | None |
| Contests | None |
| Unrestricted Web Access | No |

**Resulting age rating: 12+** (driven by Medical/Treatment Information + Drug References)

---

## Pricing & Availability

### Tier
- **Pro Monthly** — `app.nursemind.ios.pro.monthly` — $14.99/month, no trial
- **Pro Yearly** — `app.nursemind.ios.pro.yearly` — $99.99/year, **3-day free trial as introductory offer**

*Product IDs follow `<bundle>.pro.<cadence>` convention. Set these exactly when creating IAPs in App Store Connect — the iOS app and RevenueCat both reference these strings.*

### Availability
- **United States only** at launch
- Add additional territories in v1.1 (Canada, UK, Australia, EU)

### Subscription Group
- Group name: **NurseMind Pro**
- Group description: *"Unlocks the AI co-pilot, the full clinical scenario set, advanced specialty calculators, offline mode, and cross-device sync."*

### Free trial localization
For the 3-day free trial introductory offer:
- **Eligibility:** All new subscribers
- **Type:** Free trial
- **Duration:** 3 days
- **Renews into:** Pro Yearly at $99.99

---

## App Privacy Section

See `docs/APP_STORE_PRIVACY.md` — pre-filled answers for every question in ASC's Privacy questionnaire, derived from the locked architecture (no PHI, anonymous-by-default, etc.).

---

## Screenshots (deferred)

Required: 6.5" iPhone (1290×2796), 5.5" iPhone (1242×2208), 13" iPad Pro (2064×2752 or 2048×2732 depending on era).

We have four 1206×2622 captures from the running iPhone 17 simulator at:
- `/Users/ephraimbelachew/Apps/nursemind/marketing/public/screenshots/ask.png`
- `library.png`, `tools.png`, `answer.png`

These are at 3× iPhone Pro Max scale. Apple now accepts the 6.5" iPhone size as the canonical and auto-scales for smaller devices, so the existing files are usable for the 6.5" slot. We'll need to either re-capture at the exact 1290×2796 spec or upscale carefully (Apple is permissive). For 5.5" iPhone, capture from an iPhone 8 Plus simulator. For iPad, capture from an iPad Pro 12.9" simulator.

**Defer until ready to submit** — Apple lets you upload screenshots last in the workflow.

---

## Pre-submission checklist

- [ ] App Store Connect Bundle ID matches Xcode project (`app.nursemind.ios`) ✓
- [ ] Paid Applications Agreement signed in ASC
- [ ] Banking + tax info filled out in ASC
- [ ] App icon uploaded (1024×1024 already in `Nursemind/Assets.xcassets`) ✓
- [ ] App Information fields populated (paste from this doc)
- [ ] Privacy nutrition labels filled (paste from `docs/APP_STORE_PRIVACY.md`)
- [ ] Age rating completed
- [ ] In-App Purchase products created (Monthly + Yearly with trial)
- [ ] Subscription group created
- [ ] Build uploaded via Xcode or `scripts/upload-to-testflight.sh`
- [ ] Screenshots uploaded
- [ ] Promotional text and What's New filled
- [ ] Internal TestFlight tested by you and 1–2 nurse beta testers before public review
- [ ] Submit for review
