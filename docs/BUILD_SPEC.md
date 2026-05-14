# NurseMind — Master Build Specification

**The clinical mind for every nurse.**

Version 2.0 · Eden-aligned design · Pre-development specification
Platform: iOS-native (Swift 5.9+ / SwiftUI)
Target ship date: 90 days from project start

---

## 0. How to use this document

This is the source of truth for every product, design, engineering, and content decision. It supersedes all prior documents. When something feels ambiguous in the build, the answer is here. When the answer isn't here, the answer is whichever option most closely matches Sections 5 (Design System) and 7 (AI Architecture).

The principle: **the information does the talking; the design quietly carries it.**

Read top to bottom once. Then live in Section 12 (Build Plan) day-to-day.

---

## 1. Product

### 1.1 What it is

A premium iOS-native subscription app that gives every nurse one trusted place for:

- **The Library** — beautifully organized, evidence-based clinical reference (drugs, drips, labs, procedures, diagnoses, calculators, scenarios, communication templates) tuned to the user's unit and experience level
- **The AI Co-pilot** — a chat assistant grounded in the curated library plus vetted external sources, with citations on every clinical claim
- **The Personalization Layer** — adapts the app to the user's role and unit so med-surg nurses see med-surg first, ICU nurses see drips and vent settings first, students see foundational content first

### 1.2 What it isn't

- Not an EHR. No patient data ever flows in or out.
- Not a clinical decision system. Reference and education only.
- Not a documentation tool. Charting happens in the EHR.
- Not a community or social product in v1.
- Not a generic AI chatbot. Tightly scoped to nursing reference and action.

### 1.3 The promise

Open NurseMind, get the answer in under five seconds. Drip rate, normal value, "what do I do next" scenario, or specific clinical question — every answer is evidence-based, cited, and trustworthy. The app is fast, beautiful, and feels like it was built by a nurse for nurses.

### 1.4 Pricing (locked, repriced 2026-05-09)

| Tier | Price | Includes |
|---|---|---|
| Free | $0 | Full library, all non-dosing calculators, 3 AI questions/day, local bookmarks |
| Pro Monthly | $14.99/mo | 50 AI questions/day, all units, offline mode, no ads |
| Pro Yearly | $99.99/yr | Same as monthly; 44% off vs. monthly equivalent ($179.88/yr) |

3-day free trial on Pro Yearly (introductory offer via StoreKit 2). Monthly has no trial. No student tier, no lifetime — two paid SKUs only.

**Reasoning:** $99.99/yr is the premium psychological anchor with comfortable Apple Small Business Program net (~$85). 3-day trial selected over 7-day to (a) cap AI-token exposure per trial signup, (b) match the fast value-moment of an AI-reference app where the first cited answer demonstrates value within minutes, (c) accelerate paid-conversion feedback loop in launch window. Trade-off: requires aggressive monitoring of refund rate (>8% triggers re-evaluation) and App Store rating (drop below 4.5 within 30 days = signal that 3-day is biting).

---

## 2. Safety architecture

This sits above every other architectural decision. Built into commit one, never retrofitted.

### 2.1 The four safety principles

**P1 — No PHI, ever.** Architectural prevention, not user discipline.
**P2 — Reference, not advice.** Every surface frames NurseMind as educational. The licensed nurse is always the decision-maker.
**P3 — Citations on everything.** No clinical claim without a citation.
**P4 — Continuous clinical review.** Every flagged answer routes to the clinical advisor within 7 days.

### 2.2 PHI prevention — defense in depth

**Layer 1 — Architectural.** No EHR integration. No patient data sources. No "save patient" features. The product can't store PHI because there's nowhere to put it.

**Layer 2 — Input filtering (server-side).** Before every AI request, the input passes through a regex scrubber:

```
Pattern                                          Replacement
─────────────────────────────────────────────────────────────
\b(Mr|Mrs|Ms|Dr)\.?\s+[A-Z][a-z]+\b              [name]
\b[A-Z][a-z]+\s+[A-Z][a-z]+(?=\s+(is|was|came|presented|admitted))   [name]
\bMRN\s*:?\s*\d{6,}\b                            [mrn]
\b\d{6,12}\b(?!\s*(mg|mcg|mL|kg|lb|cc|units))    [id]
\b(0?[1-9]|1[0-2])[/-](0?[1-9]|[12]\d|3[01])[/-](\d{2}|\d{4})\b   [date]
\b(Room|Bed|Bay)\s*\d+[A-Z]?\b                   [room]
\b\d{3}-\d{2}-\d{4}\b                            [ssn]
```

If any pattern matches, set `redacted: true` flag. The user sees a one-time toast: "I removed what looked like patient details before processing. Please describe situations in general terms."

**Layer 3 — Onboarding contract.** Every user explicitly agrees: "I will not enter Protected Health Information."

**Layer 4 — Storage.** Conversation logs stored after PHI-strip pass. User-visible history capped at 90 days. Server-side anonymized logs retained 1 year for QA review.

**Layer 5 — Disclosure.** Privacy Policy and Terms make clear: no PHI, no BAA, not a HIPAA-covered service.

### 2.3 Reference-not-advice patterns

Every AI response is constructed to keep the nurse as the decision-maker:

- Frame: "what should the nurse assess and do" — never "what does the patient have"
- Diagnostic/prescribing requests get redirected: "I can help you think about what to assess and report — diagnosis is the provider's call. Here's what would be useful to gather first..."
- Every answer ends with a footer: *"Reference only — always follow your facility's policies and verify with your provider."*

### 2.4 Citation enforcement

The pipeline rejects any AI response containing:
- A specific dose without a citation
- A specific lab range without a citation
- A specific procedure step without a citation
- A drug interaction claim without a citation

Rejected responses get regenerated with explicit "cite or refuse" instruction. If the second attempt also fails, user sees the low-confidence refusal pattern.

### 2.5 Out-of-scope refusal categories

The system explicitly refuses:
- Diagnosis ("what does this patient have")
- Prescribing recommendations ("should I give X")
- Patient-facing medical advice ("tell my mom what to do")
- Non-clinical / off-topic queries
- Anything involving real-named individuals

### 2.6 Legal scaffolding

Required before public launch:
- Terms of Service (with no-PHI obligation, not-medical-advice disclaimer, clinician-responsibility clause)
- Privacy Policy (CCPA, COPPA, App Store compliant)
- EULA accepted at first launch
- $1–2M product liability + E&O insurance ($2–4K/yr)
- Named clinical advisor on the website with credentials

---

## 3. Information architecture

Three primary surfaces accessed via bottom tab bar. No "Home" tab — Library opens to a personalized landing.

```
┌─────────────────────────────────────────────┐
│                                             │
│           [content area]                    │
│                                             │
├─────────────────────────────────────────────┤
│  Library     Ask        Tools     Profile   │
│   ●           ○          ○         ○        │
└─────────────────────────────────────────────┘
```

**Library** — searchable spine; browse and search all reference content
**Ask** — AI co-pilot chat
**Tools** — calculators (separated for fast access — nurses use these constantly)
**Profile** — user settings, unit/role, subscription, support

### 3.1 Library content categories (8)

1. **Drugs** — drug monographs with nursing implications
2. **Drips** — IV drips with embedded calculators
3. **Labs** — lab values with interpretation and nursing actions
4. **Procedures** — step-by-step nursing role for clinical procedures
5. **Diagnoses** — common diagnoses with priority assessments
6. **Scenarios** — quick-action playbooks for high-stakes moments
7. **Communication** — SBAR templates, escalation scripts, handoff frameworks
8. **Reference** — guidelines, policies, equipment quick-refs

### 3.2 Personalization signals

Two onboarding inputs drive everything:

- **Career stage:** Student / New Grad (0–1y) / Early Career (1–3y) / Experienced (3+y) / Charge or Lead
- **Units (multi-select up to 3):** Med-Surg, Tele, ICU (Med/Surg/Cardiac), ER, L&D, Mother-Baby, NICU, PICU, Oncology, OR, PACU, Pulmonary/IMC, Float, Other

Library reorders by relevance. AI co-pilot adapts depth and tone. Home screen surfaces relevant content first.

---

## 4. Complete screen-by-screen flows

### 4.1 First launch & onboarding (6 screens)

**Goal:** From first open to first useful screen in under 90 seconds, with safety contract signed.

```
Screen 1 — Welcome
──────────────────────────────────────────
[grain texture warm cream background]

         ✦ THE CLINICAL MIND
            FOR EVERY NURSE

         NurseMind                        ← Instrument Serif 64pt
                                              tracking -1.8

         Evidence-based reference         ← italic, 18pt, secondary
         and AI co-pilot, designed
         for the bedside.

         [Get started]                    ← deep forest green button
         I have an account                ← tertiary text link
──────────────────────────────────────────
```

```
Screen 2 — Career stage
──────────────────────────────────────────
✦ STEP 1 OF 4

Where are you in your
career?                                   ← Instrument Serif 38pt

  ○ Student
  ○ New grad (0–1 year)
  ○ Early career (1–3 years)
  ○ Experienced (3+ years)
  ○ Charge or leadership

         [Continue]                       ← disabled until selected
──────────────────────────────────────────
```

```
Screen 3 — Unit (multi-select up to 3)
──────────────────────────────────────────
✦ STEP 2 OF 4

What unit do you
work on?                                   ← Instrument Serif 38pt

Select up to three.                       ← italic helper

  ☐ Med-Surg          ☐ Tele
  ☐ ICU – Medical     ☐ ICU – Surgical
  ☐ ICU – Cardiac     ☐ ER
  ☐ L&D               ☐ Mother-Baby
  ☐ NICU              ☐ PICU
  ☐ Oncology          ☐ OR / PACU
  ☐ Pulmonary / IMC   ☐ Float pool

         [Continue]
──────────────────────────────────────────
```

```
Screen 4 — Safety contract (REQUIRED, can't skip)
──────────────────────────────────────────
✦ STEP 3 OF 4

Before you start                          ← Instrument Serif 38pt

NurseMind is a reference tool, not a
medical advice system. To keep it
safe for everyone, please agree:

  ●  I will not enter patient names,
     MRNs, DOBs, or other identifying
     information.
  ●  I will always follow my facility's
     policies and provider orders.
  ●  I understand the licensed nurse
     is always the decision-maker.

  [✓] I understand and agree

         [Continue]                       ← disabled until checkbox
──────────────────────────────────────────
```

```
Screen 5 — Notifications (skippable)
──────────────────────────────────────────
✦ STEP 4 OF 4

Stay sharp                                ← Instrument Serif 38pt

We'll send you one tip a week —
a drug, a calculator, a scenario
worth knowing.

No spam. No alerts during shift.

         [Enable notifications]
         Maybe later                      ← tertiary
──────────────────────────────────────────
```

```
Screen 6 — Soft paywall (skippable)
──────────────────────────────────────────
[grain texture]

✦ NURSEMIND PRO

Try it free                               ← Instrument Serif 38pt
for 7 days                                  italic on "free"

  ●  Unlimited AI co-pilot
  ●  All 8 specialty units
  ●  Offline mode
  ●  Priority support

  ┌──────────────────────────┐
  │  Yearly       $99.99/yr  │           ← default selected
  │  $8.33/mo · Save 44%     │              with deep green border
  └──────────────────────────┘
  ┌──────────────────────────┐
  │  Monthly     $14.99/mo   │
  └──────────────────────────┘

         [Start 3-day free trial]
         Continue with free →             ← tertiary
──────────────────────────────────────────
```

**Onboarding analytics events:**
- `onboarding_started`
- `onboarding_step_completed { step }`
- `safety_contract_accepted`
- `notifications_response { enabled: bool }`
- `paywall_response { trial_started | dismissed }`
- `onboarding_completed { duration_seconds }`

---

### 4.2 Library — Home (the personalized landing)

```
┌─────────────────────────────────────┐
│  9:41                          ⌛📶📶│  ← status bar
│                                     │
│                              ⌕      │  ← search icon
│                                     │
│  ✦ YOUR LIBRARY                     │  ← eyebrow
│                                     │
│  Library                            │  ← Instrument Serif 56pt
│                                       
│  ICU – Medical · early career       │  ← "early career" italic
│                                     │
│  ─────────────────────────────────  │  ← hairline
│                                     │
│  PINNED                             │
│                                     │
│  Norepinephrine                  →  │  ← Instrument Serif 22pt
│  Drug                                  ← caption tertiary
│                                     │
│  Heparin gtt                     →  │
│  Drip                               │
│                                     │
│  ABG interpretation              →  │
│  Calculator                         │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  BROWSE                             │
│                                     │
│  Drugs                  487      →  │  ← serif name, mono count
│  Drips                   42      →  │
│  Labs                   156      →  │
│  Procedures              68      →  │
│  Diagnoses              124      →  │
│  Scenarios               56      →  │
│  Communication           34      →  │
│  Reference               78      →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  RECENTLY VIEWED                    │
│                                     │
│  Cardene gtt                     →  │
│  Lactate                         →  │
│  Sepsis bundle                   →  │
│                                     │
└─────────────────────────────────────┘
[Library] [Ask] [Tools] [Profile]
```

**Behaviors:**
- Pinned items persist across sessions (max 12)
- Recently viewed = last 10 entries, FIFO
- Tap category → CategoryListView
- Tap pinned/recent item → EntryDetailView
- Tap search icon → SearchView (autofocus on input)
- Pull to refresh → re-fetch personalization signals + re-sort

### 4.3 Library — Category browse (e.g., Drugs)

