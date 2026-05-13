# NurseMind — Content Sourcing & Curator Playbook

**The operational guide for building NurseMind v1 as a curator over accredited public-domain and CC BY 4.0 nursing content.**

Last updated: 2026-05-03 · Day 0 of 90 · Path C (curator model) committed

This document supersedes Section 6.3 of `BUILD_SPEC.md`. The spec was written assuming a hybrid author + advisor model; v1 is now a pure curator model. See `docs/v1_SCOPE.md` for the cut/keep list.

---

## 1. The strategic shift (Path C — curator model)

**What changed:** No full-time clinical advisor, no paid Tier A reviewer pool, no original clinical synthesis. NurseMind v1 is a beautifully-designed reader + AI assembler over a curated corpus of accredited content. We display, restructure (CC BY 4.0 permits derivatives with attribution), cite, and assemble — we do not author clinical claims.

**Three layers replace the prior three layers:**

1. **License-correct primary sources, displayed with attribution** — every entry pulls from openFDA SPL, Open RN textbooks (CC BY 4.0), OpenStax Nursing (CC BY 4.0), VA PBM monographs (US gov), LiverTox (US gov), CDC content (mostly public domain), AHRQ TeamSTEPPS (public domain), and PMC OA articles (CC BY/CC0 only).

2. **AI co-pilot RAG over the same corpus** — citation-required, refusal-on-scope, FDA CDS safe-harbor preserved. Same architecture as spec §7.

