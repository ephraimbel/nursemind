# NurseMind v1 — Scope (Curator Model)

**Locked: 2026-05-03 · Path C committed**

The single source of truth for what ships in v1 and what doesn't. When the spec disagrees with this file, this file wins for v1 — `BUILD_SPEC.md` v2.0 was written assuming a hybrid author + advisor model, and v1 is now a curator model.

---

## 1. The thesis (one sentence)

NurseMind v1 is a beautifully-designed reader + AI assembler over a curated corpus of accredited public-domain and CC BY 4.0 nursing content. We do not author clinical claims; we display, restructure, cite, and assemble.

This eliminates the need for a clinical reviewer in v1 because we never synthesize clinical opinion — we present what nursing faculty and federal agencies have already published.

---

## 2. KEEP — ships in v1

### 2.1 AI co-pilot (Ask tab)
- RAG chat over the curated corpus
- Citation-required generation; server-side regex enforcement (spec §7.7 unchanged)
- 6 refusal templates (spec §4.11 unchanged)
- 5/day rate limit on free, unlimited on Pro
- Streaming responses with editorial rendering
- 👍 👎 ⎘ ⚑ action row; flag → reporting queue

### 2.2 Library tab
Eight categories. Each entry is built by displaying source content with attribution:

| Category | v1 source | What we display |
|---|---|---|
| Drugs (50) | openFDA SPL + Open RN Pharmacology + OpenStax Pharmacology + VA PBM monograph + LiverTox | Quick reference, indications, dosing, BBW, warnings, adverse reactions, interactions, pharmacokinetics (all from openFDA SPL); nursing implications + monitoring (from Open RN/OpenStax/VA PBM if covered, otherwise omitted) |
| Drips (15) | Drug entry above + openFDA SPL drip-specific content + Open RN/OpenStax drip content | Same drug structure; drip calculator section is REMOVED (Apple 1.4.2) and replaced with reference dose ranges from the SPL |
| Labs (30) | Open RN appendix + OpenStax Clinical Skills Adult Lab Values appendix | Reference range table, critical thresholds (cited to CMS SEP-1, Surviving Sepsis PMC OA, AHA ACLS), inline interpreter (deterministic threshold logic — non-AI), common causes from OER |
| Procedures (20) | OpenStax Clinical Nursing Skills (the killer use case — has step-by-step procedures CC BY 4.0) | Indications, equipment, steps, post-procedure, documentation, watch-for — all from OpenStax with attribution |
| Diagnoses (25) | Open RN Med-Surg + OpenStax + PMC OA review articles (CC BY only) | Definition, pathophysiology, presentation, diagnostic criteria, common interventions |
| Scenarios (~15, reduced from 30) | OpenStax Clinical Skills case studies + AHRQ TeamSTEPPS scenarios | Display existing case studies with attribution; do NOT author custom NCJMM-structured scenarios in v1 (that's synthesis — defer to v1.1 with paid review) |
| Communication (20) | AHRQ TeamSTEPPS (public domain) + Joint Commission NPSGs (paraphrase + cite) + Open RN Fundamentals communication chapter | SBAR templates, escalation scripts, handoff frameworks, therapeutic communication |
| Reference (15) | CDC Isolation Precautions (Siegel et al.) + ACIP immunization schedules + AHRQ + ANA scope docs | Precautions chart, immunization schedule, equipment quick-refs, scope of practice |

**Total: ~190 entries** (slightly under spec's 205 because Scenarios reduces from 30 to ~15).

### 2.3 Tools tab — Apple-1.4.2-safe calculators only
Sixteen calculators, all non-drug-dose, all clinical scoring or generic clinical math:

**Cardiovascular:** MAP, Cardiac Index
**Respiratory:** P/F ratio, Oxygenation Index
**Renal/Metabolic:** GFR (CKD-EPI), Anion gap, Corrected sodium, Corrected calcium, FENa
**Risk Scores:** MEWS, NEWS2, Glasgow Coma Scale, Apgar, FLACC pain
**Other:** BMI, BSA (Mosteller), Ideal body weight (IBW)

### 2.4 Infrastructure (all spec §8 work unchanged)
- Onboarding (6 screens, including safety contract)
- Profile + preferences + subscription management
- Paywall (post-onboarding, mid-app, restore)
- Search (local FTS + AI fallback)
- Pinning + recents + offline mode (Pro)
- Push notifications (weekly tip)
- Design system (Eden-aligned)
- Supabase backend (full schema + RLS + audit log)
- RevenueCat + StoreKit 2 (4 products)
- Sentry + PostHog
- iOS app structure per spec §8.1

### 2.5 Marketing
- nursemind.app landing page
- Editorial Standards page (transparent about curator model, source list, attribution practice, "report an issue" loop)
- TikTok @nursemind daily content
- App Store listing + 10 screenshots
- Apple Search Ads
- 20-influencer outreach

---

## 3. CUT from v1 — defer to v1.1+ or never

### 3.1 Patient-specific drug-dose calculators (Apple 1.4.2)
Cut: IV drip rate (mcg/kg/min → mL/hr), Weight-based dose, Pediatric dose by weight, Opioid conversion, Steroid equivalency, Heparin nomogram, Burn fluids (Parkland), Maintenance IV (4-2-1 — borderline; cut to be safe).

**Defer:** v1.1 with hospital/university/pharmacy partnership as publisher of record. Or never.

### 3.2 Original NCJMM-structured Scenario playbooks
Cut: custom-authored "first 5 minutes" scenarios with original action ordering (sepsis, hypotensive, anaphylaxis playbooks as written in spec §4.7).

**Defer:** v1.1 if we contract a paid RN reviewer for a Scenario batch. v1 ships OpenStax case studies + AHRQ TeamSTEPPS scenarios as the Scenarios content.

### 3.3 Original "nursing implications" synthesis where source coverage gaps exist
Cut: writing original nursing-implication content for drugs/labs/procedures NOT covered by Open RN, OpenStax, or VA PBM.

**Defer:** if a drug entry has openFDA SPL data but no Open RN/OpenStax coverage, we ship the SPL content with attribution, and the "Nursing implications" section is OMITTED (or replaced with a "See [openFDA Warnings & Precautions](link)" pointer). v1.1 fills gaps with paid reviewer-authored synthesis if needed.

### 3.4 Per-unit personalized framing of content
Cut: "this drug, framed for an ICU nurse" vs "this drug, framed for a Med-Surg nurse" — that's synthesis.

**Defer:** v1 personalization = filtering and reordering of accredited content based on the user's unit/career stage. Not rewriting content.

### 3.5 Specialty calculations spec listed but cut
Cut: anything in Tools tab that's patient-specific drug dosing (see §3.1). Keep everything else.

### 3.6 Pediatric content beyond newborn
Cut: pediatric dosing, peds-specific scenarios, peds vitals norms. Open RN + OpenStax don't cover this well; PMC OA pediatric content is patchy.

**Defer:** v1.2+. v1 surfaces a one-line note in the onboarding unit-selector: "Pediatric content is limited in v1 — students and adult-care nurses are the primary audience."

### 3.7 Specialty content with weak OER coverage
- ICU specialty (CRRT, vent management, hemodynamics): partially covered in Med-Surg; supplement from PMC OA where possible; if a topic isn't covered, omit
- ER/trauma: partial coverage; omit gaps
- Oncology: omit chemotherapy-specific content in v1 (NCCN guidelines are copyrighted; PMC OA coverage is inconsistent)
- L&D / NICU: covered by Maternal-Newborn books

---

## 4. What we still need (just NOT a clinical reviewer)

| Item | Cost | Timing | Owner |
|---|---|---|---|
| Tech E&O insurance with bodily-injury carve-back, $1–2M | $1.5–5K/yr | Bound before public TestFlight | User + broker |
| Counsel review: ToS + Privacy + EULA + refusal templates + safety contract + FDA CDS safe-harbor analysis + FTC marketing/disclaimer match | $3–5K one-time | Drafted Week 0–1, reviewed Week 2 | User + healthcare attorney |
| LLC formation + EIN | $200–500 | Week 0 | User |
| Apple Developer Program | $99/yr | Week 0 | User |
| USPTO trademark filing (classes 9 + 44) | $350–500 + attorney $500–1500 | Week 0–1 | User + attorney |
| Domain registrations (.ai/.com/.app) | ~$100/yr | Week 0 | User |

**Total v1 hard costs: ~$5–12K** (one-time + first-year). Substantially less than the advisor + Tier A reviewer pool from the prior model.

---

## 5. Marketing positioning — curator framing (FTC-scope-matched)

The positioning must match the disclaimer scope. Curator model implies:

**OK to say:**
- "The cleanest place to read what nursing faculty already published."
- "Evidence-based nursing reference, sourced from openFDA, Open RN, OpenStax, CDC, and AHRQ."
- "Aligned to the 2026 NCLEX-RN Test Plan®."
- "Transparent sourcing — every claim cited, every source linked."
- "AI co-pilot, scoped to nursing reference, citations on every clinical claim."
- "Reference and study tool for licensed and student nurses."

**NOT OK to say** (FTC + product liability risk):
- "Trusted clinical answers" / "Trusted by ICUs"
- "Clinical accuracy guaranteed"
- "Decision support" / "Clinical decision support"
- "As accurate as your preceptor"
- "Replaces Davis's / Lexicomp / Nursing Central"
- Anything implying endorsement by NCSBN, AHA, AACN, etc.

**Editorial Standards page must include:**
- Curator-model explanation
- Full source list with license terms
- Attribution practice (every entry shows source + license)
- AI co-pilot grounding workflow
- "Report an issue" loop and our triage policy
- Last full content audit date
- No claim of clinical reviewer board

---

## 6. The reporting loop (replaces tiered review)

Every entry has a "Report an issue" link (lightweight Tier C). Three flags on the same entry triggers founder triage — not clinical review, because we don't author clinical content. Triage outcomes:

1. **Source content drifted** (openFDA SPL updated, Open RN textbook revised) → re-pull and re-publish
2. **Wrong source section pulled** (e.g., we put adverse reactions content in the dosing field) → fix the import script, re-publish
3. **Missing context** (a topic doesn't render well from the source) → omit the section or link out
4. **AI co-pilot answer flagged** → review against retrieved corpus, tune prompt or expand corpus, never override the citation requirement

Reporting loop is documented publicly on the Editorial Standards page.

---

## 7. v1.1+ backlog (not committed, but tracked)

- Patient-specific drug-dose calculators with hospital/university partnership
- Original NCJMM-structured Scenarios authored with paid RN review
- Per-unit personalized synthesis (ICU vs Med-Surg framing)
- Pediatric coverage expansion
- Specialty content (oncology, transplant, advanced critical care)
- Voice input
- **Specialty certification content batches** — same legal framework as NCLEX (nominative fair use of cert marks, "aligned to" phrasing, ® on first reference, no logos, per-body disclaimer, no reproduction of exam outlines or items). Each cert has its own governing body — NCSBN does not run specialty certs.
  - **Tier 1 (high-feasibility, existing Tier 1 sources cover most content):** CCRN (AACN Cert Corp), PCCN (AACN Cert Corp), CEN (BCEN), CMSRN (MSNCB)
  - **Tier 2 (medium-feasibility, requires deeper specialty sourcing):** OCN (ONCC), CPN (PNCB), RNC-OB / RNC-NIC (NCC), CNOR (CCI)
  - **Tier 3 (NP/leadership, separate audience):** FNP-BC, AGNP-BC (ANCC), CNL (AACN), CNML (AONL)
  - **Architecture commitment for v1:** the data model (`test_plan_category`, `priority_concept`, generic tag schema) ships cert-ready so future certs are pure content adds, not engineering work
  - **Hard line:** prep only, never CE credit. Awarding CE hours requires ANCC Approved Provider status (6–12 month accreditation, separate business). Marketing copy must say "study for X" / "X prep," never "earn CE toward X renewal"
  - **Brand positioning to bake in from launch:** "NurseMind grows with you — NCLEX as a student, specialty certs as a working nurse." Sets the trajectory without overpromising; first cert content ships v1.1
- Android (when iOS hits 5K paying subs)

---

## 8. Why this works

1. **Credibility floor cleared without a reviewer.** Our content credibility comes from the *primary sources*, not from us — Open RN is US-Dept-of-Education-funded nursing-faculty-authored peer-reviewed content; openFDA is FDA regulatory work product; CDC is federal public health authority. We're a curator + interface; we don't claim to be the source.

2. **Liability floor cleared.** No original clinical synthesis = no original clinical opinion = no AI-fabricated nursing implications. The thing most likely to harm a nurse is a wrong synthesized recommendation; we don't make synthesized recommendations. Tech E&O with BI carve-back is the financial backstop.

3. **Apple safe.** Calculator hub has zero patient-specific drug-dose computation. Refusal templates handle directive output. Citation enforcement handles the FDA CDS basis-of-recommendation criterion.

4. **Speed.** No reviewer scheduling = no content bottleneck. Pipeline = pull source → restructure into card → ship. 90-day window is comfortable.

5. **Differentiation preserved.** The bundle moat is intact (library + calculators + AI in one place). The premium UX moat is intact (Eden-aligned editorial design over open content beats raw textbook PDFs in any nursing student's eyes). The nurse-native scope moat is intact (NCLEX-aligned retrieval, no NPI required, students/CNAs welcome).

6. **The honest pitch is the right pitch.** "We're the cleanest place to read what nursing faculty already published, with an AI co-pilot that answers questions from the same sources." That's a real, defensible, valuable product.