```
┌─────────────────────────────────────┐
│  ← Drugs                       ⌕    │
│                                     │
│  ✦ 487 ENTRIES                      │
│                                     │
│  Drugs                              │  ← Instrument Serif 44pt
│                                     │
│  ┌─────────────────────────────┐   │
│  │ All  Pinned  Recent  System │   │  ← segmented filter
│  └─────────────────────────────┘   │
│                                     │
│  A                                  │  ← section letter, serif italic
│                                     │
│  Acetaminophen                   →  │
│  Acyclovir                       →  │
│  Adenosine                       →  │
│  Albumin                         →  │
│  Albuterol                       →  │
│  Amiodarone           HIGH ALERT →  │  ← amber pill flag
│  ...                                │
│                                     │
│  B                                  │
│                                     │
│  Bumetanide                      →  │
│  ...                                │
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- A–Z scrubber on right edge for jump scrolling (long-press to jump)
- "HIGH ALERT" pill for ISMP-listed medications (amber background, deep red text)
- Filter "By system" reorganizes alphabetical → cardiovascular / respiratory / GI / neuro / etc.
- Tap entry → EntryDetailView

### 4.4 Library — Drug detail (the editorial card)

This is the gold-standard entry layout. Every category renders through a shared `EntryRenderer`, but drugs are the most complex example.

```
┌─────────────────────────────────────┐
│  ←                          ☆  ⋯    │
│                                     │
│  ✦ DRUG · VASOPRESSOR               │
│                                     │
│  Norepinephrine                     │  ← Instrument Serif 52pt
│                                       
│  Levophed                           │  ← serif italic 20pt
│                                     │
│  ┌──── HIGH-ALERT MEDICATION ────┐  │  ← amber pill, deep red text
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Quick reference                    │  ← Instrument Serif 28pt
│                                     │
│  Class            α/β agonist       │  ← key/value rows
│  Onset            Immediate         │     mono values, serif keys
│  Half-life        2–3 minutes       │
│  Standard conc.   4 mg / 250 mL     │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Dosing                             │
│                                     │
│  Adult: 0.05–3 mcg/kg/min titrated  │
│  to MAP > 65.¹                      │  ← inline citation
│                                     │
│  ┌──────────────────────────────┐   │
│  │  Open drip calculator     →  │   │  ← deep links to drip
│  └──────────────────────────────┘   │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Nursing implications               │
│                                     │
│  ●  Central line preferred;         │
│     extravasation causes tissue     │
│     necrosis. Phentolamine is       │
│     the antidote.²                  │
│  ●  Monitor MAP, HR, urine output,  │
│     extremity perfusion.            │
│  ●  Wean by 0.02–0.05 mcg/kg/min    │
│     q15–30 min as tolerated.        │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Watch for                          │
│                                     │
│  ●  Hypertension, reflex            │
│     bradycardia, arrhythmia         │
│  ●  Extravasation (peripheral use)  │
│  ●  Tachyphylaxis with prolonged    │
│     high-dose use                   │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  CITATIONS                          │
│                                     │
│  1.  AHA ACLS Guidelines, 2024      │  ← serif italic
│      §6.3                           │
│  2.  ISMP High-Alert Medications    │
│      List, 2024                     │
│  3.  AHFS Drug Information, 2024    │
│                                     │
│  Last reviewed: April 2026          │
│  Reviewed by Sarah Chen, MSN, CCRN  │  ← italic on name
│                                     │
│  Report an issue                    │  ← underlined link
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- ☆ pin/unpin (max 12 pins)
- ⋯ menu: share, copy, view source list
- Tap calculator CTA → opens corresponding drip detail with calculator pre-filled
- Tap citation superscript (¹) → scrolls to citation list
- Tap citation source → opens external source (Safari) or in-app reader
- Tap "Report an issue" → modal with text input → routes to clinical advisor queue

### 4.5 Library — Drip detail (with embedded calculator)

The calculator is the hero — it opens at the top, not buried below.

```
┌─────────────────────────────────────┐
│  ←                          ☆  ⋯    │
│                                     │
│  ✦ DRIP · IV CONTINUOUS             │
│                                     │
│  Norepinephrine                     │  ← Instrument Serif 52pt
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Calculator                         │  ← serif 28pt
│                                     │
│  PATIENT WEIGHT                     │  ← eyebrow label
│  ┌─────────────────────────┐        │
│  │ 80              kg ▾    │        │  ← input field
│  └─────────────────────────┘        │
│                                     │
│  CONCENTRATION                      │
│  ○  4 mg / 250 mL  (16 mcg/mL)      │
│  ●  8 mg / 250 mL  (32 mcg/mL)      │  ← radio + mono
│  ○  Custom                          │
│                                     │
│  DOSE                               │
│  ┌─────────────────────────┐        │
│  │ 0.10   mcg/kg/min       │        │
│  └─────────────────────────┘        │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  PUMP RATE                          │
│                                     │
│  15.0  mL/hr                        │  ← serif 72pt; "mL/hr" italic 24pt
│                                     │
│  0.10 × 80 × 60 ÷ 32 = 15.0         │  ← mono show-work card
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Reference                          │
│                                     │
│  Starting dose · 0.05 mcg/kg/min    │
│  Typical range · 0.05–0.5           │
│  Max usual     · 3 mcg/kg/min       │
│  Titration step · 0.02 q5–15 min    │
│                                     │
│  Administration                     │
│  ●  Central line preferred          │
│  ●  Dedicated lumen if possible     │
│  ●  Use smart pump library          │
│                                     │
│  Monitoring                         │
│  ●  Continuous BP (art line ideal)  │
│  ●  Q15min until stable, then Q1h   │
│  ●  Hourly urine output             │
│  ●  Extremity perfusion checks      │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  CITATIONS                          │
│  1.  SCCM Surviving Sepsis 2021     │
│  2.  AHA ACLS Guidelines 2024       │
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- Live update of pump rate as inputs change (no submit button)
- Default values pre-populated from typical adult patient
- Show-work card always visible (not collapsed)
- "Custom" concentration opens numeric input
- Unit toggle (kg/lb) in profile preferences

### 4.6 Library — Lab detail with inline interpreter

```
┌─────────────────────────────────────┐
│  ←                          ☆  ⋯    │
│                                     │
│  ✦ LAB · METABOLIC                  │
│                                     │
│  Lactate                            │  ← Instrument Serif 52pt
│                                       
│  Serum / plasma                     │  ← italic
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Reference range                    │
│                                     │
│  < 2.0 mmol/L     Normal            │  ← mono values
│  2.0 – 4.0        Elevated          │
│  > 4.0            Critical¹         │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Quick interpreter                  │
│                                     │
│  PATIENT VALUE                      │
│  ┌─────────────────────────┐        │
│  │ 4.8           mmol/L    │        │
│  └─────────────────────────┘        │
│                                     │
│  ┌──────────────────────────────┐  │
│  │ Critical                      │  │  ← interpretation card
│  │                               │  │     deep-tone bg, no shadow
│  │ Reflects significant tissue   │  │
│  │ hypoperfusion. Common in      │  │
│  │ sepsis, shock, cardiac arrest,│  │
│  │ ischemia, severe liver        │  │
│  │ disease.                      │  │
│  │                               │  │
│  │ Nursing actions:              │  │
│  │ ●  Notify provider            │  │
│  │    immediately                │  │
│  │ ●  Reassess perfusion         │  │
│  │ ●  Confirm IV access          │  │
│  │ ●  Anticipate fluid resus,    │  │
│  │    pressors, source control   │  │
│  └──────────────────────────────┘  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Common causes                      │
│                                     │
│  Type A (hypoxic)                   │  ← serif italic subhead
│  ●  Sepsis / septic shock           │
│  ●  Cardiogenic shock               │
│  ●  Hypovolemic shock               │
│  ●  Severe anemia, hypoxemia        │
│                                     │
│  Type B (non-hypoxic)               │
│  ●  Liver failure                   │
│  ●  Metformin, isoniazid toxicity   │
│  ●  DKA, malignancy                 │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  CITATIONS                          │
│  1.  SCCM Surviving Sepsis 2021     │
│  2.  Tintinalli's Emergency Med 9e  │
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- Inline interpreter is deterministic (rule-based threshold table, NO AI involved). This matters for safety — interpretations are predictable, not generated.
- Interpretation card appears only when value entered, with appropriate tier-coded label (Normal / Low / High / Critical)

### 4.7 Library — Scenario / Playbook detail

```
┌─────────────────────────────────────┐
│  ←                          ☆  ⋯    │
│                                     │
│  ✦ SCENARIO · 5-MIN PLAYBOOK        │
│                                     │
│  Patient suddenly                   │
│  hypotensive                        │  ← Instrument Serif 44pt
│                                     │
│  First 5 minutes                    │  ← italic 20pt
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Step 1 — Verify                    │  ← serif 24pt
│  30 seconds                         │  ← italic helper
│                                     │
│  ●  Recheck BP, opposite arm        │
│  ●  Check the patient — symptomatic?│
│     Mental status? Skin?            │
│  ●  Position: head-of-bed flat      │
│     unless contraindicated          │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Step 2 — Quick assessment          │
│  2 minutes                          │
│                                     │
│  ●  Recent meds? (antihypertensive, │
│     opioids, sedation)              │
│  ●  Recent fluids? Bleeding?        │
│  ●  Cardiac history?                │
│  ●  Last labs — H&H, lactate?       │
│  ●  IV access — at least one        │
│     working PIV, preferably 18g     │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Step 3 — Notify                    │
│  parallel to Step 4                 │
│                                     │
│  Page provider with SBAR.           │
│                                     │
│  ┌──────────────────────────────┐   │
│  │  Open SBAR builder        →  │   │  ← deep links to comm tool
│  └──────────────────────────────┘   │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Step 4 — Anticipate orders         │
│                                     │
│  Common provider orders:            │
│  ●  Fluid bolus (NS or LR, 250–    │
│     500 mL or 30 mL/kg in sepsis)¹ │
│  ●  Repeat labs — H&H, lactate,    │
│     BMP, ABG/VBG                   │
│  ●  EKG                             │
│  ●  Vasopressor if no fluid        │
│     response                        │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Document                           │
│                                     │
│  ●  Time of event, vitals before    │
│     and during                      │
│  ●  Interventions performed         │
│  ●  Provider notified, time         │
│  ●  Patient response                │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Watch for                          │
│                                     │
│  ●  Anaphylaxis (recent contrast,   │
│     antibiotic, blood product)      │
│  ●  Tension PTX (post-procedure)    │
│  ●  Cardiac tamponade (post-op CT)  │
│  ●  GI bleed                        │
│  ●  Sepsis                          │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  CITATIONS                          │
│  1.  SCCM Surviving Sepsis 2021     │
│  2.  AACN Critical Care Procedures  │
│                                     │
└─────────────────────────────────────┘
```

### 4.8 Search

```
┌─────────────────────────────────────┐
│  ←  ⌕  norepi                       │  ← live search, autofocus
│                                     │
│  DRUGS · 1                          │  ← eyebrow per group
│                                     │
│  Norepinephrine          drug    →  │
│                                     │
│  DRIPS · 1                          │
│                                     │
│  Norepinephrine          drip    →  │
│                                     │
│  SCENARIOS · 3                      │
│                                     │
│  Patient hypotensive     scenario→  │
│  Septic shock            scenario→  │
│  Wean off pressors       scenario→  │
│                                     │
│  REFERENCE · 1                      │
│                                     │
│  Vasopressor selection    ref    →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  ✦ ASK NURSEMIND                    │  ← AI fallback
│                                     │
│  When do I switch from              │  ← serif italic
│  norepinephrine to                  │     pull quote feel
│  vasopressin?                       │
│  Ask AI →                           │
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- Search is local FTS over SwiftData cache (sub-100ms)
- Empty state: "Nothing matches *[query]*. Try different words, or ask NurseMind."
- "Ask NurseMind" CTA appears when query is question-shaped (contains "?", "how", "when", "why", "what's the difference")
- Tapping it pre-fills the AI chat with the query and submits

### 4.9 Ask — Home

```
┌─────────────────────────────────────┐
│                                ⊕    │  ← new chat
│                                     │
│  ✦ CO-PILOT                         │
│                                     │
│  Ask anything                       │  ← Instrument Serif 56pt
│                                       "anything" italic
│                                     │
│  Evidence-based, cited,             │
│  scoped to nursing practice.        │  ← "nursing practice" italic
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  SUGGESTED                          │
│                                     │
│  How do I titrate norepi to MAP? →  │  ← serif 20pt
│  Difference between BiPAP & HFNC?→  │
│  When to call a rapid response?  →  │
│  How to interpret K+ of 6.5?     →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  RECENT                             │
│                                     │
│  Cardiogenic vs septic shock     →  │
│  Heparin nomogram steps          →  │
│  ABG with metabolic acidosis     →  │
│                                     │
│                                     │
│  ┌────────────────────────────┐    │
│  │ Ask anything about nursing │ ↑  │  ← input + send
│  └────────────────────────────┘    │
│                                     │
│  Reference only · Verify with       │  ← persistent footer
│  provider · No PHI                  │     italic, tertiary
│                                     │
└─────────────────────────────────────┘
```

**Behaviors:**
- Suggested questions are personalized (based on user's unit + recent library views)
- Recent: last 10 conversations, tapping resumes the conversation
- ⊕ starts new chat
- Tap suggested → pre-fills input → user can edit before sending

### 4.10 Ask — Active conversation

```
┌─────────────────────────────────────┐
│  ←                             ⊕    │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  YOU                                │
│                                     │
│  How do I interpret a lactate of    │  ← Instrument Serif 24pt
│  4.8 in a septic patient?           │     calm reading-size serif
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  ✦ NURSEMIND                        │
│                                     │
│  A lactate of 4.8 mmol/L is in the  │  ← Inter 16pt body
│  critical range (>4.0) and reflects │     1.65 line-height
│  significant tissue hypoperfusion.¹ │
│                                     │
│  In sepsis specifically, this meets │
│  the threshold for septic shock     │
│  when paired with MAP <65 despite   │
│  fluid resuscitation.²              │
│                                     │
│  What you'd typically assess and    │
│  prepare for:                       │
│                                     │
│  ●  Reassess perfusion — MAP,       │
│     mental status, capillary refill,│
│     urine output, extremity warmth  │
│  ●  Confirm IV access (ideally two  │
│     large-bore PIVs or central line)│
│  ●  Anticipate fluid resuscitation  │
│     (30 mL/kg crystalloid in first  │
│     3 hours per Surviving Sepsis)²  │
│  ●  Anticipate vasopressor          │
│     initiation if MAP doesn't       │
│     respond to fluids               │
│  ●  Repeat lactate in 2–4 hours to  │
│     trend response                  │
│                                     │
│  Reference only — diagnosis and     │  ← italic footer
│  orders are the provider's call.    │
│  Always follow your facility's      │
│  sepsis protocol.                   │
│                                     │
│  SOURCES                            │  ← eyebrow
│                                     │
│  1.  Lactate · NurseMind library    │  ← serif italic
│  2.  Surviving Sepsis Campaign 2021 │
│                                     │
│  ───────────                        │
│  👍  👎  ⎘  ⚑                       │  ← action row
│                                     │
│                                     │
│  ┌────────────────────────────┐    │
│  │ Follow up...                │ ↑  │
│  └────────────────────────────┘    │
└─────────────────────────────────────┘
```

**Behaviors:**
- Streaming responses (token-by-token) with cursor blink while streaming
- Citations rendered as superscript numerals; tap → opens that source
- Sources list appears at the bottom of every assistant message
- Action row icons:
  - 👍 thumbs up → logs positive signal, no UI change
  - 👎 thumbs down → opens "What was wrong?" modal with quick options
  - ⎘ copy → copies plain-text version of response (without citation numbers, with sources appended)
  - ⚑ flag → opens report modal, routes to clinical advisor queue
- If user goes back to a previous conversation, full history is restored
- "Follow up..." input maintains conversational context (last 6 turns sent to model)

### 4.11 Ask — Refusal patterns (4 distinct templates)

**Template A — Diagnostic redirect:**
```
✦ NURSEMIND