3. **Reporting loop** — every entry has a "Report an issue" link. Three flags triggers founder triage (not clinical review, because we don't author clinical content). Triage outcomes: re-pull updated source, fix import bug, omit a section, or expand corpus for AI gaps.

**Why this is defensible:**
- The primary sources ARE the credibility (Open RN = US-Dept-of-Education-funded, nursing-faculty-authored, peer-reviewed; openFDA = FDA regulatory work product; CDC = federal public health authority).
- We're a curator + interface designer, not a content publisher.
- No original clinical synthesis means no original clinical opinion means no AI-fabricated nursing implications — the highest-risk content type is simply not in v1.
- Tech E&O insurance with bodily-injury carve-back is the financial backstop.

**Risk profile delta from prior model:**
- ELIMINATED: original synthesis risk (we don't synthesize)
- ELIMINATED: AI hallucination of nursing implications (we don't author them, AI doesn't generate them — AI only cites them from corpus)
- REMAINING (mitigated): wrong-source-pulled bugs (mitigated by import script tests + reporting loop), source-drift (mitigated by retrieval freshness tracking), AI co-pilot citation failure (mitigated by spec §7.7 enforcement, refusal templates)

---

## 2. The corrected source tier hierarchy

The spec's tier list was partially wrong. This is the audited list.

### 2.1 Tier 1 — Foundation (commercial-use OK, attribute, can reproduce or paraphrase freely)

| Source | License | Use it for | URL |
|---|---|---|---|
| **openFDA Drug Label API** | CC0 1.0 (public domain dedication) | Drug labels: indications, dosing, contraindications, BBW, adverse reactions, interactions, pharmacokinetics. The bedrock of every drug entry. | https://open.fda.gov/apis/drug/label/ |
| **DailyMed (NIH/NLM)** | US federal regulatory work product, no copyright asserted | Same SPL data as openFDA, plus canonical current version. Bulk SPL ZIP downloads available. | https://dailymed.nlm.nih.gov/ |
| **RxNorm (NLM)** | Public domain (RxNorm-only names; some embedded vocabularies have UMLS Section 12 restrictions) | Canonical drug ID + naming + crosswalks. The plumbing across drugs/drips/AI. | https://rxnav.nlm.nih.gov/ |
| **Open RN nursing textbooks** | **CC BY 4.0** | Full nursing OER textbooks (Fundamentals, Pharmacology, Med-Surg, Mental Health, Maternal-Newborn). **Includes adult lab reference range tables.** Reproducible commercially with attribution. | NCBI Bookshelf NBK615342, NBK613071 |
| **OpenStax Nursing** (Rice University, 2024) | **CC BY 4.0 with AI restriction** ⚠️ | Six books: Fundamentals of Nursing, Clinical Nursing Skills, Maternal Newborn, Pharmacology, Psychiatric-Mental Health, Population Health. Adult Lab Values appendix. **Library display is fine; AI/RAG corpus use is restricted** — see §2.6. | https://openstax.org/subjects/nursing |
| **VA PBM Drug Monographs** | Public domain (US gov work) | The hidden gem for nursing-implications-style content. Written for clinicians, includes monitoring parameters. Coverage is partial (VA formulary) but high quality. | https://www.pbm.va.gov/PBM/clinicalguidance/drugmonographs/ |
| **LiverTox** (NCBI Bookshelf NBK547852) | Public domain (US gov work) | Hepatotoxicity content for any drug section that needs it. | https://www.ncbi.nlm.nih.gov/books/NBK547852/ |
| **CDC clinical guidelines** | Public domain (most content; logos and contractor work excepted) | Infection precautions (Siegel et al.), immunization schedules (ACIP), STI guidelines, Yellow Book, sepsis core elements. | https://www.cdc.gov/ |
| **CMS** | Public domain | SEP-1 sepsis bundle definitions, conditions of participation, readmission criteria. | https://www.cms.gov/ |
| **NIH treatment guidelines** | Public domain | HIV (clinicalinfo.hiv.gov), COVID, opioid use disorder. Bedside-relevant dosing in some. | https://clinicalinfo.hiv.gov/ |
| **MedlinePlus Lab Tests A–Z (NLM-authored only)** | Public domain (NLM-authored content) | Patient-facing lab explainers. Does NOT include numeric thresholds (deliberate). | https://medlineplus.gov/lab-tests/ |
| **GARD (NCATS/NIH)** | Public domain | Genetic and rare disease info. | https://rarediseases.info.nih.gov/ |
| **PubMed Central OA Subset (CC BY / CC0 only)** | Per-article — must verify CC BY, CC BY-SA, CC0, or CC BY-ND only | Specific evidence citations on individual topics. Filter strictly. | https://pmc.ncbi.nlm.nih.gov/about/intro/ |

### 2.2 Tier 2 — Cite, paraphrase carefully, never reproduce verbatim

These are the professional-society guidelines that nurses actually follow. They are copyrighted but freely accessible for reading. Paraphrase the *clinical fact*, cite the source, never copy tables/algorithms verbatim. Facts (e.g., "MAP target >65 in septic shock") are not copyrightable; specific tables and figures are.

| Source | What we cite |
|---|---|
| **AHA Guidelines** (ACLS, BLS, PALS, NRP, ECC) | Cardiac arrest algorithms, MAP targets, anti-arrhythmic dosing — paraphrase the principle, cite the year and section |
| **SCCM Surviving Sepsis Campaign 2021** | Sepsis bundle, fluid resus 30mL/kg, vasopressor selection. (Often available CC BY in PMC — prefer the OA version when it exists.) |
| **ADA Standards of Medical Care in Diabetes** | Glycemic targets, DKA criteria, insulin guidance |
| **AACN Critical Care Procedure Manual** | ICU procedure standards |
| **AHRQ Guidelines / EPC reports** | Evidence-based practice synthesis |
| **ANA / ANCC** | Scope of practice, ethics |
| **ENA, AWHONN, ONS, INS, ASPEN** | Specialty nursing standards |
| **ISMP** (high-alert meds, confused drug names) | Concept "drug X is high-alert" is fact and citable; the *list itself* and explanatory text are NOT reproducible. Build our own flag, cite ISMP. |
| **Joint Commission NPSGs** | Patient safety goals, sentinel events |
| **GOLD COPD guidelines, GINA asthma** | Stepwise management |

### 2.3 Tier 3 — REMOVED in v1 (curator model)

The original-synthesis "nursing implications" layer is not in v1. If a drug entry has openFDA SPL data but Open RN/OpenStax/VA PBM has no corresponding nursing chapter, the "Nursing implications" section is **omitted** — we do not generate substitute content. The user sees the SPL data with attribution, and a link out to the SPL Warnings & Precautions section.

This is the single most important rule of the curator model: when a source exists, we display it; when no source exists, we omit the section. We never fill the gap with synthesis.

v1.1+ may revisit this with paid RN reviewer authoring batches; that's tracked in `docs/v1_SCOPE.md` §7.

### 2.4 Tier OUT — Do not use as a content source

The spec listed several of these as Tier 1. They are not. **Never copy from these into NurseMind:**

| Source | Why excluded |
|---|---|
| **StatPearls (NCBI Bookshelf)** | CC BY-NC-ND 4.0 — no commercial use, no derivatives. Link out only. |
| **AHFS DI Patient Medication Information** | Copyrighted by ASHP. Licensed (free) into MedlinePlus and DailyMed but NOT for downstream redistribution. |
| **MedlinePlus drug pages** | These are AHFS PMI content (see above). Link out, don't ingest. |
| **MedlinePlus Encyclopedia** | A.D.A.M./Ebix-licensed. Copyrighted. The single biggest gotcha most solo founders miss. |
| **Testing.com (formerly LabTestsOnline)** | OneCare Media terms: personal non-commercial only. |
| **DrugBank full database** | Free academic tier is CC BY-NC 4.0 (non-commercial). Vocabulary/structures only are CC0 — use those for ID crosswalk. |
| **Davis's Drug Guide / Mosby's / Lexicomp / UpToDate / Nursing Central** | All proprietary. License costs prohibitive at solo-founder scale. Advisor consultation only — never appears in NurseMind text. |
| **ATI / Saunders / Lippincott / Kaplan / UWorld review materials** | Proprietary. Underlying clinical facts come from Tier 1–2 anyway; never copy from review books. |
| **NCLEX items themselves** | Strictly prohibited. Test-security/trade-secret protected. We align to the *Test Plan categories*, never to actual items. |

### 2.6 OpenStax AI-restriction caveat ⚠️ (discovered 2026-05-03)

OpenStax books carry a CC BY 4.0 license **plus** an additional explicit restriction on AI/LLM use:

> "This book may not be used in the training of large language models or otherwise be ingested into large language models or generative AI offerings without OpenStax's permission."

**What this means for NurseMind:**
- ✅ **Library display:** fine — CC BY 4.0 permits commercial use, derivatives, and reproduction with attribution. Drug/lab/procedure cards that pull OpenStax content with attribution are compliant.
- ⚠️ **AI co-pilot RAG corpus:** ambiguous and risky. RAG retrieves at inference (not training), but "ingested into LLMs or generative AI offerings" is broad. Two paths:
  - **Path 1 (preferred):** email contact@openstax.org for explicit RAG-corpus permission. Their content is too good to lose.
  - **Path 2 (fallback):** exclude OpenStax from the AI corpus. Use Open RN + openFDA + CDC + AHRQ + LiverTox + PMC OA only. Library still displays OpenStax.

**Open RN has no such restriction** — pure CC BY 4.0, use freely for both library and AI. Tracked in PLAN.md as Q17.

### 2.7 Trademark notes

Brand drug names (Tylenol, Lasix, Levophed) are trademarked but safe to use *generically and descriptively* — never as our own product naming. NCLEX®, NCLEX-RN®, NCSBN are registered marks; first-reference use of ® and "aligned to" phrasing is the industry-safe convention. Don't use NCSBN or AHA logos.

---

## 3. Per-category sourcing recipe

Concrete recipes for each of the 8 library categories. When authoring an entry, walk down the recipe top-to-bottom; if a section can't be sourced from Tier 1, escalate to Tier 2; if neither works, that section is original synthesis (Tier A review required for high-risk content).

### 3.1 Drugs (target: 50 entries v1)

Curator-model rule: every section comes from a primary source with attribution. No section is synthesized.

| Section of entry | Source recipe |
|---|---|
| Generic / brand names | RxNorm |
| Class, mechanism | openFDA SPL §12.1 — verbatim with attribution |
| Onset, half-life, pharmacokinetics | openFDA SPL §12.3 — verbatim |
| Standard concentration, how supplied | openFDA SPL §11 — verbatim |
| Indications | openFDA SPL §1 — verbatim or trimmed (no rewording) |
| Dosing (adult standard) | openFDA SPL §2 — verbatim with attribution |
| Boxed warning | openFDA SPL §5 — verbatim, mandatory if present |
| Contraindications, warnings, precautions | openFDA SPL §4–6 — verbatim |
| Adverse reactions | openFDA SPL §6 — verbatim |
| Drug interactions | openFDA SPL §7 — verbatim |
| Hepatotoxicity context | LiverTox NCBI NBK547852 — verbatim or trimmed (US gov, public domain) |
| **Nursing implications** | Pulled from Open RN Pharmacology and/or OpenStax Pharmacology if the drug is covered, with attribution. **OMITTED if not covered** (no synthesis). |
| **Monitoring** | VA PBM monograph if available (US gov, public domain), else Open RN/OpenStax content if covered, else **omitted**. |
| High-alert flag | Our taxonomy, fact-citation to ISMP list 2024 (concept is fact; never reproduce the list itself) |
| Attribution footer | "Sourced from: [list]. License: [per-source license]. Last retrieved: [date]." |

**v1 drug list selection method:** Cross-reference Open RN Pharmacology + OpenStax Pharmacology chapter indices with the most-prescribed-drugs-by-RNs survey data. Bias toward Med-Surg + ICU coverage. **The 50 are chosen specifically because Open RN or OpenStax covers them** — drugs without OER coverage either ship with SPL-only content (no nursing implications section) or get deferred to v1.1.

**Rendering note:** the EntryRenderer must handle "section omitted" gracefully. If a drug has no Open RN/OpenStax chapter, the entry renders the SPL sections + the high-alert flag + attribution footer, with no awkward empty "Nursing implications" header.

### 3.2 Drips (target: 15 entries v1)

Each drip is the drug entry above, plus drip-specific reference dose ranges. **The drip calculator is CUT** (Apple 1.4.2; see `docs/v1_SCOPE.md` §3.1).

| Section | Source recipe |
|---|---|
| Standard concentrations | openFDA SPL — verbatim |
| Dose ranges (mcg/kg/min, units/hr, etc.) | openFDA SPL — verbatim |
| Titration steps | Open RN/OpenStax Pharmacology if covered, else Surviving Sepsis PMC OA / AHA paraphrase + cite, else **omitted** |
| Administration (line, lumen, smart pump) | OpenStax Clinical Nursing Skills if covered (CC BY 4.0), else INS standards paraphrase + cite, else **omitted** |
| Monitoring | VA PBM monograph if available, else Open RN/OpenStax if covered, else **omitted** |
| ~~Calculator~~ | **CUT in v1.** Replaced with a reference dose table from openFDA SPL. v1.1+ may re-introduce with hospital/university partnership. |

### 3.3 Labs (target: 30 entries v1)

| Section | Source recipe |
|---|---|
| Reference range — adult | **Open RN appendix** (CC BY 4.0) + **OpenStax Clinical Nursing Skills Adult Lab Values appendix** (CC BY 4.0). Display verbatim with attribution. |
| Reference range — pediatric | **Cut in v1.** Skip pediatric ranges entirely unless covered in OpenStax Maternal Newborn (neonatal). v1.1 if we find a CC BY-licensed source. |
| Critical thresholds | Each cited to a specific public-domain source: lactate >4 → CMS SEP-1 + Surviving Sepsis PMC OA; K+ >6.5 → AHA ACLS (paraphrased + cited); glucose <40/>500 → CDC DKA guidance. **All sourced; none synthesized.** |
| Interpretation card | Threshold logic is deterministic (rule-based, non-AI per spec §4.6). The card text is **pulled from Open RN/OpenStax explanation chapters with attribution** — not synthesized. If no OER coverage, the interpretation card shows just the cited threshold ("> 4.0 mmol/L · Critical · Source: CMS SEP-1") with no further explanation. |
| Common causes | Pulled from Open RN Med-Surg / OpenStax disease chapters with attribution; **omitted if not covered** |
| Citations | Per-value, with provenance visible in the UI |

**Critical UX requirement:** every lab page must include the disclaimer "Reference intervals vary by laboratory, assay, and population. Always verify against your facility's reported reference range. Not for diagnostic decision-making." This is a clinical-safety baseline.

### 3.4 Procedures (target: 20 entries v1)

OpenStax Clinical Nursing Skills is the *killer* use case — step-by-step nursing procedures, CC BY 4.0, derivative-permitting. Most procedure entries are mostly OpenStax content with attribution.

| Section | Source recipe |
|---|---|
| Indications, contraindications | OpenStax Clinical Skills + Open RN Fundamentals — verbatim with attribution |
| Equipment | OpenStax Clinical Skills — verbatim |
| Pre-procedure checks | OpenStax Clinical Skills + Joint Commission NPSGs (paraphrased + cited) |
| Steps | OpenStax Clinical Skills — verbatim with attribution |
| Post-procedure | OpenStax Clinical Skills — verbatim |
| Documentation | OpenStax Clinical Skills + Joint Commission |
| Watch for | OpenStax Clinical Skills if covered, else **omitted** |
| Citations | Per-step where applicable |

**v1 procedure list selection:** Choose the 20 procedures that OpenStax Clinical Skills covers with full step-by-step content. Procedures not in OpenStax are deferred to v1.1.

### 3.5 Diagnoses (target: 25 entries v1)

| Section | Source recipe |
|---|---|
| Definition, pathophysiology | Open RN Med-Surg + OpenStax — verbatim with attribution |
| Presentation | Open RN Med-Surg + OpenStax — verbatim |
| Diagnostic criteria | Specialty guidelines (paraphrased + cited): SCCM PMC OA for sepsis, ADA paraphrased for DKA, AHA paraphrased for ACS |
| Priority assessments | Open RN/OpenStax if covered, else **omitted** |
| Common interventions | Open RN/OpenStax if covered, else **omitted** |
| Watch for | Open RN/OpenStax if covered, else **omitted** |
| Citations | Per-claim |

**v1 diagnosis list selection:** Choose the 25 diagnoses Open RN Med-Surg or OpenStax covers in depth. Med-Surg + ICU bias.

### 3.6 Scenarios (target: ~15 entries v1, REDUCED from spec's 30)

**Critical change in v1:** custom NCJMM-structured scenarios with original action ordering are **CUT** (synthesis = needs review = not in curator model). v1 ships:

- **OpenStax Clinical Nursing Skills case studies** (CC BY 4.0) — display verbatim with attribution
- **AHRQ TeamSTEPPS scenarios** (public domain) — display verbatim with attribution
- **Open RN unfolding case studies** if any books include them (CC BY 4.0)

NCJMM-structured custom scenarios are tracked for v1.1 with paid RN review (`docs/v1_SCOPE.md` §7).

### 3.7 Communication (target: 20 entries v1)

AHRQ TeamSTEPPS is the killer use case for this category — public domain, comprehensive, includes SBAR, I-PASS, CUS, DESC scripts, escalation patterns, and team communication scenarios.

| Section | Source recipe |
|---|---|
| SBAR templates | AHRQ TeamSTEPPS (public domain, verbatim) + Joint Commission paraphrased + cited |
| Escalation scripts | AHRQ TeamSTEPPS (CUS, DESC) — verbatim |
| Handoff frameworks (I-PASS, etc.) | AHRQ TeamSTEPPS — verbatim |
| Therapeutic communication | Open RN Mental Health + OpenStax Psychiatric-Mental Health — verbatim |
| De-escalation | OpenStax Psych-Mental Health if covered, else AHRQ TeamSTEPPS, else **omitted** |
| Citations | Per-template |

### 3.8 Reference (target: 15 entries v1)

| Section | Source recipe |
|---|---|
| Isolation precautions | CDC Siegel et al. Isolation Precautions Guideline — verbatim, public domain |
| Immunization schedules | CDC ACIP schedules — verbatim, public domain (auto-update annually) |
| Pain scales | FLACC + NRS verbatim (open). **Wong-Baker FACES CUT in v1** — licensed for non-commercial clinical use; paid commercial use is murky and not worth the risk. Use Open RN/OpenStax pain assessment chapter content instead. |
| Equipment quick-refs | OpenStax Clinical Skills (CC BY 4.0) — verbatim where covered; manufacturer IFUs linked (not reproduced) |
| Standard precautions, hand hygiene, PPE | CDC — verbatim, public domain |
| HIPAA / scope of practice | Open RN Fundamentals (CC BY 4.0) + ANA paraphrased + cited; state-board references via link only |

---

## 4. NCLEX-RN 2026 Test Plan alignment

The active blueprint is the **2026 NCLEX-RN Test Plan** (effective April 2026), not the 2023 plan. PDF: https://www.nclex.com/files/2026_RN_Test%20Plan_English-F.pdf

### 4.1 Client Needs distribution (point estimates)

| Category / Subcategory | Range | Point % |
|---|---|---|
| Safe and Effective Care Environment | | |
| – Management of Care | 15–21% | 18% |
| – Safety and Infection Prevention/Control | 10–16% | 13% |
| Health Promotion and Maintenance | 6–12% | 9% |
| Psychosocial Integrity | 6–12% | 9% |
| Physiological Integrity | | |
| – Basic Care and Comfort | 6–12% | 9% |
| – **Pharmacological and Parenteral Therapies** | **13–19%** | **16%** |
| – Reduction of Risk Potential | 9–15% | 12% |
| – Physiological Adaptation | 11–17% | 14% |

Pharm + Phys Adaptation + Reduction of Risk = ~42% — the exam's center of gravity matches NurseMind's natural strength (drugs, drips, scenarios).

### 4.2 Six integrated processes (woven through every entry)

Caring · Clinical Judgment · Communication & Documentation · Culture & Spirituality · Nursing Process (ADPIE) · Teaching/Learning

### 4.3 Recommended v1 distribution mapped to Test Plan tags

Two parallel views: keep the 8 functional libraries as the user-facing IA, AND add a hidden Test-Plan tag set so search/filter and AI retrieval can weight by NCLEX yield.

| Test Plan tag | Target % | Target items | Where they live in NurseMind libraries |
|---|---|---|---|
| Management of Care | 18% | ~37 | Communication (handoff, SBAR, delegation), Reference (advance directives, scope, ethics, HIPAA), Scenarios (triage/prioritization) |
| Safety & Infection Prev/Control | 13% | ~27 | Procedures (asepsis, isolation, restraints), Reference (precautions chart), Diagnoses (CAUTI, CLABSI, MDROs) |
| Health Promotion | 9% | ~18 | Reference (immunization, screenings, growth), Scenarios (prenatal/postpartum) |
| Psychosocial Integrity | 9% | ~18 | Communication (therapeutic comm), Diagnoses (depression, dementia, SUD), Scenarios (suicide risk, grief, abuse) |
| Basic Care & Comfort | 9% | ~18 | Procedures (ADLs, NG, irrigation), Reference (pain scales) |
| **Pharmacological & Parenteral** | **16%** | **~33** | **Drugs + Drips + a few Procedures (rights, calc, blood admin, CL, TPN)** |
| Reduction of Risk Potential | 12% | ~25 | Labs, Procedures (IV start, Foley, ECG), Scenarios (peri-op, sedation) |
| Physiological Adaptation | 14% | ~29 | Diagnoses (MI, DKA, sepsis, AKI, ARDS, ICP), Drips (vasoactives), Procedures (suction, chest tube, vent, dialysis), Scenarios (rapid response) |

Total ≈ 205. This grounds the v1 entry counts to NCLEX yield rather than founder intuition.

### 4.4 Tag schema (add to data model)

Append to `library_entries`:
- `test_plan_category` (TEXT, one of the 8)
- `test_plan_subcategory` (TEXT)
- `integrated_processes` (TEXT[])
- `cjmm_steps` (TEXT[]) — for scenarios
- `priority_concept` (TEXT) — perfusion, gas exchange, infection, safety, etc.
- `cognitive_level` (TEXT) — knowledge / application / analysis

This unlocks the killer feature of paid review platforms: "you're light on Reduction of Risk — here are 5 labs to drill."

---

## 5. NGN scenarios — the Clinical Judgment Measurement Model

Next Generation NCLEX (launched April 2023, retained in 2026) is anchored in NCSBN's NCJMM. Scenarios in NurseMind should explicitly model the six layer-3 cognitive steps:

1. **Recognize cues** — what's abnormal, what's significant
2. **Analyze cues** — what could explain these findings
3. **Prioritize hypotheses** — which is most likely / most urgent
4. **Generate solutions** — what could the nurse do
5. **Take action** — what does the nurse do *first*
6. **Evaluate outcomes** — did it work; what next

### 5.1 Scenario template (replaces the spec's plain "5-minute playbook" structure)

Each scenario unfolds in 4–6 beats. At each beat, surface one CJMM step:

```
SCENARIO: Patient suddenly hypotensive

Beat 1 — Recognize cues
  Vitals: BP 82/40, HR 122, RR 24, SpO2 92%
  Mental status: confused, was alert 30 min ago
  Skin: cool, mottled

Beat 2 — Analyze cues
  What could explain this presentation?
  ☐ Hypovolemia
  ☐ Sepsis
  ☐ Cardiogenic
  ☐ Anaphylaxis
  [Multi-select. Show reasoning per choice.]

Beat 3 — Prioritize hypotheses
  Given recent course (post-op CABG, 6h post-arrival),
  what's most urgent to rule out first?

Beat 4 — Generate / Take action
  What do you do in the first 5 minutes?
  ☐ Recheck BP, opposite arm
  ☐ Call rapid response
  ☐ Position flat (unless contraindicated)
  ☐ Notify provider with SBAR
  ☐ Start fluids
  ☐ Get labs

Beat 5 — Evaluate
  After 500 mL bolus and SBAR call, BP 95/55.
  What's next?
```

### 5.2 NGN-style item types we can adopt in scenarios

Per NCSBN's tutorial, NGN supports: Extended Multiple Response, Drag-and-Drop, Cloze (drop-down), Matrix/Grid, Highlight, and Bow-Tie (synthesizes all 6 CJMM steps into one item). NurseMind doesn't need to replicate exam mechanics, but the *cognitive structure* — multi-select cues, prioritization, action selection with reasoning — is the differentiator.

### 5.3 Priority scenarios for v1 (~30)

NGN high-yield clinical-judgment topics: sepsis recognition · stroke (LVO, NIHSS, tPA window) · DKA/HHS · AMI/ACS · postpartum hemorrhage · pre-eclampsia/HELLP · opioid OD/withdrawal · GI bleed · anaphylaxis · ARDS/respiratory failure · AKI/electrolyte (K+, Na+, Ca²⁺) · heart failure exacerbation · alcohol withdrawal/CIWA · suicidal ideation · pediatric dehydration/croup · neutropenic fever · transfusion reaction · increased ICP · DVT/PE · hypotension differential · dysrhythmias · code blue · rapid response · medication error · falls · agitation/violence · seizure · hypoglycemia · respiratory distress · chest pain workup.

---

## 6. Content assembly pipeline (curator model)

The curator model has no "authoring" stage in the traditional sense. The pipeline is: ingest → extract per-entry chunks → render. AI-as-author is gone for v1; AI-as-co-pilot remains.

### 6.1 Pipeline

```
Stage 1: Source ingestion (one-time + scheduled refresh)
  ├── Pull openFDA SPL bulk download for top 200 drugs by RxNorm CUI
  ├── Pull Open RN textbooks (5 books, CC BY 4.0) via Pressbooks export
  ├── Pull OpenStax Nursing (6 books, CC BY 4.0) via OpenStax export
  ├── Pull VA PBM monograph index
  ├── Pull AHRQ TeamSTEPPS Pocket Guide + scenarios
  ├── Pull CDC Isolation Precautions + ACIP schedules
  ├── Pull LiverTox NBK547852
  └── Tag every chunk with: source_id, source_name, license, license_url,
       attribution_text, retrieved_at, source_url
       └─→ corpus stored in Supabase library_chunks with embeddings (for AI co-pilot)
       └─→ also stored in `content/<source>/<slug>.json` (for entry assembly)

Stage 2: Per-entry assembly (assembler script, not authoring)
  ├── For each v1 entry topic (e.g., "Norepinephrine drug")
  │     - Pull openFDA SPL sections (verbatim, by section_id)
  │     - Pull Open RN/OpenStax chapter sections that match the topic
  │     - Pull VA PBM monograph if available
  │     - Pull LiverTox section if drug has hepatotox profile
  ├── Map source sections to NurseMind body schema sections
  │     - openFDA SPL §1 → indications field
  │     - openFDA SPL §2 → dosing field
  │     - openFDA SPL §5 → boxed_warning field (if present)
  │     - Open RN/OpenStax pharmacology chapter → nursing_implications field
  │     - VA PBM monitoring section → monitoring field
  │     - Etc.
  ├── Omit any section where no source content exists. Do not synthesize.
  ├── Generate attribution_block from all source contributions
  └── Output: entry JSON matching content body schema, fully attributed

Stage 3: Founder QA pass (no clinical review)
  ├── Visual: does the entry render correctly in EntryRenderer?
  ├── Attribution: are all sources listed with correct license + URL?
  ├── Completeness: is anything missing that the source has?
  ├── Selection: is the right section pulled into the right field?
  └── If issues, fix the assembler script or the section mapping; never edit the content text

Stage 4: Publish
  ├── scripts/import-content.ts upserts into library_entries + regenerates embeddings
  └── Reporting loop active immediately
```

### 6.2 The assembly script (replaces author-entry.ts)

`scripts/assemble-entry.ts` — pseudo-code:

```
function assembleDrugEntry(rxnormCui: string): DrugEntry {
  const spl = fetchOpenFDASpl(rxnormCui);
  const openRnChapter = lookupOpenRnPharmacologyChapter(rxnormCui);
  const openStaxChapter = lookupOpenStaxPharmacologyChapter(rxnormCui);
  const vaPbm = lookupVaPbmMonograph(rxnormCui);
  const liverTox = lookupLiverToxEntry(rxnormCui);
  
  return {
    title: spl.brandName + " (" + spl.genericName + ")",
    sections: [
      keyValueTable("Quick reference", extractKvFromSpl(spl)),
      prose("Indications", spl.section_1_indications, [spl.id]),
      prose("Dosing (adult)", spl.section_2_dosage, [spl.id]),
      ...(spl.boxed_warning ? [boxedWarning(spl.boxed_warning, [spl.id])] : []),
      prose("Contraindications", spl.section_4, [spl.id]),
      prose("Warnings & precautions", spl.section_5, [spl.id]),
      prose("Adverse reactions", spl.section_6, [spl.id]),
      prose("Drug interactions", spl.section_7, [spl.id]),
      // OMIT if no Open RN/OpenStax coverage:
      ...(openRnChapter || openStaxChapter
        ? [prose("Nursing implications",
            mergeAttributedContent(openRnChapter, openStaxChapter),
            [openRnChapter?.id, openStaxChapter?.id].filter(Boolean))]
        : []),
      ...(vaPbm
        ? [prose("Monitoring", vaPbm.monitoringSection, [vaPbm.id])]
        : []),
      ...(liverTox
        ? [prose("Hepatotoxicity", liverTox.summary, [liverTox.id])]
        : []),
      attributionFooter(allSourceIds),
    ],
    high_alert: lookupIsmpHighAlert(rxnormCui),
    citations: buildCitationList(allSourceIds),
  };
}
```

**Key invariant:** the assembler never *generates* prose. It selects, slices, and wires together prose that already exists in the corpus. If a section can't be filled from the corpus, it's omitted. This is the curator model in code.

### 6.3 What AI is used for in v1

- **AI co-pilot (Ask tab)** — RAG generation over the same corpus. Citation-required. Refusal-on-scope. This is unchanged from spec §7. AI is generating *answers*, not entries.
- **Section-mapping suggestions** during corpus ingest — when a new Open RN chapter comes in, AI helps map paragraphs to topic candidates (which drug, which lab, etc.). Founder reviews suggestions before they enter the topic-mapping table. AI is doing curation assistance, not authoring.

### 6.4 What we never do in v1

- AI generation of "nursing implications" prose that gets published as NurseMind content (this would be synthesis = needs review = not curator model)
- Paraphrasing source content with AI to "improve readability" (defeats the curator model and risks misrepresentation)
- Original scenario action ordering, custom NCJMM beats, or any other authored clinical opinion
- Pediatric dosing content beyond what OpenStax Maternal Newborn covers
- Cross-source synthesis ("Open RN says X, AHA says Y, here's the unified view") — that's synthesis

---

## 7. Quality assurance in the curator model (replaces tiered review)

The curator model has no clinical-review tier system because we don't author clinical content. QA shifts from clinical-correctness review to source-fidelity QA: did the assembler pull the right section, attribute correctly, and render properly.

### 7.1 The three QA modes

**Pre-publication source-fidelity QA (founder, ~10 min/entry)**

For every entry before `is_published = TRUE`:
- All claimed sources actually exist in the corpus (no broken references)
- Attribution block lists every contributing source with license + URL
- Each section's content was pulled from the cited source (spot-check by re-reading source)
- Boxed warnings (if present) are verbatim, not trimmed
- "Section omitted" cases are intentional (no missing data due to script bug)
- The entry renders correctly in EntryRenderer preview
- License compliance: CC BY 4.0 sources have full attribution block; CC0 sources note public domain status; openFDA notes FDA non-endorsement disclaimer

This is a checklist, not a clinical judgment. Anyone who can read can do it.

**Post-publication reporting loop (founder, weekly triage)**

Every entry has "Report an issue" linked to a queue. Triage outcomes (none requiring clinical review):
- Source content has updated (openFDA SPL revised, Open RN textbook re-released) → re-pull and re-publish
- Wrong source section pulled into wrong field → fix the assembler mapping, re-publish
- Section that should exist is missing → check why (corpus gap vs assembler bug)
- AI co-pilot answer flagged → review against retrieved corpus, tune prompt, expand corpus, never weaken citation requirement
- Attribution missing or wrong → fix attribution rendering

If a flag claims a *clinical fact is wrong*, the response is to verify the source content (it's possible the source itself is dated or incorrect — rare, but possible). If the source is correct, we display the source content; we don't override it with founder opinion. If the source is genuinely wrong, we either remove the entry, swap to a different source, or note the discrepancy with both citations.

**Quarterly source-refresh audit (founder, batched)**

Every quarter:
- Re-pull openFDA SPL for all v1 drugs (FDA labels update routinely)
- Check for new editions of Open RN and OpenStax books
- Refresh CDC ACIP schedule (annual)
- Refresh AHRQ TeamSTEPPS materials
- Update last_retrieved_at on all entries; flag any with stale source data > 1 year

### 7.2 The attribution block (every entry footer)

Replaces the "Reviewed by [Name], [Credentials]" line from the spec. Format:

```
SOURCED FROM

• openFDA Drug Label · [SETID] · public domain (CC0)
   Last retrieved: 2026-05-03

• Open RN Pharmacology, Ch. 12 — Adrenergic Agonists
   Chippewa Valley Technical College · CC BY 4.0
   https://wtcs.pressbooks.pub/nursingpharmacology/chapter/12

• OpenStax Pharmacology, Ch. 14 — Sympathomimetic Drugs
   Rice University · CC BY 4.0
   https://openstax.org/books/pharmacology/...

• ISMP High-Alert Medications List 2024 (concept citation only)
   https://www.ismp.org/recommendations/high-alert-medications-acute-list

Last reviewed for source fidelity: 2026-05-03
Report an issue ↗
```

### 7.3 Editorial Standards page (nursemind.app — public-facing)

Replaces the "named clinical advisor" credibility surface. Documents:

- The curator model in plain language: "We don't write our own clinical content. We display content from accredited sources — openFDA, Open RN, OpenStax, CDC, AHRQ, VA PBM, NIH. Every claim is cited and linked back to its source."
- The source hierarchy with license terms and URLs
- The attribution practice
- The AI co-pilot's grounding policy and refusal scope
- The reporting loop and our triage policy
- Last quarterly source-refresh date
- The founder's name + credentials honestly stated ("software engineer, not a licensed clinician — credibility comes from the named sources, not from us")

This page is the credibility surface. It is meant to invite scrutiny, not deflect it.

---

## 8. Apple 1.4.2 — RESOLVED in v1: cut at-risk calculators

**Apple App Store Review Guideline 1.4.2:** "Drug dosage calculators must come from the drug manufacturer, a licensed medical provider, a registered nurse, a hospital, university, health insurance company, pharmacy or other approved entity, or receive approval by the FDA or one of its international counterparts."

The spec's calculator hub (Tools tab, §4.12) includes:
- IV drip rate (mcg/kg/min → mL/hr) ← **patient-specific dose** — at risk
- Weight-based dose ← **patient-specific dose** — at risk
- Pediatric dose by weight ← **patient-specific dose** — at risk
- Opioid conversion ← **patient-specific dose** — at risk
- Steroid equivalency ← **patient-specific dose** — at risk
- Maintenance IV (4-2-1) ← borderline
- Burn fluids (Parkland) ← **patient-specific dose** — at risk
- Heparin nomogram ← **patient-specific dose** — at risk

**Safe (non-drug-dose calculators):** MAP · Cardiac index · P/F ratio · Oxygenation index · GFR (CKD-EPI) · Anion gap · Corrected sodium/calcium · FENa · MEWS / NEWS2 · GCS · Apgar · FLACC · BMI · BSA · IBW.

**Options for the at-risk calculators:**

1. **Cut from v1.** Ship MAP/GFR/MEWS/etc. only. Marketing repositions calculators as "clinical scoring tools," not "dose calculators." Nurses use MDCalc or facility tools for drug dose. Fastest path to App Store approval.
2. **Partner with a hospital, university, or pharmacy** as the publisher of record. They review and "approve" the calculators; their name appears on each. Adds an outreach lift but preserves the feature.
3. **Reframe as reference dose tables.** Show the formula, show the standard ranges, but do NOT auto-compute a patient-specific output. UX downgrade — defeats the point.
4. **Source the calculators FROM a manufacturer/hospital/university** with their permission. E.g., reproduce a published institutional protocol with attribution.

**Decision (2026-05-03):** Option 1 — cut all patient-specific drug-dose calculators from v1. Option 2 (hospital/university partnership for v1.1+) tracked in `docs/v1_SCOPE.md` §7. v1 ships only Apple-1.4.2-safe calculators (clinical scoring, generic clinical math): MAP, Cardiac Index, P/F ratio, Oxygenation Index, GFR, Anion gap, Corrected Na+/Ca²⁺, FENa, MEWS, NEWS2, GCS, Apgar, FLACC, BMI, BSA, IBW.

---

## 9. FDA CDS jurisdiction — staying out

Per FDA's Sept 2022 final guidance on Clinical Decision Support, software stays *outside* device jurisdiction (non-device CDS) only if it meets ALL FOUR §520(o)(1)(E) criteria:

1. Does not acquire, process, or analyze a medical image or signal
2. Displays, analyzes, or prints medical information normally communicated between HCPs
3. Provides recommendations (information/options), not directives
4. **Discloses the basis so the HCP does not rely primarily on the recommendation**

NurseMind's design (reference + co-pilot, no diagnosis/prescribing) plausibly clears all four IF:

- Co-pilot answers cite primary sources visibly on every clinical claim (criteria 4)
- UI never produces a single directive output ("give X mg") (criteria 3) — refusal templates are jurisdictional, not just safety
- No image/signal analysis (criteria 1) — we don't process EKG strips, X-rays, or waveforms in v1

**What we must NEVER do** (would push us into FDA jurisdiction):
- Auto-recommend a specific patient action ("administer X")
- Process patient-specific data inputs to produce a clinical conclusion (this is partly why patient-specific dose calculators are extra-risky)
- Diagnose
- Prescribe

**What we already do that protects us:**
- Refusal templates A–D in spec §4.11
- Citation enforcement on every numerical claim (spec §7.7)
- "Reference only" footer on every AI response

Document this safe-harbor analysis with counsel before launch.

---

## 10. Citation schema (data model)

Citations live as structured data, not free text.

```sql
-- Already in spec §6.1; this is the operational use
CREATE TABLE citation_sources (
  id TEXT PRIMARY KEY,                -- e.g. 'cdc_isolation_2007'
  short_name TEXT NOT NULL,           -- "CDC Isolation Precautions, 2007"
  full_name TEXT NOT NULL,
  publisher TEXT,
  publication_year INT,
  url TEXT,
  license TEXT NOT NULL,              -- 'public_domain' | 'cc_by_4' | 'cc_by_sa_4' | 'cc0' | 'fair_use_cite_only' | 'paid_license'
  trust_tier INT NOT NULL,            -- 1 | 2 | 3 (corresponds to §2.1-2.3)
  last_verified_at TIMESTAMPTZ,
  attribution_text TEXT               -- the exact attribution string to display
);
```

Every entry's body has citations referenced by `id`. Every UI render of a citation shows: short_name + year + a link icon that opens the source URL in Safari (with attribution_text in a footer if license requires it).

The license field is what allows us to:
- Render `cc_by_4` content with attribution
- Block `cc_by_nc_nd_4` content from ever entering the corpus (won't happen because we filter at ingest, but defense in depth)
- Generate the per-entry citation list dynamically

---

## 11. Per-entry source-fidelity checklist (curator model)

Before any entry moves to `is_published = TRUE`, the founder runs this. None of these require clinical judgment.

```
[ ] Topic mapped to NCLEX Test Plan category + subcategory
[ ] Every section's content traces to a corpus source_id
[ ] No section contains text that doesn't appear in a source (no synthesis)
[ ] Boxed warnings / dosing / contraindications are verbatim from openFDA SPL
[ ] CC BY 4.0 source content has full attribution_block entry (license name + URL)
[ ] CC0 / public domain sources noted as such
[ ] Section omissions are intentional (no missing data due to assembler bug)
[ ] Attribution footer rendered correctly with all contributing sources
[ ] Disclaimer footer present (lab entries: range-variation disclaimer)
[ ] "Report an issue" link wired
[ ] Entry rendered in EntryRenderer preview — nothing breaks visually
[ ] Last_retrieved_at set on every contributing source
[ ] Search vector regenerated, AI corpus embedding updated
```

---

## 12. Open issues to resolve

| # | Issue | Owner | Blocks |
|---|---|---|---|
| C1 | Open RN + OpenStax licenses confirmed CC BY 4.0 by reading each book's license page | Founder | Corpus ingest |
| C2 | ~~First reviewer recruited~~ → **Resolved 2026-05-03**: not needed for v1 in curator model | — | — |
| C3 | ~~Apple 1.4.2 calculator decision~~ → **Resolved 2026-05-03**: cut at-risk calculators from v1 (`docs/v1_SCOPE.md` §3.1) | — | — |
| C4 | Counsel review of: ToS + Privacy + EULA + refusal templates + safety contract + FDA CDS safe-harbor + FTC marketing/disclaimer match | Founder + healthcare attorney | Public TestFlight gate |
| C5 | Tech E&O insurance with bodily-injury carve-back bound | Founder + broker | Public TestFlight gate |
| C6 | Editorial Standards page drafted for nursemind.app (curator-model framing) | Founder | Public launch |
| C7 | Attribution-string registry started for every Tier 1 source (canonical attribution text per source for reuse) | Founder | First assembler script run |
| C8 | OpenStax Clinical Skills procedure inventory: which 20 procedures are fully covered with step-by-step content (drives v1 procedure list selection) | Founder | Procedure entry assembly |
| C9 | Open RN/OpenStax pharmacology drug coverage: which of the top 50 most-needed drugs are covered (drives v1 drug list selection) | Founder | Drug entry assembly |
| C10 | OpenStax/Open RN scenario inventory: how many existing case studies can ship as v1 Scenarios | Founder | Scenarios category sizing |

---

## Source bibliography (what this playbook is built on)

Research-agent findings, with primary URLs:

- openFDA license (CC0): https://open.fda.gov/license/
- DailyMed services: https://dailymed.nlm.nih.gov/dailymed/app-support-web-services.cfm
- RxNorm terms: https://www.nlm.nih.gov/research/umls/rxnorm/docs/termsofservice.html
- Open RN textbooks (CC BY 4.0): https://www.ncbi.nlm.nih.gov/books/NBK615342/ ; https://www.ncbi.nlm.nih.gov/books/NBK613071/
- OpenStax Nursing (CC BY 4.0): https://openstax.org/subjects/nursing
- VA PBM monographs: https://www.pbm.va.gov/PBM/clinicalguidance/drugmonographs/
- LiverTox (NBK547852): https://www.ncbi.nlm.nih.gov/books/NBK547852/
- MedlinePlus content rules: https://medlineplus.gov/about/using/usingcontent/
- CDC content reuse: https://www.cdc.gov/other/agencymaterials.html
- StatPearls license (CC BY-NC-ND 4.0 — DO NOT USE): https://www.ncbi.nlm.nih.gov/books/NBK430685/
- ASHP / AHFS PMI licensing (DO NOT USE): https://www.ashp.org/products-and-services/ashp-licensing/ashp-patient-medication-information
- Testing.com terms (DO NOT USE): https://www.testing.com/terms-of-use/
- 2026 NCLEX-RN Test Plan: https://www.nclex.com/files/2026_RN_Test%20Plan_English-F.pdf
- 2026 NCLEX-PN Test Plan: https://www.nclex.com/files/2026_PN_Test%20Plan-F.pdf
- NCLEX Test Plans hub: https://www.nclex.com/test-plans.page
- Apple App Store Review Guidelines (1.4.1, 1.4.2): https://developer.apple.com/app-store/review/guidelines/
- FDA CDS guidance (Sept 2022): https://www.fda.gov/medical-devices/software-medical-device-samd/clinical-decision-support-software-frequently-asked-questions-faqs
- FTC Health Products Compliance Guidance: https://www.ftc.gov/business-guidance/resources/health-products-compliance-guidance
- VeriCite / Self-RAG citation enforcement (SIGIR 2025): https://dl.acm.org/doi/10.1145/3767695.3769505
- Chain-of-Verification (CoVe): https://learnprompting.org/docs/advanced/self_criticism/chain_of_verification
- NurseLabs editorial: https://nurseslabs.com/about/
- Geeky Medics editorial: https://geekymedics.com/editors-list/
- NurseMagic ToS (disclaimer pattern): https://www.nursemagic.ai/terms-of-service
- Founder Shield Tech E&O: https://foundershield.com/coverage/tech-eo/