I can't suggest a diagnosis — that's
the provider's call. But I can help
you think about what to assess and
report.

Based on what you described, here's
what would be useful to gather before
calling the provider:

  ●  ...
  ●  ...
```

**Template B — Prescribing redirect:**
```
✦ NURSEMIND

The decision to give a medication is
the provider's, based on the orders
they write. I can help you understand
the medication itself — its action,
nursing implications, what to monitor,
what to watch for.

What would you like to know about it?
```

**Template C — PHI detected:**
```
✦ NURSEMIND

It looks like you may have entered
patient information. I removed it
before processing.

Reminder: NurseMind is a reference
tool — please describe situations in
general terms only.

[Original question with PHI redacted,
response continues below]
```

**Template D — Low confidence:**
```
✦ NURSEMIND

I don't have high-confidence sources
for that specific question. I'd
recommend:

  ●  Your facility's policy or protocol
  ●  Your charge nurse or pharmacist
  ●  Davis's Drug Guide or Lexicomp
     for drug specifics
```

### 4.12 Tools — Calculator hub

```
┌─────────────────────────────────────┐
│                              ⌕      │
│                                     │
│  ✦ CALCULATORS                      │
│                                     │
│  Tools                              │  ← Instrument Serif 56pt
│                                     │
│  Calculators and converters         │  ← italic 17pt
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  PINNED                             │
│                                     │
│  IV drip rate                    →  │
│  Heparin nomogram                →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  DOSING                             │
│                                     │
│  IV drip rate (mcg/kg/min →  mL/hr)→│
│  Weight-based dose               →  │
│  Pediatric dose by weight        →  │
│  Opioid conversion               →  │
│  Steroid equivalency             →  │
│                                     │
│  FLUID                              │
│                                     │
│  Maintenance IV (4-2-1 rule)     →  │
│  Replacement (deficit + maint)   →  │
│  Burn fluids (Parkland)          →  │
│                                     │
│  CARDIAC & RESPIRATORY              │
│                                     │
│  MAP                             →  │
│  Cardiac index                   →  │
│  P/F ratio                       →  │
│  ABG interpretation              →  │
│                                     │
│  RENAL & METABOLIC                  │
│                                     │
│  GFR (CKD-EPI)                   →  │
│  Anion gap                       →  │
│  Corrected sodium                →  │
│  Corrected calcium               →  │
│  FENa                            →  │
│                                     │
│  RISK SCORES                        │
│                                     │
│  MEWS / NEWS2                    →  │
│  Glasgow Coma Scale              →  │
│  Apgar                           →  │
│  FLACC pain                      →  │
│                                     │
│  OTHER                              │
│                                     │
│  BMI                             →  │
│  BSA (Mosteller)                 →  │
│  Ideal body weight               →  │
│                                     │
└─────────────────────────────────────┘
[Library] [Ask] [Tools] [Profile]
```

### 4.13 Tools — Calculator detail (e.g., MAP)

```
┌─────────────────────────────────────┐
│  ←                          ☆  ⋯    │
│                                     │
│  ✦ CALCULATOR · CARDIOVASCULAR      │
│                                     │
│  Mean arterial                      │  ← Instrument Serif 52pt
│  pressure                           │
│                                     │
│  MAP                                │  ← italic abbreviation
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  SYSTOLIC                           │
│  ┌─────────────────────────┐        │
│  │ 110             mmHg    │        │
│  └─────────────────────────┘        │
│                                     │
│  DIASTOLIC                          │
│  ┌─────────────────────────┐        │
│  │  60             mmHg    │        │
│  └─────────────────────────┘        │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  76.7  mmHg                         │  ← serif 72pt; "mmHg" italic 24pt
│                                     │
│  Within target range (>65)          │  ← italic interpretation
│                                     │
│  MAP = DBP + (SBP − DBP) ÷ 3        │  ← mono show-work
│      = 60 + (110 − 60) ÷ 3          │
│      = 76.7 mmHg                    │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Clinical context                   │
│                                     │
│  MAP > 65 is the standard target    │
│  for adequate organ perfusion in    │
│  most adult patients.¹              │
│                                     │
│  Higher targets (75–85) may be used │
│  in chronic hypertension, certain   │
│  neuro patients, or per facility    │
│  protocol.                          │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  CITATIONS                          │
│  1.  SCCM Surviving Sepsis 2021     │
│                                     │
└─────────────────────────────────────┘
```

### 4.14 Profile

```
┌─────────────────────────────────────┐
│                                     │
│  ✦ ACCOUNT                          │
│                                     │
│  Profile                            │  ← Instrument Serif 56pt
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Sarah Chen                         │  ← serif 22pt
│  sarah@example.com                  │  ← caption
│  Pro · Annual                       │  ← italic
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  PERSONALIZATION                    │
│                                     │
│  Career stage     Early career   →  │
│  Units            ICU, Tele      →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  PREFERENCES                        │
│                                     │
│  Theme            Auto           →  │
│  Default units    US (mmHg, lb)  →  │
│  Notifications    Weekly tip     →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  SUBSCRIPTION                       │
│                                     │
│  Plan             Yearly ($99.99) → │
│  Renews           May 3, 2027  →    │
│  Restore purchase                →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  SUPPORT                            │
│                                     │
│  Send feedback                   →  │
│  Help center                     →  │
│  Privacy policy                  →  │
│  Terms of service                →  │
│  Clinical advisors               →  │
│  Sources                         →  │
│                                     │
│  ─────────────────────────────────  │
│                                     │
│  Sign out                           │
│  Delete account                     │  ← Apple required
│                                     │
│  NurseMind v1.0.0 (build 100)       │  ← caption tertiary
│                                     │
└─────────────────────────────────────┘
```

---

## 5. Design system (Eden-aligned)

### 5.1 Color tokens

```swift
// LIGHT MODE
Color.bgPrimary       = #F4F2EC   // page background — cool sage cream
Color.bgElevated      = #FBFAF6   // cards, inputs (slight warm lift)
Color.bgSecondary     = #EDEAE2   // secondary surfaces
Color.bgTertiary      = #E5E1D6   // outer frame, between cards

Color.border          = #D9D4C7   // primary divider hairline
Color.borderSubtle    = #E5E1D6   // input borders, subtle row dividers
Color.borderStrong    = #1A1F1A   // selection, focus

Color.textPrimary     = #1A1F1A   // deep green-black (NOT pure black)
Color.textSecondary   = #4A4F47
Color.textTertiary    = #8B8A82
Color.textQuaternary  = #BAB7AC

Color.accent          = #1A2E1F   // deep forest green (Eden button)
Color.accentHover     = #0F1E12
Color.onAccent        = #FAFAF6   // text on accent button

Color.alertHigh       = #8B3220   // ISMP high-alert flag — warm rust red
Color.alertHighBg     = #F0E1DA   // pill background
Color.alertHighBorder = #DCC8BD

// DARK MODE (auto-derived)
Color.bgPrimary       = #14130F
Color.bgElevated      = #1F1E18
Color.bgSecondary     = #1A1914
Color.bgTertiary      = #0F0E0A

Color.border          = #2D2B22
Color.borderSubtle    = #1F1E18

Color.textPrimary     = #F4F2EC
Color.textSecondary   = #BAB7AC
Color.textTertiary    = #8B8A82

Color.accent          = #5A8C6E   // brighter forest in dark mode
```

### 5.2 Background grain texture

A barely-visible film-grain noise applied across all primary backgrounds. Single inline SVG (240x240, ~6% opacity), tiled. Implemented in SwiftUI:

```swift
struct GrainBackground: View {
    var body: some View {
        Image("grain-noise")  // bundled 240x240 PNG, prerendered
            .resizable(resizingMode: .tile)
            .opacity(0.06)
            .blendMode(.multiply)
            .allowsHitTesting(false)
    }
}
```

Apply over the root `Color.bgPrimary` of every screen. Not negotiable — this is the texture difference between "good clean" and "Eden-tier."

### 5.3 Typography

**Display:** Instrument Serif (free, SIL Open Font License, bundled into app)
**Body:** Inter (free, Google Fonts) or system SF Pro Text fallback
**Numerics:** SF Mono (system)

```swift
extension Font {
    // Display serif — the elegance
    static let displayHero      = Font.custom("InstrumentSerif-Regular", size: 96)   // -3 tracking
    static let displayXL        = Font.custom("InstrumentSerif-Regular", size: 56)   // -1.6 tracking
    static let displayLG        = Font.custom("InstrumentSerif-Regular", size: 44)   // -1.2 tracking
    static let displayMD        = Font.custom("InstrumentSerif-Regular", size: 28)   // -0.6 tracking
    static let displaySM        = Font.custom("InstrumentSerif-Regular", size: 22)   // -0.4 tracking
    static let displayXS        = Font.custom("InstrumentSerif-Regular", size: 19)   // -0.3 tracking
    
    // Display italic — for accents
    static let displayItalicLG  = Font.custom("InstrumentSerif-Italic", size: 24)
    static let displayItalicMD  = Font.custom("InstrumentSerif-Italic", size: 20)
    static let displayItalicSM  = Font.custom("InstrumentSerif-Italic", size: 16)
    
    // Body sans
    static let bodyLG           = Font.custom("Inter-Regular", size: 17)   // chat, long reading
    static let body             = Font.custom("Inter-Regular", size: 15)
    static let bodySM           = Font.custom("Inter-Regular", size: 13)
    static let title            = Font.custom("Inter-SemiBold", size: 17)
    
    // Labels (uppercase eyebrows)
    static let label            = Font.custom("Inter-Medium", size: 11)    // 1.6 tracking, uppercase
    static let labelSM          = Font.custom("Inter-Medium", size: 10)    // 1.6 tracking, uppercase
    
    // Numerics
    static let monoDisplay      = Font.system(size: 36, weight: .regular, design: .monospaced)
    static let monoXL           = Font.system(size: 17, weight: .regular, design: .monospaced)
    static let mono             = Font.system(size: 14, weight: .regular, design: .monospaced)
    static let monoSM           = Font.system(size: 13, weight: .regular, design: .monospaced)
    
    // Hero numerics — for calculator outputs (uses Instrument Serif tabular figures)
    static let heroNumber       = Font.custom("InstrumentSerif-Regular", size: 72)
}

extension Text {
    func displayHero() -> some View {
        self.font(.displayHero)
            .tracking(-3)
            .lineSpacing(-8)
    }
    
    func displayXL() -> some View {
        self.font(.displayXL)
            .tracking(-1.6)
    }
    
    func eyebrow() -> some View {
        self.font(.label)
            .tracking(1.6)
            .textCase(.uppercase)
            .foregroundStyle(Color.textTertiary)
    }
}
```

### 5.4 Spacing scale

```
4 / 8 / 12 / 16 / 20 / 24 / 32 / 40 / 56 / 80

Vertical rhythm:
  Between sections within a page:    32–40pt
  Between section header + content:  20pt
  Between bullets in a list:          14pt
  Between rows in a key/value table:  12pt vertical padding

Horizontal:
  Standard screen margin:             20pt (iPhone)
  Between icon + label in row:        12pt
  Between bullet + text:              12pt
```

### 5.5 Component primitives

**Primary button (deep forest green):**
```
Background:     Color.accent (#1A2E1F)
Text:           Color.onAccent · Inter SemiBold 17pt
Height:         52pt
Corner radius:  14pt
Padding:        20pt horizontal
Shadow:         0 1px 3px rgba(0,0,0,0.2)
Pressed:        opacity 0.9
Disabled:       Color.textQuaternary background
```

**Secondary button (outline):**
```
Background:     transparent
Border:         1pt Color.border
Text:           Color.textPrimary · Inter Regular 17pt
Height:         52pt
Corner radius:  14pt
```

**Tertiary (text link):**
```
Text:           Color.textSecondary · Inter Regular 15pt
                or italic Instrument Serif 15pt for editorial feel
No background, no border
Pressed:        Color.textPrimary
```

**Input field:**
```
Background:     Color.bgElevated
Border:         1pt Color.border
Corner radius:  12pt
Height:         52pt
Padding:        14pt horizontal
Text:           Inter Regular 17pt (or SF Mono for numeric)
Focus:          border → Color.borderStrong
Placeholder:    Color.textTertiary
```

**Eyebrow label (the Eden signature):**
```
✦ [LABEL TEXT]
  Sparkles icon (11pt, 1.5 stroke, textTertiary)
  Inter Medium 11pt, 1.6 tracking, uppercase, textTertiary
  
Use above every screen header, every major section break,
and at the start of every AI message.
```

**List row:**
```
Min height:     56pt
Padding:        16pt vertical, 0 horizontal (margin handled by parent)
Divider:        1pt Color.border below (none on last row)
Press state:    bg → Color.bgSecondary
Chevron:        SF Symbol chevron.right · 16pt · Color.textTertiary
```

**Section header (within an entry):**
```
Top padding:    32pt
Bottom padding: 18pt
Text:           Instrument Serif 28pt (.displayMD)
Tracking:       -0.6
Color:          Color.textPrimary
```

**High-alert pill:**
```
Inline-block, 6px 11px padding, 4pt corner radius
Background:    Color.alertHighBg (#F0E1DA)
Border:        1pt Color.alertHighBorder
Text:          Inter Medium 10pt, 1.5 tracking, uppercase, Color.alertHigh
Content:       "HIGH-ALERT MEDICATION"
```

**Tab bar:**
```
Height:         49pt + safe area
Background:     Color.bgPrimary with grain
Top border:     0.7pt Color.border
Active icon:    Color.textPrimary, 2.0 stroke
Inactive icon:  Color.textTertiary, 1.5 stroke
Active label:   Inter Medium 10pt, Color.textPrimary
Inactive label: Inter Regular 10pt, Color.textTertiary
```

### 5.6 Iconography

- SF Symbols only. No custom icons except the app icon and the ✦ sparkle (Lucide `Sparkles` equivalent).
- Stroke weight: 1.5 default, 2.0 for active states
- Forbidden: emojis, stickers, illustrated elements, animated icons, gradients

### 5.7 Motion

- **Spring** (response 0.35, damping 0.85) for screen transitions and modals
- **Linear ease 200ms** for color/opacity state changes
- **No bouncing**, no playful overshoots
- **AI streaming:** token-by-token append with cursor blink — feels natural and signals "thinking"
- **Tab switches:** instant (no animation, like iOS native)

### 5.8 The "feel" rules — non-negotiable

1. **White space breathes.** Don't fill it with decoration.
2. **One accent, used sparingly.** Deep forest green appears only on primary CTAs and the AI send button. Nowhere else.
3. **Numbers in mono, language in serif, body in sans.** This pairing is the elegance.
4. **Hairlines, not cards.** Dividers separate content; cards over-package it.
5. **Editorial, not chat-bubble.** Conversations read like a document, not a text thread.
6. **Italic is a deliberate gesture.** Use it on subtitles, footers, accent words, citation source names — never randomly.
7. **Quiet by default.** No badges, no notification dots, no "NEW" labels, no popups unless triggered by user action.
8. **Eyebrows + serif title** is the page-header pattern. Every screen.

---

## 6. Data model & content architecture

### 6.1 Database — Supabase Postgres

```sql
-- ──────────────────────────────────────────────────
-- USERS
-- ──────────────────────────────────────────────────
CREATE TABLE users (
  id UUID PRIMARY KEY,
  email TEXT UNIQUE NOT NULL,
  display_name TEXT,
  career_stage TEXT NOT NULL CHECK (career_stage IN ('student','new_grad','early','experienced','charge')),
  units TEXT[] NOT NULL,                    -- ['icu_med','tele']
  created_at TIMESTAMPTZ DEFAULT NOW(),
  last_active_at TIMESTAMPTZ,
  subscription_tier TEXT NOT NULL DEFAULT 'free',
  subscription_renews_at TIMESTAMPTZ,
  trial_ends_at TIMESTAMPTZ,
  preferences JSONB DEFAULT '{}',
  -- preferences: { theme: 'auto'|'light'|'dark', units_system: 'us'|'si', notifications: bool }
  apple_user_id TEXT,                       -- for Sign in with Apple
  revenuecat_user_id TEXT
);

CREATE INDEX users_subscription_idx ON users(subscription_tier);

-- ──────────────────────────────────────────────────
-- LIBRARY CONTENT (read-only by users; written by content team)
-- ──────────────────────────────────────────────────
CREATE TABLE library_entries (
  id UUID PRIMARY KEY,
  category TEXT NOT NULL CHECK (category IN ('drug','drip','lab','procedure','diagnosis','scenario','communication','reference')),
  slug TEXT UNIQUE NOT NULL,
  title TEXT NOT NULL,
  subtitle TEXT,
  body JSONB NOT NULL,                      -- structured, see 6.2
  unit_relevance TEXT[],                    -- units this is most relevant for
  career_stage_min TEXT,
  high_alert BOOLEAN DEFAULT FALSE,
  search_vector TSVECTOR,                   -- generated column for FTS
  citations JSONB NOT NULL,                 -- [{id, title, source, url, tier}]
  reviewer_id UUID REFERENCES clinical_reviewers,
  reviewed_at TIMESTAMPTZ NOT NULL,
  version INT NOT NULL DEFAULT 1,
  is_published BOOLEAN DEFAULT FALSE,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX library_search_idx ON library_entries USING GIN(search_vector);
CREATE INDEX library_category_idx ON library_entries(category);
CREATE INDEX library_unit_idx ON library_entries USING GIN(unit_relevance);
CREATE INDEX library_published_idx ON library_entries(is_published);

-- Trigger to auto-update search_vector
CREATE FUNCTION library_search_update() RETURNS trigger AS $$
BEGIN
  NEW.search_vector :=
    setweight(to_tsvector('english', coalesce(NEW.title, '')), 'A') ||
    setweight(to_tsvector('english', coalesce(NEW.subtitle, '')), 'B') ||
    setweight(to_tsvector('english', coalesce(NEW.body::text, '')), 'C');
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER library_search_trigger BEFORE INSERT OR UPDATE
  ON library_entries FOR EACH ROW EXECUTE FUNCTION library_search_update();

-- ──────────────────────────────────────────────────
-- CLINICAL REVIEWERS (named on every entry — credibility)
-- ──────────────────────────────────────────────────
CREATE TABLE clinical_reviewers (
  id UUID PRIMARY KEY,
  name TEXT NOT NULL,
  credentials TEXT NOT NULL,                -- "MSN, RN, CCRN"
  bio TEXT,
  is_active BOOLEAN DEFAULT TRUE,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

-- ──────────────────────────────────────────────────
-- CITATION SOURCES (reused across entries)
-- ──────────────────────────────────────────────────
CREATE TABLE citation_sources (
  id UUID PRIMARY KEY,
  short_name TEXT NOT NULL,                 -- "Surviving Sepsis 2021"
  full_name TEXT NOT NULL,
  publisher TEXT,
  url TEXT,
  trust_tier INT NOT NULL,                  -- 1 = curated library, 5 = peer-reviewed open access
  last_verified_at TIMESTAMPTZ
);

-- ──────────────────────────────────────────────────
-- USER PINS
-- ──────────────────────────────────────────────────
CREATE TABLE user_pins (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  entry_id UUID REFERENCES library_entries(id) ON DELETE CASCADE,
  pinned_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, entry_id)
);

-- ──────────────────────────────────────────────────
-- USER RECENTS (capped at 50, FIFO)
-- ──────────────────────────────────────────────────
CREATE TABLE user_recents (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  entry_id UUID REFERENCES library_entries(id) ON DELETE CASCADE,
  viewed_at TIMESTAMPTZ DEFAULT NOW(),
  PRIMARY KEY (user_id, entry_id)
);

-- ──────────────────────────────────────────────────
-- AI CONVERSATIONS (PHI-stripped)
-- ──────────────────────────────────────────────────
CREATE TABLE ai_conversations (
  id UUID PRIMARY KEY,
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  title TEXT,                               -- auto-generated from first message
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE TABLE ai_messages (
  id UUID PRIMARY KEY,
  conversation_id UUID REFERENCES ai_conversations(id) ON DELETE CASCADE,
  role TEXT NOT NULL CHECK (role IN ('user','assistant','system')),
  content TEXT NOT NULL,                    -- PHI-stripped
  citations JSONB,                          -- [{id, source, library_entry_id?}]
  retrieved_chunks JSONB,                   -- chunks fed to model (for QA)
  flagged_at TIMESTAMPTZ,
  flag_reason TEXT,
  flag_user_note TEXT,
  reviewed_at TIMESTAMPTZ,
  review_outcome TEXT,                      -- ok | content_fix | prompt_fix | training
  rating TEXT,                              -- thumbs_up | thumbs_down | null
  refusal_type TEXT,                        -- diagnosis | prescribing | scope | low_confidence | phi
  intent_classification TEXT,
  latency_ms INT,
  tokens_in INT,
  tokens_out INT,
  model_version TEXT,
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX ai_msg_conv_idx ON ai_messages(conversation_id);
CREATE INDEX ai_msg_flagged_idx ON ai_messages(flagged_at) WHERE flagged_at IS NOT NULL;
CREATE INDEX ai_msg_unreviewed_idx ON ai_messages(flagged_at, reviewed_at)
  WHERE flagged_at IS NOT NULL AND reviewed_at IS NULL;

-- ──────────────────────────────────────────────────
-- AI RATE LIMITING (free tier: 5/day)
-- ──────────────────────────────────────────────────
CREATE TABLE ai_usage (
  user_id UUID REFERENCES users(id) ON DELETE CASCADE,
  date DATE NOT NULL,
  question_count INT NOT NULL DEFAULT 0,
  PRIMARY KEY (user_id, date)
);

-- ──────────────────────────────────────────────────
-- VECTOR EMBEDDINGS (for RAG)
-- ──────────────────────────────────────────────────
CREATE EXTENSION IF NOT EXISTS vector;

CREATE TABLE library_chunks (
  id UUID PRIMARY KEY,
  entry_id UUID REFERENCES library_entries(id) ON DELETE CASCADE,
  section_type TEXT,                        -- which body section this came from
  content TEXT NOT NULL,                    -- the chunk text
  embedding vector(1536),                   -- OpenAI text-embedding-3-small
  citation_ids TEXT[],                      -- citations associated with this chunk
  created_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX library_chunks_embed_idx ON library_chunks
  USING ivfflat (embedding vector_cosine_ops) WITH (lists = 100);
CREATE INDEX library_chunks_entry_idx ON library_chunks(entry_id);

-- ──────────────────────────────────────────────────
-- CALCULATOR USAGE (anonymized analytics)
-- ──────────────────────────────────────────────────
CREATE TABLE calculator_usage (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID,                             -- nullable for anonymous
  calculator_id TEXT NOT NULL,
  used_at TIMESTAMPTZ DEFAULT NOW()
  -- NO input/output values stored (PHI safety)
);

-- ──────────────────────────────────────────────────
-- AUDIT LOG (compliance baseline)
-- ──────────────────────────────────────────────────
CREATE TABLE audit_log (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id UUID,
  event_type TEXT NOT NULL,
  metadata JSONB,
  ip_address INET,                          -- hashed after 30 days
  user_agent TEXT,
  occurred_at TIMESTAMPTZ DEFAULT NOW()
);

CREATE INDEX audit_user_time_idx ON audit_log(user_id, occurred_at DESC);

-- ──────────────────────────────────────────────────
-- ROW-LEVEL SECURITY
-- ──────────────────────────────────────────────────
ALTER TABLE users ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_pins ENABLE ROW LEVEL SECURITY;
ALTER TABLE user_recents ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_conversations ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_messages ENABLE ROW LEVEL SECURITY;
ALTER TABLE ai_usage ENABLE ROW LEVEL SECURITY;

-- Users can only read/write their own data
CREATE POLICY user_self_access ON users
  FOR ALL USING (auth.uid() = id);

CREATE POLICY pins_self_access ON user_pins
  FOR ALL USING (auth.uid() = user_id);

-- (Similar policies for other user-scoped tables)

-- Library is read-only for all authenticated users
ALTER TABLE library_entries ENABLE ROW LEVEL SECURITY;
CREATE POLICY library_read ON library_entries
  FOR SELECT USING (is_published = TRUE);
```

### 6.2 Library entry body schema (JSONB)

Every entry uses a structured body that the iOS app renders through a single `EntryRenderer`. New entries don't require new code.

```json
{
  "type": "drug",
  "sections": [
    {
      "type": "key_value_table",
      "title": "Quick reference",
      "rows": [
        {"key": "Class", "value": "α/β agonist"},
        {"key": "Onset", "value": "Immediate"},
        {"key": "Half-life", "value": "2–3 minutes"},
        {"key": "Standard concentration", "value": "4 mg / 250 mL D5W or NS"}
      ]
    },
    {
      "type": "prose",
      "title": "Dosing",
      "body": "Adult: 0.05–3 mcg/kg/min titrated to MAP > 65.",
      "citations": ["c001"]
    },
    {
      "type": "calculator_link",
      "calculator_id": "drip_norepi",
      "label": "Open drip calculator"
    },
    {
      "type": "bullet_list",
      "title": "Nursing implications",
      "items": [
        {
          "text": "Central line preferred; extravasation causes tissue necrosis. Phentolamine is the antidote.",
          "citations": ["c002"]
        },
        {
          "text": "Monitor MAP, HR, urine output, extremity perfusion.",
          "citations": []
        }
      ]
    },
    {
      "type": "bullet_list",
      "title": "Watch for",
      "items": [
        {"text": "Hypertension, reflex bradycardia, arrhythmia", "citations": []},
        {"text": "Extravasation (peripheral use)", "citations": []},
        {"text": "Tachyphylaxis with prolonged high-dose use", "citations": []}
      ]
    }
  ],
  "high_alert": true,
  "tags": ["pressor", "catecholamine", "icu"],
  "linked_entries": ["map_calculator", "septic_shock_scenario"]
}
```

**Section types supported by EntryRenderer:**
- `key_value_table` — two-column table, mono values
- `prose` — paragraphs of text
- `bullet_list` — bulleted items with optional citations
- `numbered_steps` — for scenarios and procedures
- `calculator_link` — button that deep-links to a calculator
- `inline_calculator` — embedded calculator in entry (for drips)
- `inline_interpreter` — embedded interpreter (for labs)
- `code_dose_card` — emergency dose display (for codes)
- `image` — diagrams (rare in v1)
- `divider` — explicit section break

### 6.3 Content sourcing strategy

**Tier 1 (free, US government / public domain):**
- openFDA drug labeling API
- DailyMed / RxNorm / MedlinePlus
- AHRQ guidelines
- CDC clinical guidelines
- AHFS Patient Medication Information
- NIH StatPearls (open-access reference)

**Tier 2 (professional society guidelines — cite, don't reproduce):**
- AHA, ACLS, PALS, NRP
- AACN procedure standards
- SCCM Surviving Sepsis Campaign
- ADA diabetes guidelines
- ARDS Network protocols

**Tier 3 (peer-reviewed, open-access):**
- PubMed Central nursing literature
- Cochrane reviews (abstracts free)
- BMJ Open

**Tier 4 (commissioned by clinical advisor):**
- Nursing implications synthesis
- Scenario playbooks
- SBAR scripts and communication templates
- Unit-specific contextualization

**Licensing principle:** Cite, paraphrase, never reproduce. Every clinical claim is restated in your clinical advisor's words and cited to the original source. Davis's Drug Guide and UpToDate/Lexicomp are off-limits to license affordably as a solo founder.

### 6.4 Content production target

**v1 launch (90 days):**
- 50 drugs (Med-Surg + ICU)
- 15 drips (ICU)
- 30 labs (universal)
- 20 procedures (Med-Surg + ICU)
- 25 diagnoses (Med-Surg + ICU)
- 30 scenarios (universal)
- 20 SBAR templates (universal)
- 15 reference entries

**Total v1: ~205 entries.** All reviewed by clinical advisor before publication. No entry ships without sign-off.

---

## 7. AI co-pilot architecture (the deep section)

This is the riskiest part of the build. Every detail here matters.

### 7.1 Pipeline overview

```
User input from iOS
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 1 — Client-side rate limiting                      │
│ Free tier: hard-block at 3 questions/day                │
│ Pro/Lifetime: unlimited                                 │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 2 — Edge function: PHI scrubber                    │
│ Regex pass over input                                   │
│ Returns: { scrubbed_text, redacted: bool }              │
│ If redacted: client shows toast warning                 │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 3 — Edge function: Intent classifier (Haiku)       │
│ Classifies: nursing_clinical | diagnostic_request |     │
│             prescribing_request | non_clinical |        │
│             patient_facing | low_clarity                │
│ Cost: ~$0.0007 / request                                │
└─────────────────────────────────────────────────────────┘
    │
    ├── If refusal category: stream refusal template, log
    │
    ▼ (if nursing_clinical)
┌─────────────────────────────────────────────────────────┐
│ STEP 4 — RAG retrieval                                  │
│ Embed query (text-embedding-3-small, 1536 dim)         │
│ pgvector cosine search → top 8 chunks                   │
│ Each chunk has: text, source_id, library_entry_id      │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 5 — Context assembly                               │
│ System prompt + user context (career, unit) +           │
│ retrieved chunks + last 6 turns of conversation +       │
│ user message                                            │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 6 — Claude Haiku 4.5 generation                    │
│ Streaming response, prompt caching on system prefix     │
│ Cost: ~$0.006 / request (was ~$0.020 on Sonnet 4.7)     │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 7 — Response validator                             │
│ • Citation check (regex)                                │
│ • Hallucinated citation check (every cite ID exists)   │
│ • PHI re-check (no entity-like names)                   │
│ • Length check (under 500 words)                        │
│ Fail → regenerate with stronger prompt                  │
│ 2nd fail → low_confidence refusal template              │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 8 — Stream to client                               │
│ Token-by-token render in iOS                            │
│ Sources rendered at end of stream                       │
└─────────────────────────────────────────────────────────┘
    │
    ▼
┌─────────────────────────────────────────────────────────┐
│ STEP 9 — Log to ai_messages                             │
│ Includes: scrubbed text, retrieved chunks, citations,  │
│ refusal type, latency, tokens, model version           │
└─────────────────────────────────────────────────────────┘
```

### 7.2 PHI scrubber (Step 2) — implementation

```typescript
// Supabase Edge Function: phi-scrubber.ts

const PHI_PATTERNS: Array<[RegExp, string]> = [
  // Titles + names
  [/\b(?:Mr|Mrs|Ms|Dr|Mx)\.?\s+[A-Z][a-z]+(?:\s+[A-Z][a-z]+)?\b/g, '[name]'],
  // Two capitalized words followed by clinical verb
  [/\b[A-Z][a-z]+\s+[A-Z][a-z]+(?=\s+(?:is|was|came in|presented|admitted|complained))/g, '[name]'],
  // MRN labeled
  [/\bMRN\s*:?\s*\d{6,}\b/gi, '[mrn]'],
  // Long numeric IDs (excluding obvious doses)
  [/\b\d{6,12}\b(?!\s*(?:mg|mcg|mL|ml|kg|lb|cc|units|U|gtt))/g, '[id]'],
  // Date formats
  [/\b(?:0?[1-9]|1[0-2])[\/\-](?:0?[1-9]|[12]\d|3[01])[\/\-](?:\d{2}|\d{4})\b/g, '[date]'],
  // Room/bed identifiers
  [/\b(?:Room|Bed|Bay)\s*\d+[A-Z]?\b/gi, '[room]'],
  // SSN format
  [/\b\d{3}-\d{2}-\d{4}\b/g, '[ssn]'],
];

export function scrubPHI(text: string): { scrubbed: string; redacted: boolean } {
  let result = text;
  let redacted = false;
  
  for (const [pattern, replacement] of PHI_PATTERNS) {
    if (pattern.test(result)) {
      redacted = true;
      result = result.replace(pattern, replacement);
    }
  }
  
  return { scrubbed: result, redacted };
}
```

**Test coverage requirement:** 100% of PHI patterns covered in unit tests, plus a corpus of 200 real (synthetic) nurse questions to verify no false positives on legitimate content (e.g., "MAP > 65", "1000 mL bolus").

### 7.3 Intent classifier (Step 3)

Claude Haiku call, ~200 input + 100 output tokens.

```
SYSTEM PROMPT:

You classify nurse questions into one of six categories. Output ONLY the category, no explanation.

Categories:
- nursing_clinical: Question about drugs, drips, labs, procedures, scenarios, assessments, equipment, or nursing actions. (90% of cases)
- diagnostic_request: User is asking for a diagnosis ("what does this patient have", "is this sepsis").
- prescribing_request: User is asking what medication or dose to give ("should I give X", "what dose for Y").
- patient_facing: User appears to be a patient or family member, not a nurse.
- non_clinical: Off-topic, personal, or not related to nursing practice.
- low_clarity: Question is too vague or unclear to classify.

USER QUESTION:
{user_message}
```

### 7.4 RAG retrieval (Step 4)

**Embedding:** OpenAI `text-embedding-3-small` (1536 dim, $0.02/1M tokens). Cost-effective and proven.

**Vector DB:** pgvector inside Supabase for v1. Migrate to dedicated Pinecone if scale demands at v2.

**Chunking strategy:** Each library entry's `body.sections` are chunked individually. A drug entry produces 4–6 chunks (one per section). This produces better recall than chunking by tokens.

**Retrieval:** Cosine similarity, top 8 chunks. No re-ranking in v1 (add cross-encoder at v2 if needed).

**Re-embedding:** Whenever content is edited, all associated chunks re-embedded automatically via Supabase trigger.

```sql
-- Retrieval query
SELECT 
  lc.id,
  lc.entry_id,
  lc.section_type,
  lc.content,
  lc.citation_ids,
  le.title,
  le.category,
  1 - (lc.embedding <=> $1::vector) AS similarity
FROM library_chunks lc
JOIN library_entries le ON lc.entry_id = le.id
WHERE le.is_published = TRUE
ORDER BY lc.embedding <=> $1::vector
LIMIT 8;
```

### 7.5 The system prompt (Step 5–6) — full text

```
You are NurseMind, an evidence-based clinical reference assistant for licensed and student nurses.

# YOUR ROLE
You help nurses think through clinical situations, drug references, lab interpretation, and procedural questions. You are a reference, not a decision-maker. The licensed nurse and the provider are always the decision-makers.

# ANSWERING RULES

1. GROUNDING: Only make clinical claims that are grounded in the provided context. Every dose, range, threshold, or specific recommendation MUST include a citation in square brackets like [c001] or [c002], referring to citation IDs in the context.

2. CONFIDENCE: If the context does not contain enough information to answer with confidence, say so explicitly. Do not guess. Recommend the user consult their facility's policy, charge nurse, or pharmacist.

3. FRAMING: Frame answers in terms of "what the nurse should assess and do" — never "what the patient has."
   ✓ "If a patient presents with these signs, you'd typically assess for..."
   ✗ "The patient has sepsis."
   ✓ "What you'd typically prepare for..."
   ✗ "I'd recommend giving..."

4. SCOPE — REFUSE THESE:
   - Diagnostic requests ("what does the patient have"): Redirect to assessment.
   - Prescribing requests ("should I give X mg"): Explain medication, redirect to provider.
   - Patient-facing advice: Redirect to provider.
   - Non-clinical questions: "I'm built for nursing reference questions."

5. FOOTER: Every clinical answer ends with: "Reference only — always follow your facility's policies and verify with your provider."

# STYLE
- Direct, calm, professional. Like a senior nurse explaining to a junior nurse.
- No emojis. No exclamation points. No "great question!" preambles.
- Lead with the answer, then context, then sources.
- Use bullet lists for procedural steps and assessment items.
- Numerical values in plain text (the iOS app renders them in monospace automatically).
- Keep responses under 400 words unless the topic genuinely requires more.

# USER CONTEXT
- Career stage: {career_stage}
- Primary unit(s): {units}
- Adapt depth accordingly: students get more foundational context, experienced nurses get terser, denser responses.

# CONVERSATION HISTORY (last 6 turns)
{conversation_history}

# RETRIEVED CONTEXT
{retrieved_chunks}

Each chunk is formatted as:
[c00X] (source: [source_name]) [chunk text]

When you make a claim from a chunk, cite it like: "Norepinephrine is titrated to MAP > 65 [c001]."

# USER QUESTION
{scrubbed_user_message}
```

### 7.6 Refusal templates — exact text

**Diagnostic redirect:**
```
I can't suggest a diagnosis — that's the provider's call. But I can help you think about what to assess and report.

Based on what you described, here's what would be useful to gather before calling the provider:

[Assistant-generated assessment list relevant to the scenario]

Reference only — always follow your facility's policies and verify with your provider.
```

**Prescribing redirect:**
```
The decision to give a medication is the provider's, based on the orders they write. I can help you understand the medication itself — its action, nursing implications, what to monitor, and what to watch for.

Would you like to know about [medication mentioned]?
```

**PHI detected (prepended to response):**
```
It looks like you may have entered patient information. I removed it before processing.

Reminder: NurseMind is a reference tool — please describe situations in general terms only.

[Then proceeds with response based on scrubbed text]
```

**Low confidence:**
```
I don't have high-confidence sources for that specific question. I'd recommend:

  •  Your facility's policy or protocol
  •  Your charge nurse or pharmacist
  •  Davis's Drug Guide or Lexicomp for drug specifics

Reference only — always follow your facility's policies and verify with your provider.
```

**Non-clinical:**
```
I'm built for nursing reference questions. Try asking me about a drug, drip, lab, scenario, or anything you'd typically look up at the bedside.
```

**Patient-facing:**
```
NurseMind is a reference for licensed and student nurses, not for patients or family members. Please direct medical questions to your healthcare provider.
```

### 7.7 Response validator (Step 7)

Server-side regex + lookup checks before streaming to client:

**Citation check:**
```typescript
// Every numerical clinical claim must have a citation
const claimPatterns = [
  /\b\d+(?:\.\d+)?\s*(?:mg|mcg|mL|ml|kg|lb|cc|units|U)/gi,        // doses
  /\b\d+(?:\.\d+)?\s*(?:mmol\/L|mEq\/L|mg\/dL|mmHg)/gi,           // values
  /\bMAP\s*[><]\s*\d+/gi,                                          // thresholds
];

function hasUnsupportedClaim(response: string): boolean {
  for (const pattern of claimPatterns) {
    const matches = response.matchAll(pattern);
    for (const match of matches) {
      // Check if a citation [cXXX] appears within 100 characters
      const start = Math.max(0, match.index! - 100);
      const end = Math.min(response.length, match.index! + match[0].length + 100);
      const context = response.slice(start, end);
      if (!/\[c\d+\]/.test(context)) {
        return true;
      }
    }
  }
  return false;
}
```

**Hallucinated citation check:**
```typescript
// Every [cXXX] in response must exist in retrieved_chunks
function hasHallucinatedCitations(response: string, validCitationIds: Set<string>): boolean {
  const cited = response.matchAll(/\[c\d+\]/g);
  for (const match of cited) {
    if (!validCitationIds.has(match[0].slice(1, -1))) {
      return true;
    }
  }
  return false;
}
```

**On validation failure:** Re-prompt with "Your previous response had unsupported clinical claims. Please regenerate, citing every numerical value or threshold." If second attempt fails, fall through to low_confidence template.

### 7.8 Cost model & projections

| Component | Cost per question |
|---|---|
| Embedding (OpenAI) | $0.000003 |
| Haiku classifier | $0.0007 |
| Haiku 4.5 generation (~8K in cached, 400 out) | $0.006 |
| **Total** | **~$0.007** |

**At scale (with Haiku 4.5 + 3-question lifetime free trial):**
- Average Pro user: 3 questions/day → ~$0.65/user/month
- Heavy Pro user: 15 questions/day → ~$3.20/user/month
- Free user (3 questions LIFETIME, not daily): max ~$0.02 ever, then upgrade or churn

Previous spec used Sonnet 4.7 at $0.020/question and a 3/day free tier — total burn at 100K users was ~$35K/mo. After the Haiku 4.5 switch + 3-lifetime free, projected burn at 100K users is ~$3K/mo (10× reduction).

**At $14.99/mo or $99.99/yr ($8.33/mo) Pro pricing:** AI cost is well within margins even for heavy users. Yearly net via Apple SBP (~$85) covers ~$15/year typical AI usage with 80% margin; heavy-user worst case ($24/mo at 50/day cap) still profitable. Free tier cost is acceptable as marketing.

**Projected monthly AI cost at scale:**

| Stage | Pro users | Free users | Monthly AI cost |
|---|---|---|---|
| Month 6 | 6,000 | 30,000 | $7K + $30K = $37K |
| Month 12 | 15,000 | 80,000 | $18K + $80K = $98K |
| Month 24 | 35,000 | 200,000 | $42K + $200K = $242K |

At month 12, AI cost (~$98K) against MRR (~$100K from Pro alone) is concerning. Mitigations:
1. **Cache common questions** — many "what is X?" queries have the same answer; cache with 24-hour TTL.
2. **Free tier abuse detection** — same question 3+ times from same IP → soft rate limit
3. **Move free tier from 5/day to 3/day** if economics tighten
4. **Negotiate volume discount** with Anthropic at $50K+/month spend

### 7.9 Continuous improvement loop

**Daily (automated):**
- Random 5% sample of all messages logged for QA review
- All flagged messages routed to clinical advisor queue
- Cost per user dashboard updated

**Weekly (clinical advisor):**
- Review all flagged messages from past week
- Categorize: ok / content_fix / prompt_fix / training
- Update content for content_fix items
- Update system prompt for prompt_fix items
- Document patterns in monthly QA report

**Monthly (founder + advisor):**
- Review trends: refusal rates, flag rates, low-confidence rates
- Tune system prompt based on patterns
- Decide on system prompt version bump
- Quality metrics report shared publicly (transparency)

### 7.10 Testing & validation before launch

**Internal beta (Weeks 7-9 of build):**
- 10 nurses recruited from network
- Each uses AI for 2 weeks
- Every single response reviewed by clinical advisor
- Categorize each: clean / minor issue / major issue
- Target: 95%+ clean before public beta

**Public closed beta (Weeks 12-13 of build):**
- 100 nurses from TestFlight
- Daily review of flag queue
- Track: refusal rate, flag rate, thumbs-up rate, retention
- Ship to App Store only when:
  - Refusal rate < 8%
  - Flag rate < 1.5%
  - Thumbs-up rate > 60% on un-flagged responses
  - Zero confirmed PHI leaks in logs

---

## 8. iOS Swift architecture

### 8.1 Project structure

```
NurseMind.xcodeproj
├── NurseMind/
│   ├── App/
│   │   ├── NurseMindApp.swift              ← @main entry
│   │   ├── AppCoordinator.swift            ← Root navigation
│   │   ├── AppEnvironment.swift            ← Dependency injection
│   │   └── AppState.swift                  ← Global @Observable state
│   ├── Features/
│   │   ├── Onboarding/
│   │   │   ├── OnboardingFlow.swift
│   │   │   ├── OnboardingViewModel.swift
│   │   │   └── Steps/
│   │   │       ├── WelcomeStep.swift
│   │   │       ├── CareerStageStep.swift
│   │   │       ├── UnitStep.swift
│   │   │       ├── SafetyContractStep.swift
│   │   │       ├── NotificationsStep.swift
│   │   │       └── PaywallStep.swift
│   │   ├── Library/
│   │   │   ├── LibraryHomeView.swift
│   │   │   ├── CategoryListView.swift
│   │   │   ├── EntryDetailView.swift
│   │   │   ├── EntryRenderer.swift         ← Renders body sections
│   │   │   ├── SectionRenderers/
│   │   │   │   ├── KeyValueTableRenderer.swift
│   │   │   │   ├── ProseRenderer.swift
│   │   │   │   ├── BulletListRenderer.swift
│   │   │   │   ├── NumberedStepsRenderer.swift
│   │   │   │   ├── CalculatorLinkRenderer.swift
│   │   │   │   ├── InlineCalculatorRenderer.swift
│   │   │   │   └── InlineInterpreterRenderer.swift
│   │   │   ├── CitationsView.swift
│   │   │   ├── HighAlertPill.swift
│   │   │   └── LibraryViewModel.swift
│   │   ├── Ask/
│   │   │   ├── AskHomeView.swift
│   │   │   ├── ConversationView.swift
│   │   │   ├── MessageRenderer.swift
│   │   │   ├── CitationView.swift
│   │   │   ├── RefusalView.swift
│   │   │   ├── FollowUpInput.swift
│   │   │   ├── StreamingTextView.swift
│   │   │   └── AskViewModel.swift
│   │   ├── Tools/
│   │   │   ├── CalculatorHubView.swift
│   │   │   ├── CalculatorView.swift
│   │   │   └── Calculators/
│   │   │       ├── DripRateCalculator.swift
│   │   │       ├── MAPCalculator.swift
│   │   │       ├── GFRCalculator.swift
│   │   │       └── ... (25 total)
│   │   ├── Profile/
│   │   │   ├── ProfileView.swift
│   │   │   ├── PreferencesView.swift
│   │   │   ├── SubscriptionView.swift
│   │   │   └── SourcesView.swift
│   │   ├── Search/
│   │   │   ├── SearchView.swift
│   │   │   ├── SearchViewModel.swift
│   │   │   └── SearchService.swift
│   │   └── Paywall/
│   │       └── PaywallView.swift
│   ├── Models/
│   │   ├── User.swift
│   │   ├── LibraryEntry.swift
│   │   ├── Conversation.swift
│   │   ├── ContentBody.swift               ← Codable for JSONB
│   │   └── Citation.swift
│   ├── Services/
│   │   ├── SupabaseClient.swift
│   │   ├── AnthropicStreamingClient.swift  ← Custom (no official Swift SDK)
│   │   ├── PHIScrubber.swift
│   │   ├── RevenueCatService.swift
│   │   ├── AnalyticsService.swift
│   │   ├── SearchService.swift
│   │   ├── OfflineCache.swift
│   │   └── HapticService.swift
│   ├── DesignSystem/
│   │   ├── Colors.swift                    ← All color tokens
│   │   ├── Typography.swift                ← Font scale + Text extensions
│   │   ├── Spacing.swift
│   │   ├── GrainBackground.swift
│   │   ├── Components/
│   │   │   ├── PrimaryButton.swift
│   │   │   ├── SecondaryButton.swift
│   │   │   ├── ListRow.swift
│   │   │   ├── InputField.swift
│   │   │   ├── SectionHeader.swift
│   │   │   ├── EyebrowLabel.swift
│   │   │   ├── Hairline.swift
│   │   │   ├── HighAlertPill.swift
│   │   │   ├── Pill.swift
│   │   │   ├── KeyValueRow.swift
│   │   │   └── ChevronRow.swift
│   │   └── Modifiers/
│   │       ├── PageContainer.swift
│   │       └── PressableButton.swift
│   ├── Utilities/
│   │   ├── Extensions/
│   │   │   ├── String+Extensions.swift
│   │   │   ├── Color+Extensions.swift
│   │   │   └── Date+Extensions.swift
│   │   ├── Formatters.swift
│   │   └── Logger.swift
│   ├── Resources/
│   │   ├── Assets.xcassets
│   │   │   ├── grain-noise.imageset
│   │   │   ├── AppIcon.appiconset
│   │   │   └── Colors.colorset/             ← Color asset catalog
│   │   ├── Fonts/
│   │   │   ├── InstrumentSerif-Regular.ttf
│   │   │   ├── InstrumentSerif-Italic.ttf
│   │   │   ├── Inter-Regular.ttf
│   │   │   ├── Inter-Medium.ttf
│   │   │   └── Inter-SemiBold.ttf
│   │   ├── Localizable.strings (en)
│   │   └── Info.plist
└── NurseMindTests/
    ├── PHIScrubberTests.swift              ← 100% coverage required
    ├── CalculatorTests.swift               ← 100% coverage required
    ├── ContentRenderingTests.swift
    └── SearchTests.swift
```

### 8.2 State management

- **`@Observable`** (Swift 5.9+) for view models
- **`@Environment`** for app-wide state (current user, theme, subscription status)
- **SwiftData** for offline cache of library entries (auto-syncs from Supabase)
- **AsyncSequence** for AI streaming responses
- **Async/await** for all networking; no Combine

### 8.3 The Anthropic streaming client

No official Swift SDK as of build start. Build a thin wrapper:

```swift
final class AnthropicStreamingClient {
    private let apiKey: String
    private let baseURL = URL(string: "https://api.anthropic.com/v1/messages")!
    
    func streamMessage(
        request: AnthropicRequest
    ) -> AsyncThrowingStream<StreamEvent, Error> {
        AsyncThrowingStream { continuation in
            Task {
                do {
                    var urlRequest = URLRequest(url: baseURL)
                    urlRequest.httpMethod = "POST"
                    urlRequest.setValue(apiKey, forHTTPHeaderField: "x-api-key")
                    urlRequest.setValue("2023-06-01", forHTTPHeaderField: "anthropic-version")
                    urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
                    urlRequest.httpBody = try JSONEncoder().encode(request)
                    
                    let (bytes, _) = try await URLSession.shared.bytes(for: urlRequest)
                    
                    for try await line in bytes.lines {
                        guard line.hasPrefix("data: ") else { continue }
                        let json = String(line.dropFirst(6))
                        if let event = parseEvent(json) {
                            continuation.yield(event)
                        }
                    }
                    continuation.finish()
                } catch {
                    continuation.finish(throwing: error)
                }
            }
        }
    }
}

enum StreamEvent {
    case messageStart
    case textDelta(String)
    case messageStop
    case error(String)
}
```

### 8.4 Streaming chat rendering

```swift
struct ConversationView: View {
    @State private var viewModel = AskViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(alignment: .leading, spacing: 0) {
                    ForEach(viewModel.messages) { message in
                        MessageRenderer(message: message)
                            .id(message.id)
                    }
                    
                    if viewModel.isStreaming {
                        StreamingTextView(text: viewModel.streamingText)
                            .id("streaming")
                    }
                }
                .padding(.horizontal, 20)
            }
            .onChange(of: viewModel.streamingText) {
                proxy.scrollTo(viewModel.isStreaming ? "streaming" : viewModel.messages.last?.id, anchor: .bottom)
            }
        }
        
        FollowUpInput(onSend: viewModel.send)
    }
}
```

### 8.5 Subscriptions (RevenueCat + StoreKit 2)

- Products: `nursemind_pro_monthly` ($14.99/mo), `nursemind_pro_yearly` ($99.99/yr) — two SKUs only, no student / no lifetime
- 3-day free trial on yearly plan (introductory offer); monthly has no trial
- Restore purchases surfaced in Profile and at install
- Family sharing enabled

### 8.6 Offline mode

Pro-tier feature, but core library content cached for everyone (free users browse offline too — generous on purpose).

- Full library JSON downloaded and persisted via SwiftData on first sync (~5MB at v1 launch, ~15MB at v2)
- Calculators are pure Swift, always work offline
- AI co-pilot requires network; offline shows "Reconnect to Ask NurseMind"
- Sync delta updates pulled on app launch (background)

### 8.7 Analytics events

```swift
// Onboarding
.onboardingStarted
.onboardingStepCompleted(step: String)
.safetyContractAccepted
.notificationsResponse(enabled: Bool)
.paywallResponse(action: String) // "trial" | "skip"
.onboardingCompleted(durationSeconds: Int)

// Library
.libraryHomeViewed
.categoryBrowsed(category: String)
.entryViewed(entryId: UUID, category: String)
.entryPinned(entryId: UUID)
.searchPerformed(queryLength: Int, resultCount: Int)

// AI
.aiQuestionAsked(length: Int, hadPHIRedaction: Bool)
.aiResponseReceived(latencyMs: Int, citationCount: Int)
.aiResponseRated(rating: String)
.aiResponseFlagged(reason: String, note: String?)
.aiRefusalShown(type: String)

// Tools
.calculatorOpened(calculatorId: String)
.calculatorUsed(calculatorId: String)

// Subscription
.paywallViewed(source: String)
.trialStarted(plan: String)
.subscriptionPurchased(plan: String)
.subscriptionCancelled(plan: String, daysActive: Int)
```

### 8.8 Performance targets

- App launch to home: **< 1.2s** on iPhone 12+
- Library entry open: **< 200ms** (cached)
- Search results: **< 100ms** (local FTS)
- AI first token: **< 1.5s**
- AI full response: **< 8s** for typical query
- 60fps scroll across all lists
- App size: **< 35 MB** (Instrument Serif fonts add ~3MB)

---

## 9. Marketing & launch surfaces

### 9.1 nursemind.app — landing page

Same Eden-tier visual language. Single page, scrollable.

**Sections (top to bottom):**

1. **Hero** — "✦ THE CLINICAL MIND FOR EVERY NURSE" eyebrow, "NurseMind" hero title (Instrument Serif 96pt), one-line description, deep green "Get early access" button (email capture), iPhone mockup
2. **What it is** — three cards: Library / Ask / Tools
3. **Who it's for** — "Built for the bedside" — addresses new grad, working nurse, student
4. **The promise** — "Evidence-based. Cited. Scoped to nursing."
5. **Sample answer** — actual screenshot of a chat response with citations visible
6. **Pricing** — two paid tiers (Free, Pro Monthly $14.99, Pro Yearly $99.99 with 3-day trial)
7. **The team** — clinical advisor named with credentials, founder bio
8. **FAQ** — HIPAA, sources, accuracy, refunds
9. **Footer** — privacy, terms, contact, social

Built with Next.js + Tailwind, deployed to Vercel. Email capture into Supabase.

### 9.2 App Store listing

**Subtitle:** "Evidence-based, cited, for the bedside."

**Description:**
```
NurseMind is the modern clinical reference and AI co-pilot built for nurses.

THE LIBRARY
A beautifully organized reference of drugs, drips, labs, procedures, diagnoses, scenarios, and communication templates — every entry reviewed by experienced nurses, every claim cited.

THE CO-PILOT
Ask anything about nursing practice. Get evidence-based, cited answers in seconds. Tightly scoped to nursing actions — never diagnostic, never prescribing.

THE TOOLS
Every calculator nurses use, designed beautifully, instantly available offline.

PERSONALIZED
Tell us your unit and experience level. The app reorganizes around what's relevant to you.

PRIVATE BY DESIGN
We don't collect, store, or transmit any patient information. No EHR integration. No PHI. Ever.

PRO FEATURES
• Unlimited AI co-pilot
• All 8 specialty units
• Offline mode
• Priority support

3-day free trial on yearly. Cancel anytime.

DISCLAIMER
NurseMind is a reference tool, not a medical advice system. Always follow your facility's policies and verify with your provider. The licensed nurse is always the decision-maker.
```

**Keywords:** nursing, RN, nurse, drug guide, NCLEX, nursing student, ICU, clinical, evidence-based, drip rate, calculator, MAR, MedSurg, nursing reference

**Screenshots (10):**
1. Library home (showing personalization)
2. Drug detail (Norepinephrine — high-alert pill visible)
3. Drip with calculator (hero number visible)
4. Lab interpreter (lactate)
5. Scenario playbook
6. Ask home (suggested questions)
7. Ask conversation (with citations)
8. Calculator hub
9. Profile with personalization
10. Tagline marketing screenshot

### 9.3 TikTok content strategy

@nursemind starts day 1 of build, posts daily.

**Content pillars:**
- "Tip of the day" — one calculator, one scenario, one drug per video
- "Build in public" — design decisions, founder POV, behind the scenes
- "Why this matters" — clinical anecdotes (de-identified) explaining why a feature exists
- "Compare" — NurseMind vs Davis's vs MDCalc, honest comparisons

**Format:** 30-60 second vertical video, Instrument Serif title cards matching app brand, voiceover-driven, no music for first 3 seconds (autoplay-friendly).

**Goal by launch:** 25K followers, 5K email waitlist signups.

---

## 10. Risk register

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Bad AI answer causes harm | Med | Critical | RAG, citation enforcement, refusal patterns, clinical review, insurance |
| OpenEvidence eats nurse market with free tier | High | High | Bundle (no NPI required, calculators, library), nurse-native scope, premium UX |
| Content production too slow | Med | High | Hire clinical advisor properly, ship 1 unit deep first |
| App Store rejection (medical content) | Low | Med | Disclaimers, advisor named, no medical-advice claims |
| AI cost exceeds revenue at scale | Med | High | Caching, abuse detection, tier adjustment, volume discount |
| Anthropic API outage | Low | Med | Graceful degradation, fallback to OpenAI planned for v2 |
| Trademark conflict | Low | High | TESS search done before launch, file ITU app immediately |
| Subscription fraud / chargebacks | Low | Low | StoreKit 2 fraud prevention, reasonable refund policy |
| Splitting attention with Bible Plus | High | High | Bible Plus in maintenance mode for 90 days |

---

## 11. Success metrics

### 11.1 Product KPIs

| Metric | M1 | M3 | M6 | M12 |
|---|---|---|---|---|
| Total downloads | 5K | 25K | 80K | 250K |
| Paying subscribers | 250 | 1,800 | 6,000 | 15,000 |
| MRR | $2K | $15K | $50K | $125K |
| ARR | $24K | $180K | $600K | $1.5M |
| Free → Paid conversion | 5% | 7% | 8% | 8% |
| AI questions/day/Pro | 4 | 6 | 8 | 10 |
| AI flag rate | <2% | <1.5% | <1% | <0.8% |
| App Store rating | 4.5 | 4.7 | 4.8 | 4.8 |
| Day-30 retention | 35% | 40% | 45% | 50% |

### 11.2 Safety KPIs

- AI flag rate trending down month-over-month
- Zero confirmed PHI incidents
- 100% of flagged answers reviewed within 7 days
- Clinical advisor random sample (5% of all responses) — zero critical errors

### 11.3 The North Star metric

**Daily Active Pro users using AI + Library together.** This proves the bundle works — the integration of reference and AI is what differentiates NurseMind from OpenEvidence (AI only) and Davis's (reference only).

---

## 12. 90-day build plan

### Week 0 — Pre-build setup

**Critical path items (must complete before Week 1):**

- [ ] nursemind.app domain purchased (+ nursemind.com defensive 301 → .app, optional)
- [ ] @nursemind handles secured on TikTok, Instagram, X, YouTube, Threads
- [ ] Trademark application filed (USPTO, classes 9 + 44)
- [ ] Apple Developer account active
- [ ] Supabase project created (dev + prod)
- [ ] Anthropic API account, usage limits set
- [ ] OpenAI API account (for embeddings)
- [ ] RevenueCat project, products defined
- [ ] Sentry, PostHog projects set up
- [ ] Clinical advisor hired and contracted (THE most important week 0 deliverable)
- [ ] Healthcare attorney contacted; legal docs in draft
- [ ] @nursemind TikTok: first 5 videos posted
- [ ] Bible Plus put into maintenance mode (no new features, ASA running)

### Week 1 — Foundation

- Xcode project skeleton per Section 8.1
- Design system primitives (colors, typography, spacing, grain background)
- Component library (PrimaryButton, EyebrowLabel, Hairline, ListRow, etc.)
- Supabase auth (email + Sign in with Apple)
- Database schema deployed
- Empty tabs visible

### Week 2 — Onboarding + Profile

- Full onboarding flow (6 steps)
- Profile screen with all settings
- Theme toggle (auto/light/dark)
- Privacy + ToS + EULA modals
- Analytics events firing

### Weeks 3–4 — Library spine

- LibraryEntry data model + ContentBody Codable schema
- EntryRenderer with all section type renderers
- Library home with personalized sections
- Category list view (alphabetical with letter scroll)
- Entry detail with full editorial layout
- Global search with FTS
- Pinning + recents

**Content prep in parallel:** Clinical advisor produces first 80 entries (50 drugs + 30 labs targeting Med-Surg).

### Weeks 5–6 — Tools (calculators)

- CalculatorHubView with grouped list
- One Swift file per calculator
- Standard calculator UI template
- Deep links from drugs/drips into calculators
- 100% test coverage on calculator math (non-negotiable)

### Weeks 7–9 — AI co-pilot

- PHI scrubber (Edge Function) + tests
- Intent classifier (Haiku)
- pgvector setup, library indexed
- Anthropic streaming client (Swift)
- ConversationView with editorial message rendering
- Citation rendering with tap-to-source
- All 6 refusal patterns
- Rate limiting (5/day free)
- Response validator
- Report flow → clinical advisor queue

**Internal beta in parallel:** 10 nurses use AI daily for 2 weeks. Every answer reviewed by advisor.

### Weeks 10–11 — Polish + content expansion

- RevenueCat full integration
- Paywall views (post-onboarding, mid-app, restore)
- Free trial mechanics
- Push notifications (weekly tip)
- Offline mode for Pro users
- Dark mode polish
- Empty/error/loading states designed
- App icon finalized
- Screenshots prepared

**Content in parallel:** Add ICU, ER, L&D content. Total ~205 entries.

### Weeks 12–13 — Closed beta + launch

- TestFlight beta with 100 nurses
- Daily review of feedback, crashes, AI flags
- Conversion funnel optimization
- App Store submission week 12 (medical apps can take 1-7 days for Apple review)
- Marketing site live at nursemind.app
- 20 nursing influencer partnerships locked
- Apple Search Ads campaign drafted

**Launch (Day 90):**
- App Store goes public
- Coordinated TikTok push (3 videos in launch week)
- Email blast to waitlist
- Influencer reviews drop within 48h
- Apple Search Ads on
- Reddit nursing community soft mentions

### Post-launch (Months 4–6)

- Add NICU, PICU, Onc, OR/PACU one unit per month
- Iterate on AI based on flag data
- Voice input (v1.5)
- Specialty certification mode beta (CCRN first)
- Begin Android conversation when iOS hits 5K paying subs

---

## 13. Open questions to resolve before Week 1

1. **Final name confirmation.** NurseMind locked? Trademark filed?
2. **Clinical advisor candidate.** Name, MSN/CCRN status, contracted?
3. **Bible Plus.** Maintenance mode for 90 days agreed?
4. **Cadence (RT).** Shelved for now agreed?
5. **Initial unit focus.** Med-Surg + ICU first 80 entries — confirm.
6. **Lifetime tier.** $179 with 1,000 cap — comfortable?
7. **TikTok strategy.** Founder face on @nursemind, or separate brand voice?
8. **Funding posture.** Bootstrap to profitability, or raise once at PMF?

---

## 14. NGN-style adaptive question bank (Pro v1.5)

> **Status:** Post-v1 feature. Builds on the locked v1 library + AI infrastructure. Targeted for ship after first 1,000 paying subs (rough Month 4–5 of operation). Documented now so the v1 data model + content production roadmap can pre-stage the work.

### 14.1 What it is

Pro-only NCLEX-RN preparation surface — original Next-Generation NCLEX-style practice questions, generated from the curated library, adaptively delivered, with cited rationales tied back to library entries. Covers all five NGN item types and the Clinical Judgment Measurement Model (CJMM) cognitive layers.

**Strategic frame:** Students currently pay UWorld $200–500, Davis's $50, ChatGPT Plus $20/mo, calc apps $10 — fragmented. NurseMind bundles question bank + drug guide + calculators + AI co-pilot at $99.99/yr. The question bank is the feature that makes "I should pay for the annual subscription" obvious to a nursing student who has not yet experienced the AI value moment.

### 14.2 Content sources + licensing (non-negotiable)

**OFF-LIMITS (do not use, ever):**
- Actual NCSBN / NCLEX items — protected, copyrighted, breach of NCSBN policy
- UWorld, Kaplan, ATI, Saunders, Lippincott, Mosby, Hesi, Hurst, Picmonic — copyrighted question banks
- Anything resembling \"leaked\" NCLEX content circulating online

**LEGITIMATE sources:**
- **NCSBN 2026 NCLEX-RN Test Plan** (public document) — defines content distribution % per category, item formats, cognitive levels. *Blueprint only — no actual items.*
- **NCSBN NGN item type specifications** — defines the five item formats, scoring rubrics, and the CJMM cognitive layers.
- **Tier 1 library content** (already curated) — openFDA SPL, Open RN textbooks, OpenStax Nursing, KDIGO, AHA, IDSA, etc. The same evidence base NCSBN itself draws from.
- **Public NCSBN sample items** (the handful published in their educator documentation) used solely as *style* references — never reproduced.

**Defensible marketing claim:** \"Original NGN-style questions written from the same evidence base NCLEX uses, reviewed by licensed RNs, with cited rationales linked to your library.\" Do NOT claim: \"actual NCLEX questions,\" \"guaranteed pass,\" \"X% pass rate increase\" (unless we have published outcome data — we don't, at v1.5).

### 14.3 Item types (must support all five)

Per NCSBN NGN spec — every item type must be functional in v1.5 because the actual NCLEX uses all of them:

| Type | Format | Example |
|---|---|---|
| **Case study** | A clinical scenario unfolding over multiple linked items (typically 6 items per case) | Same patient, vital signs evolve across questions |
| **Bow-tie** | Patient situation in center; nurse selects 2 actions (left), 2 conditions to monitor (right), and 1 most likely problem (top) | Sepsis case → actions, monitor, dx |
| **Matrix multiple-response** | Grid of clinical findings vs categories; nurse selects all that apply per row | Symptom × system grid |
| **Drag-and-drop** | Place items into ranked / categorized buckets | Triage prioritization |
| **Extended multiple-response** | Modified select-all-that-apply with partial credit scoring | \"Which of the following indicate worsening status? Select all.\" |

Each item carries:
- 1–6 CJMM cognitive layer tags (Recognize cues / Analyze cues / Prioritize hypotheses / Generate solutions / Take action / Evaluate outcomes)
- 1+ NCLEX test-plan category tag (matches existing `nclexTags` schema in library entries)
- Difficulty estimate (initial seed; refined by item analysis post-launch)
- 1+ rationale paragraphs with citation IDs pointing to library entries

### 14.4 Test plan blueprint distribution (locked)

The bank's question distribution must match NCSBN 2026 RN test plan percentages. Generation pipeline enforces this:

| Category | Subcategory | Target % of bank |
|---|---|---|
| Safe & Effective Care | Management of Care | 18% |
| Safe & Effective Care | Safety + Infection Control | 13% |
| Health Promotion & Maintenance | — | 9% |
| Psychosocial Integrity | — | 9% |
| Physiological Integrity | Basic Care + Comfort | 9% |
| Physiological Integrity | Pharmacological + Parenteral | 16% |
| Physiological Integrity | Reduction of Risk Potential | 12% |
| Physiological Integrity | Physiological Adaptation | 14% |

These are the same `TestPlanSubcategory` percentages already encoded in the library's `NCLEXTags` model (per `Packages/NursemindCore/Sources/NursemindCore/Content/NCLEXTags.swift`). The library + the question bank share one taxonomy — important for the personalization loop in §14.6.

### 14.5 Generation + review pipeline

**Stage 1 — Topic + library entry selection (deterministic):**
- A scheduler picks a `(category, subcategory, library_entry)` triple proportional to test-plan percentages.
- Avoids over-sampling already-covered topics.

**Stage 2 — Item draft generation (Claude Sonnet 4.7):**
- System prompt seeds the test plan blueprint, NGN format spec, the chosen library entry's full content, and the target cognitive layer.
- Model generates a single item with: stem, options (per format), correct answer(s), distractor rationales, citation IDs.
- Prompt enforces: \"Distractors must be plausible to a nursing student. No 'all of the above'. No double negatives. Cognitive level must match the target tag.\"

**Stage 3 — Automated validation (deterministic):**
- Citation IDs exist in library
- Format compliance (e.g., bow-tie has exactly 2/2/1 selections)
- Reading level appropriate (Flesch-Kincaid 10–12 for NCLEX)
- No banned phrases (\"prescribed,\" \"diagnose,\" etc. unless in case-study clinical context)
- Reject + retry up to 2x; on third failure, flag for human writing

**Stage 4 — Tier A RN review (mandatory before publication):**
- Every item reviewed by an MSN-prepared RN before going live in the bank.
- Reviewer rubric: clinical accuracy ✓, NGN format compliance ✓, distractor plausibility ✓, cognitive level match ✓, citation appropriateness ✓.
- Reviewer can edit/reject. Tracked per-item with reviewer ID + version.
- **Budget:** ~$5–10 per item reviewed. ~500-item launch bank ≈ $3K–5K one-time cost.

**Stage 5 — Item analysis (continuous post-launch):**
- Track p-value (% correct) and discrimination index (D) per item.
- Items with p < 0.20 or p > 0.95 flagged for review (too hard / too easy).
- Items with negative D (better students get it wrong more often) auto-pulled from rotation pending review.

### 14.6 Adaptive engine (v1.5 keep simple)

No ML model at v1.5 — basic skill-tracking is enough and avoids over-engineering.

**Per user, per category/subcategory:**
- `accuracy_rate` (rolling last 20 items)
- `confidence_score` = clamp(accuracy_rate × log(item_count + 1), 0, 1)

**Item selection algorithm:**
1. 60% weight to user's weakest subcategories (lowest confidence_score)
2. 25% weight to test-plan percentage distribution
3. 15% spaced repetition — re-surface items the user got wrong > 7 days ago

**Difficulty matching:**
- New users: start at p=0.55 difficulty (slightly easier than median)
- After 30 items, target p=0.40 (challenging but not crushing — matches NCLEX cut-score region)

This is intentionally simpler than UWorld's IRT engine. We can upgrade to a real CAT (computer adaptive testing) model post-launch when we have item-response data.

### 14.7 Data model additions

```sql
CREATE TABLE ngn_items (
  id UUID PRIMARY KEY,
  item_type TEXT CHECK (item_type IN ('case_study','bow_tie','matrix','drag_drop','extended_mr')),
  category TEXT NOT NULL,            -- TestPlanCategory
  subcategory TEXT NOT NULL,         -- TestPlanSubcategory
  cjmm_layers TEXT[] NOT NULL,       -- ['recognize_cues','analyze_cues',...]
  difficulty NUMERIC(3,2),           -- 0.00–1.00, p-value
  body JSONB NOT NULL,               -- stem, options, correct, rationales, citations
  case_id UUID REFERENCES ngn_cases(id),  -- nullable for standalone items
  reviewer_id UUID REFERENCES users(id),
  reviewed_at TIMESTAMPTZ,
  status TEXT CHECK (status IN ('draft','approved','retired')) DEFAULT 'draft',
  source_library_entry_ids TEXT[],   -- which library entries seeded this item
  created_at TIMESTAMPTZ DEFAULT now(),
  updated_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX ngn_items_subcat_idx ON ngn_items(subcategory) WHERE status = 'approved';

CREATE TABLE ngn_cases (
  id UUID PRIMARY KEY,
  scenario_md TEXT NOT NULL,         -- the patient situation
  evolves BOOLEAN DEFAULT false,     -- if vitals/labs change across items
  created_at TIMESTAMPTZ DEFAULT now()
);

CREATE TABLE ngn_attempts (
  id UUID PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id),
  item_id UUID NOT NULL REFERENCES ngn_items(id),
  selected JSONB NOT NULL,           -- user's answer, format-specific
  correct BOOLEAN NOT NULL,
  partial_credit NUMERIC(3,2),       -- for matrix / extended-mr scoring
  time_spent_sec INT,
  attempted_at TIMESTAMPTZ DEFAULT now()
);
CREATE INDEX ngn_attempts_user_idx ON ngn_attempts(user_id, attempted_at DESC);

CREATE TABLE ngn_skill_tracker (
  user_id UUID NOT NULL REFERENCES users(id),
  subcategory TEXT NOT NULL,
  items_attempted INT DEFAULT 0,
  rolling_accuracy NUMERIC(3,2) DEFAULT 0,
  last_attempt_at TIMESTAMPTZ,
  PRIMARY KEY (user_id, subcategory)
);
```

### 14.8 UI flow (Tools tab — new \"NGN Practice\" section)

```
──────────────────────────────────────────────
  NGN PRACTICE ✦
  Original questions modeled on the
  2026 NCLEX-RN test plan
  ──────────────────────────────
  Today's session                   →
  5 questions · 12 min · cardiac
  ──────────────────────────────
  Continue case study                →
  Sepsis case · 3 of 6 items
  ──────────────────────────────
  Browse by topic                    →
  ──────────────────────────────
  Your progress                      →
  348 attempted · 72% accuracy
  Strongest: Pharm    Weakest: Mgmt
──────────────────────────────────────────────
```

**Item screen** (case study example):
- Header: scenario card (sticky, scrolls within)
- Question stem
- Format-appropriate input (radio / checkboxes / drag targets / matrix grid)
- Submit → reveal: ✓/✗, correct answer highlighted, **rationale with cited library links**
- \"Read full library entry →\" deep-links to the library card
- \"Save question\" / \"Report issue\"
- Next item

**Free-tier preview:** 3 free items per day, then paywall. (Same logic as the AI 5/day cap — proves the value, drives upgrade.)

### 14.9 Free vs Pro

| | Free | Pro |
|---|---|---|
| Items per day | 3 | Unlimited |
| Item types | All 5 | All 5 |
| Adaptive engine | No (random) | Yes |
| Progress tracking | Last 7 days | All-time |
| Case studies | First case only | All |
| Difficulty matching | Off | On |
| Topic filtering | Off | On |

### 14.10 Acceptance criteria (v1.5 launch)

- ≥500 reviewed items live across all 8 subcategories proportional to test-plan %
- All 5 NGN item types implemented + tested
- Tier A reviewer pipeline operational; ≥95% of items approved on first review
- Item analysis dashboard (internal) tracking p + D for every item
- Free 3/day cap enforced client + server
- Pro user can complete a full session (10 items) end-to-end with rationales rendering correctly
- Deep-link from rationale → library entry works in <500ms
- Adaptive selection demonstrably weights weak subcategories (verified by integration test)
- App Review approval — no \"medical claims\" rejection (review with attorney before submission)

### 14.11 KPIs (add to §11)

| Metric | Target M5 (launch) | Target M9 |
|---|---|---|
| % of Pro users who attempt ≥1 NGN item / week | 40% | 60% |
| % of Pro users who attempt ≥10/week | 15% | 30% |
| Items completed per active session | 8 | 12 |
| Rationale → library deep-link CTR | 25% | 35% |
| Self-reported study satisfaction (in-app survey) | 4.0/5 | 4.4/5 |
| Conversion lift in student-cohort signups | — | +25% vs pre-launch |

### 14.12 Risk additions to §10

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Generated question is clinically wrong | Med | Critical | Tier A review required pre-publication; in-app \"Report issue\" routes to clinical reviewer; auto-pull on D-index violation |
| Marketing claim triggers FTC / NCSBN cease-and-desist | Low | High | Attorney review of marketing copy; never imply NCLEX content; only \"NGN-style modeled on test plan\" |
| Item bank perceived as \"AI slop\" by students | Med | High | Tier A human review on every item; feature reviewer credentials in app; quality > quantity at launch |
| App Review rejects as \"unsubstantiated medical claims\" | Low | High | Conservative claims, disclaimers, no \"pass guarantee\" anywhere |
| Question bank becomes the only thing students use, AI value missed | Med | Med | Cross-link rationales → library → AI co-pilot prompts |

---

## 15. Dynamic suggested feed — Library home (v1.5)

> **Status:** Post-v1 feature. Builds on the locked library + embeddings + Supabase. Targeted for ship Month 3–4. Documented now so the v1 schema can pre-stage the `user_interactions` table from day one (no painful migration later).

### 15.1 What it is

The Library home screen (current spec §4.2) currently shows a static set of \"recently added,\" \"popular drugs,\" \"clinical playbooks\" cards. v1.5 replaces this with a **personalized + dynamic feed** that adapts to the user's role, unit, recent reading, recent AI questions, and (post-§14) NGN practice weak areas.

**Strategic frame:** A static library is a tool you use occasionally. A dynamic feed is something you open every day to see \"what's there for me.\" Daily-active-user is the leading indicator of paid retention. This feature converts the app from a reference into a habit.

### 15.2 Feed surfaces (the seven ranked sections)

Each session renders these in this priority order, with sections collapsed if no relevant content exists:

1. **Pick up where you left off** — last 3 library entries the user opened but didn't bookmark; last AI conversation if active in past 24h
2. **Today's challenge** — once §14 ships, surfaces a 5-item NGN session targeting their weakest subcategory; pre-§14, surfaces a single \"learn one new drug today\" library entry chosen from weak subcategory
3. **Related to your recent reading** — semantic similarity (embeddings) over avg-of-last-10-viewed entries → top 5 closest unread entries from full library
4. **You asked about X — here are related references** — the 3 library entries closest to the user's most recent AI question
5. **Trending in your unit** — top 5 most-viewed entries in the last 7 days among users with the same primary unit setting
6. **Refresh on a topic** — spaced repetition surface — bookmarked entries the user hasn't opened in >14 days
7. **Updated for you** — entries in user's units that had `lastSourceFidelityReview` updated since the user's last session

### 15.3 Personalization signals (no PHI)

Already collected in v1 schema (no new signals required for first three surfaces):

- `users.career_stage` (student / new_grad / early / experienced / charge)
- `users.units` (selected specialty units)
- `users.bookmarks` (existing)
- `library_views` (need to add — see §15.5)
- `ai_conversations.most_recent_question` (existing)

Post-§14:
- `ngn_skill_tracker.subcategory.rolling_accuracy` (drives \"Today's challenge\" topic)

**Explicit non-signals (do not collect for personalization):**
- Anything resembling PHI in AI conversation content (even though scrubbed at ingest, do not feed conversation text into recommender)
- IP address, location, device fingerprint
- Cross-app behavior (no SDK tracking other apps)

### 15.4 Tech architecture

```
┌─────────────────────────────────────────────────────────┐
│  iOS LibraryHomeView                                     │
│  on appear → fetch /suggested-feed?user_id=...           │
└──────────────────┬──────────────────────────────────────┘
                   │ HTTPS
                   ▼
┌─────────────────────────────────────────────────────────┐
│  Supabase edge function: suggested-feed                  │
│   1. Load user profile + bookmarks + skill_tracker       │
│   2. Load last 10 library_views                          │
│   3. Load last AI conversation question                  │
│   4. Compute average embedding of recent views           │
│   5. Vector-similarity search (pgvector) → candidates    │
│   6. Filter out already-viewed                           │
│   7. Rank + group into 7 surfaces                        │
│   8. Cache result for user_id × hour                     │
└──────────────────┬──────────────────────────────────────┘
                   │
                   ▼
            JSON response
            { surfaces: [ {title, kind, items:[…]}, … ] }
```

**Reuses existing v1 stack:**
- `text-embedding-3-small` already wired for library
- pgvector already in Supabase
- Edge function pattern already established (see `supabase/functions/ai-chat/`)

### 15.5 Data model additions

```sql
CREATE TABLE library_views (
  id BIGSERIAL PRIMARY KEY,
  user_id UUID NOT NULL REFERENCES users(id),
  entry_slug TEXT NOT NULL,            -- matches LibraryEntry.id from Swift
  viewed_at TIMESTAMPTZ DEFAULT now(),
  duration_sec INT                     -- how long the entry was on screen
);
CREATE INDEX library_views_user_recent_idx
  ON library_views(user_id, viewed_at DESC);

-- For \"Trending in your unit\"
CREATE MATERIALIZED VIEW trending_by_unit_7d AS
  SELECT
    u.units[1] AS primary_unit,
    lv.entry_slug,
    COUNT(*) AS view_count
  FROM library_views lv
  JOIN users u ON u.id = lv.user_id
  WHERE lv.viewed_at > now() - INTERVAL '7 days'
  GROUP BY u.units[1], lv.entry_slug;
CREATE UNIQUE INDEX ON trending_by_unit_7d (primary_unit, entry_slug);
-- Refresh nightly via pg_cron
```

**Privacy:** `library_views` is a behavior log, not PHI. Entry slugs are public (\"furosemide,\" \"sepsis-bundle\") — no patient context attached.

### 15.6 Cold-start handling (new users with no data)

A first-launch user has zero `library_views`, no AI conversations, no bookmarks. The feed gracefully degrades:

1. **Pick up where you left off** — collapsed (no entries to show)
2. **Today's challenge** — \"Learn one drug a day\" → first drug from their selected unit
3. **Related to your recent reading** — collapsed
4. **You asked about X** — collapsed
5. **Trending in your unit** — works from day one (population-level)
6. **Refresh on a topic** — collapsed
7. **Updated for you** — works from day one (population-level)

After ~5 entries viewed, surfaces 1, 3, 4 light up. Full personalization at ~10 entries.

### 15.7 Performance + caching

- Edge function P95 latency target: **<400ms** (homepage is the most-loaded screen — this matters)
- Per-user response cached for 1 hour (TTL); invalidated on bookmark / view
- `trending_by_unit_7d` materialized view refreshed nightly
- Embedding similarity uses pgvector ANN index (already configured)
- Full feed payload <50KB (image URLs, not blobs)

### 15.8 UI flow (replaces existing §4.2 static cards)

```
──────────────────────────────────────────────
  Good morning, Sarah ✦
  ICU · Early career

  ─── Pick up where you left off ───
  [Norepinephrine card]
  [Sepsis bundle card]
  [Lactate card]

  ─── Today's challenge ───
  Pharmacology · 5 questions · 8 min
  [Start →]

  ─── Related to what you've been reading ───
  [Vasopressin card]
  [Phenylephrine card]
  [MAP calculator card]
  [Septic shock playbook]

  ─── Trending in ICU this week ───
  [DKA management]
  [Mechanical ventilation basics]
  ...
──────────────────────────────────────────────
```

Sections render lazily as user scrolls. Each section header is bordered by a hairline (per §5 design system). Card style identical to existing library cards — no new visual primitives needed.

### 15.9 Acceptance criteria

- New `library_views` table populated on every entry-detail screen render
- Edge function `suggested-feed` returns valid JSON for any user (cold-start through fully-warm) in <400ms P95
- All 7 surfaces gracefully collapse when no relevant content
- Cold-start user sees a usable, populated feed (Today's challenge + Trending in unit + Updated for you) on first launch
- Returning user sees personalized feed reflecting their last 10 entry views within 1 hour of viewing them
- Cache invalidation works correctly (bookmark → next feed call shows updated state)
- Privacy review: no PHI surfaces are logged or used as inputs (audit trail required)

### 15.10 KPIs (add to §11)

| Metric | Pre-launch baseline | Target M+1 of v1.5 ship | Target M+3 |
|---|---|---|---|
| Daily Active Users / Monthly Active Users | 18% | 28% | 35% |
| Sessions per user per week | 2.4 | 4.0 | 5.5 |
| Median entries viewed per session | 1.8 | 3.5 | 4.5 |
| Suggested-section CTR (clicks / impressions) | n/a | 22% | 30% |
| Day-30 retention (Pro) | 40% | 50% | 55% |
| Bookmarks per active Pro user / month | 6 | 10 | 14 |

### 15.11 Risk additions to §10

| Risk | Likelihood | Impact | Mitigation |
|---|---|---|---|
| Suggested feed surfaces clinically inappropriate entries (e.g., adult drug to a peds-focused user) | Med | Med | Filter candidates by user's `units` array; explicit unit tag matching; A/B test before full rollout |
| Cold-start feed feels empty / makes new users churn | Med | Med | Always-populated surfaces (Trending, Updated, Today's challenge); skeleton states never empty |
| Edge function P95 latency degrades at scale | Med | Med | Materialized view for population queries; per-user cache; pgvector ANN index; load test pre-launch |
| Personalization perceived as \"creepy\" / over-tracking | Low | Med | No PHI inputs; transparent \"why are you seeing this?\" tooltip on each section; opt-out toggle in Profile |
| Suggested feed cannibalizes search behavior — users stop using search | Low | Low | Search remains primary nav; feed is *discovery*, search is *retrieval* — distinct intents |

---

*End of specification. Version 2.1 — pricing repriced 2026-05-09; sections 14–15 added 2026-05-09 to document v1.5 high-leverage features (NGN question bank, dynamic suggested feed). To be revised after Week 0 setup and clinical advisor onboarding.*
