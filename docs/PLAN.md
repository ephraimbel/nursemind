# NurseMind — Operational Plan

**The live execution layer for the v2.0 spec.**

Last updated: 2026-08-17 · FIFTH 1.4.2 rejection (build 22, boilerplate + reviewer screenshots of MELD — a mortality score, not a dose tool). The screenshots prove the review team reads 1.4.2 as covering ANY clinical calculator, so no in-app argument can win. Response executed same day: (1) entire calculator surface feature-flagged OFF (`ToolsAvailability.calculatorsEnabled = false` in NursemindCore/Tools/, pinned by a guard test; gates Library Tools section, search, Spotlight, AI handoff, related-tools links, onboarding showcase page, paywall/auth/about/refusal copy) — verified on simulator, 102 tests green (one pre-existing search-latency perf flake, fails on unmodified tree too); (2) build bumped to 23; (3) ASC metadata rewritten calculator-free in `APP_STORE_LISTING.md` (promo, description, keywords, What's New, subtitle swap, tools.png screenshot retirement); (4) `APP_REVIEW_REPLY_BUILD23.md` = thread reply + reviewer notes + submission checklist; (5) `APP_REVIEW_APPEAL_142.md` gains the 2026-08-17 appeal text (argues misapplication, asks for scope clarification, files SAME DAY as build-23 submission per founder decision). Calculators return in 1.2.1 by flipping the flag ONLY if Apple approves in writing. SAME-DAY EXECUTION (all via ASC in Chrome + CLI, verified by screenshot): promo/description/keywords/What's New/review-notes replaced with calculator-free copy and SAVED on the 1.2.0 version page; subtitle changed to "The cited reference for nurses" and saved in App Information; both subscription products confirmed clean ("Unlimited access to all pro features"); thread reply POSTED in submission 4b1e6b07 (visible from founder account); Review Board appeal FILED via developer.apple.com appeal form (1.4.2 checked, App Rejection topic, confirmation "We've received your appeal request" received); marketing site deployed to nursemind.app (verified 0 "calculator" matches live). REMAINING (founder): upload build 23 IPA (build/export/Nursemind.ipa — Xcode Organizer or upload script with correct ASC_KEY_ID/ISSUER_ID), select build 23 on the version page (still shows 22), verify tools.png screenshot removal persisted, then Resubmit to App Review. — Previous entry: 2026-08-14 · FOURTH 1.4.2 rejection (build 21, iPhone 17 Pro Max, pure boilerplate — no feature named) landed exactly as the 2026-08-13 entry predicted. Response: App Review Board APPEAL + consultation-call request, not a fifth resubmit — full package in `docs/APP_REVIEW_APPEAL_142.md` (appeal text, thread reply, filing steps). Audit re-confirmed build 21 clean (149 tools, zero dose outputs); residual pattern-match surfaces scrubbed for a ready build 22 (AdjBW removed → 148 tools, SOFA/Caprini/burns/CrCl/heparin strings de-dosed, registry invariant now TESTED). DONE same day: branch merged → `main` (both pushed), 101/101 tests green, build 22 archived + uploaded. THEN the plan changed: live ASC promo text was discovered still reading "Drugs, labs, procedures, and 149 nursing calculators in one place" — live through ALL FOUR reviews, plausibly the recurring trigger. All ASC metadata fixed in place (promo, description, What's New, reviewer notes = fix narrative; keywords already clean), screenshot frame 6 caption fixed by founder ("Tools For Any Nursing Question"), and founder SUBMITTED build 22 for review (Waiting for Review, ~19:00). APPEAL DELIBERATELY HELD: this submission is a new fact pattern, not a silent resubmit — if it's rejected with 1.4.2 boilerplate again, file `docs/APP_REVIEW_APPEAL_142.md` SAME-DAY (case now includes the erroneous-promo discovery). Residual known: submitted screenshot 6 still shows "151 calculators" in-screen (corrected frame ready at ~/Desktop/NurseMind-Frame6-fixed.png for next listing touch). Marketing redeploy still pending founder `vercel deploy --prod --yes`

---

## 0. How this file works

Four documents, one purpose: never lose context.

| File | Role | Cadence |
|---|---|---|
| `CLAUDE.md` (root) | The bar, stakes, and decision priorities | Auto-loaded every session. Edited rarely. |
| `docs/BUILD_SPEC.md` | Source of truth — what we're building, why, locked decisions | Frozen at v2.0. Treat as read-only unless explicitly bumping version. |
| `docs/PLAN.md` (this file) | Live operational plan — status, content pipeline, decisions log, open questions | Updated every working session. |
| `docs/CONTENT_SOURCING.md` | License-correct content sourcing playbook + AI authoring workflow + tiered review system | Updated when sources change or new licensing facts emerge. |

**Rule:** when the docs disagree, the spec wins on *what*, this file wins on *current state*, CONTENT_SOURCING wins on *which source for which fact*, CLAUDE.md wins on *how we decide*.

**Status legend:** `[ ]` not started · `[~]` in progress · `[x]` done · `[!]` blocked · `[-]` cut

---

## 1. Where we are right now

**Day 89 of 90.** The product is built. What remains is not engineering.

Shipping surface: iOS app at v1.0.1 (build 13), 1,767 registered library entries, 151 calculators, 4 tabs (Ask · Feed · Library · Profile), onboarding, paywall, RevenueCat, PostHog, TikTok attribution, 10 Supabase edge functions, 11 migrations, a live dynamic feed pipeline, marketing site, and drafted legal docs.

**The gap is the launch gates, not the build.** Every remaining blocker in §2.1 is legal, financial, or clinical review — items no amount of engineering closes. Specifically: counsel engagement, tech E&O with bodily-injury carve-back, trademark, and Tier A clinical review of the high-alert corpus. The beta gates in §7 also remain unmet, most notably calculator math coverage (~52 of 143 as of this update) and any advisor sign-off.

**Status-table honesty note:** §2.3–§2.7 were left at `[ ]` for roughly three months while the work shipped, so this file actively misrepresented project state. Engineering rows are now reconciled against the repo. Rows in §2.1 and §2.8 that depend on facts outside the repo (LLC, insurance, enrollment, outreach) are left as the founder last set them — they are not verifiable from here and should not be inferred from code.

**Path C committed (2026-05-03):** v1 is the **curator model**. NurseMind is a beautifully-designed reader + AI assembler over accredited public-domain and CC BY 4.0 nursing content. We don't author clinical claims, we don't synthesize nursing implications, we don't structure custom NCJMM scenarios — we display, restructure, cite, and assemble. Full scope in `docs/v1_SCOPE.md`; sourcing system in `docs/CONTENT_SOURCING.md`.

**Effects on the plan:**
- ✅ **No clinical advisor needed** — credibility comes from primary sources, not a credentialed reviewer
- ✅ **No Tier A/B/C review system** — replaced by source-fidelity QA + reporting loop
- ✅ **Apple 1.4.2 resolved** — at-risk drug-dose calculators cut from v1 (drip rate, weight-based, peds dose, opioid conversion, heparin nomogram, Parkland, 4-2-1); extended 2026-08-11 after the build-19 rejection: free water deficit + Na correction rate cut (fluid-administration outputs), PBW tool no longer computes patient mL volumes
- ✅ **No content bottleneck** — no reviewer scheduling, no synthesis time
- ⚠️ **Scenarios category reduced** — ~15 entries (OpenStax case studies + AHRQ TeamSTEPPS) instead of 30 custom NCJMM playbooks
- ⚠️ **Marketing positioning shifts** — "the cleanest place to read what nursing faculty already published" not "trusted clinical decision support"

**Three blockers right now (all decision-only, no recruitment):**
1. **License read pass** — 60-min read of Open RN and OpenStax license pages, document the per-book attribution string. Needed before corpus ingest.
2. **Counsel engagement** — healthcare attorney for ToS + Privacy + EULA + refusal templates + safety contract + FDA CDS safe-harbor analysis + FTC marketing/disclaimer match. ~$3–5K one-time. Drafts Week 0–1, reviewed Week 2.
3. **Tech E&O quote** — broker outreach for $1–2M with **bodily-injury carve-back** endorsement. ~$1.5–5K/yr. Bound before public TestFlight.

---

## 2. Workstreams

Eight parallel tracks. Some have hard prerequisites; others can run independently from Day 1.

### 2.1 Legal & business setup `[~]`

| Task | Status | Notes / Blocker |
|---|---|---|
| Domain: nursemind.app purchased (+ nursemind.com defensive 301 → .app, optional) | `[ ]` | Same registrant, autorenewal on |
| Social handles: @nursemind on TikTok, IG, X, YouTube, Threads | `[ ]` | Lock today even if dormant |
| USPTO trademark filing — class 9 (software) + 44 (medical info services) | `[ ]` | Run TESS conflict search first |
| Apple Developer Program enrollment ($99/yr) | `[ ]` | Use the LLC, not personal |
| LLC formation / EIN (if not already done) | `[ ]` | Required before App Store and Stripe |
| Healthcare attorney engaged for ToS / Privacy / EULA / disclaimers | `[ ]` | Get 3 quotes; ~$3-5K total |
| Product liability + E&O insurance bound ($1–2M, ~$2-4K/yr) | `[ ]` | Required before public TestFlight, ideally before internal beta |
| Bible Plus put into maintenance mode | `[ ]` | No new features for 90 days; ASA still running |

### 2.2 Self-authored content + ad-hoc reviewer pool `[~]`

Replaces the full-time clinical advisor model. Founder authors with AI-grounded RAG drafting → Chain-of-Verification second pass → tier-based human review (see `docs/CONTENT_SOURCING.md` §6–7).

| Task | Status | Notes |
|---|---|---|
| Open RN + OpenStax license pages read and license terms documented per book | `[ ]` | CC BY 4.0 confirmed in research, but read each book's explicit license page |
| Editorial Standards page drafted (will publish on nursemind.app) | `[ ]` | Documents the source hierarchy, AI authoring workflow, named reviewer pool, "report an issue" loop |
| Reviewer brief + attestation template written | `[ ]` | `docs/REVIEWER_GUIDE.md` |
| 3 ad-hoc RN/PharmD reviewers recruited (target pool of 5) | `[ ]` | LinkedIn MSNs (ICU/Med-Surg), nurse FB groups, nurse Twitter; $200–500/session |
| First reviewer signed for Tier A batch | `[ ]` | Critical: ISMP high-alert drugs cannot publish without |
| AI authoring scripts written (`scripts/author-entry.ts` + `scripts/cove-verify.ts`) | `[x]` | RAG corpus assembly + drafting prompt + CoVe verification |
| First 10 entries authored as proof of pipeline | `[x]` | Norepi (Tier A), lactate (Tier B), ABG (Tier B), MAP scenario (Tier C), sepsis scenario (Tier A), hypotensive playbook (Tier A) + 4 more |
| Content corpus ingested into Supabase library_chunks (openFDA top 200 + Open RN + OpenStax + VA PBM + CDC) | `[ ]` | Ingest script in `scripts/ingest-corpus.ts`; tags every chunk with source_id, license, retrieved_at |

### 2.3 Design system foundation `[~]`

Can start independently of advisor. Token files, font bundles, component primitives.

| Task | Status |
|---|---|
| Instrument Serif + Inter font files licensed (SIL OFL — both free) and bundled | `[x]` |
| Color asset catalog with all light + dark tokens (§5.1 of spec) | `[x]` |
| Grain texture PNG generated (240×240, 6% opacity) and bundled | `[x]` |
| Typography extension (`Font.displayHero`, `Font.body`, `.eyebrow()` modifier) | `[x]` |
| Component library: PrimaryButton, SecondaryButton, EyebrowLabel, Hairline, ListRow, InputField, SectionHeader, HighAlertPill | `[x]` |
| Storybook-style preview catalog (single SwiftUI file) for visual review | `[ ]` |

### 2.4 iOS app skeleton `[~]`

| Task | Status |
|---|---|
| Xcode project created, structure per §8.1 | `[x]` |
| 4-tab TabView with empty placeholder screens | `[x]` |
| AppEnvironment / dependency injection container | `[x]` |
| Supabase Swift client wired (auth + select) | `[x]` |
| Sign in with Apple + email auth flows | `[x]` |
| Onboarding flow: 6 screens (Welcome → Career → Unit → Safety → Notifications → Paywall) | `[x]` |
| SwiftData local cache for library entries | `[x]` |
| EntryRenderer with all 9 section renderers | `[x]` |
| Navigation: deep links between drugs ↔ drips ↔ calculators | `[x]` |
| Search (local FTS over SwiftData) | `[x]` |

### 2.5 Backend (Supabase) `[~]`

| Task | Status |
|---|---|
| Two projects: dev + prod | `[ ]` |
| Schema deployed per §6.1 (users, library_entries, citation_sources, library_chunks, ai_*, calculator_usage, audit_log) | `[x]` |
| pgvector extension enabled, IVFFlat index on library_chunks.embedding | `[x]` |
| Row-level security policies on every user-scoped table | `[x]` |
| Backup + point-in-time recovery confirmed | `[ ]` |
| Audit log triggers on sensitive tables | `[ ]` |
| Daily 5% sample export job for QA review queue | `[ ]` |

### 2.6 AI pipeline `[~]`

The riskiest section. Build only after schema exists and content has 30+ entries embedded.

| Task | Status |
|---|---|
| `phi-scrubber` Edge Function with 100% test coverage on patterns + 200-question safe-corpus | `[x]` |
| `intent-classifier` Edge Function (Haiku, 6 categories) | `[x]` |
| `embed-content` job (OpenAI text-embedding-3-small, 1536-dim) | `[ ]` |
| `ai-chat` Edge Function: scrub → classify → retrieve → assemble → stream → validate → log | `[x]` |
| Response validator: citation regex + hallucinated-cite check + length cap | `[x]` |
| 6 refusal templates wired (diagnostic, prescribing, PHI, low-confidence, non-clinical, patient-facing) | `[x]` |
| Rate limiter: 5/day free, unlimited Pro (per `ai_usage` table) | `[x]` |
| Anthropic streaming Swift client (no official SDK as of build start) | `[x]` |
| ConversationView with editorial rendering, citation tap-to-source, action row (👍 👎 ⎘ ⚑) | `[x]` |
| Flag → clinical advisor queue routing | `[x]` |
| Cost dashboard (per-user, per-day) | `[ ]` |

### 2.7 Subscriptions, calculators, polish `[~]`

| Task | Status |
|---|---|
| RevenueCat configured, 4 products defined (monthly, annual, student, lifetime) | `[x]` |
| StoreKit 2 introductory offer (7-day trial on annuals) | `[x]` |
| Paywall views: post-onboarding, mid-app upsell, restore-purchases | `[x]` |
| Student verification flow (SheerID or similar; defer to v1.1 if budget tight) | `[ ]` |
| Lifetime tier ($179, 1000-unit cap, removed at month 4) — counter logic | `[ ]` |
| 25 calculators (§4.13 inventory) — pure Swift, 100% test coverage on math | `[~]` | 151 shipped; math extracted + tested for ~52 (ClinicalFormula/ClinicalScore). Remainder is the open beta gate.
| Push notifications: weekly tip, no shift-time alerts | `[x]` |
| Offline mode (Pro): full library JSON sync via SwiftData | `[~]` | Library is compiled into the binary — offline by default, no sync needed. Ask still requires network.
| Empty / error / loading states for every screen | `[x]` |
| Dark mode QA pass | `[x]` |
| Haptics: confirmation on actions, none on streaming | `[x]` |

### 2.8 Marketing & launch `[~]`

| Task | Status |
|---|---|
| @nursemind TikTok account live, first 5 videos posted in Week 0 | `[ ]` |
| nursemind.app landing page (Next.js + Tailwind on Vercel) | `[ ]` |
| Email capture + waitlist (Supabase) | `[ ]` |
| 20 nursing influencer outreach (TikTok + IG creators with 50K-500K nurse audience) | `[ ]` |
| App Store listing assets (icon, 10 screenshots, copy) | `[ ]` |
| Apple Search Ads campaign drafted | `[ ]` |
| Press list: nursing publications, podcast hosts, healthcare-tech newsletters | `[ ]` |
| Reddit r/nursing soft mentions strategy (no spam) | `[ ]` |

---

## 3. Content sourcing — see `docs/CONTENT_SOURCING.md`

The full sourcing playbook (corrected source hierarchy, per-category recipes, AI authoring workflow, NCLEX 2026 alignment, NGN/CJMM scenario structure, tiered review system, Apple 1.4.2 calculator issue, FDA CDS safe-harbor) lives in `docs/CONTENT_SOURCING.md`. This section just summarizes the operational pieces that affect this plan.

### 3.1 Source hierarchy at a glance

**Tier 1 — commercial-use-OK foundation** (cite, can reproduce or paraphrase freely with attribution):
- **openFDA Drug Label API** (CC0) — drug labels, the bedrock of every drug entry
- **DailyMed** (US gov regulatory work) — same SPL data, canonical
- **RxNorm** (public domain) — drug ID + naming + crosswalks
- **Open RN textbooks** (CC BY 4.0) — Fundamentals, Pharm, Med-Surg, Mental Health, Maternal-Newborn + adult lab reference range tables
- **OpenStax Nursing** (CC BY 4.0, Rice University 2024) — six books incl. Clinical Skills + Adult Lab Values appendix
- **VA PBM Drug Monographs** (public domain) — clinician-facing monitoring content; the gem for nursing-implications-style content
- **LiverTox** (public domain, NCBI NBK547852) — hepatotoxicity content
- **CDC clinical guidelines** (mostly public domain)
- **CMS, NIH treatment guidelines** (public domain)
- **MedlinePlus Lab Tests A–Z** (NLM-authored content only)
- **PMC OA Subset** (CC BY / CC0 only — verify per article)

**Tier 2 — paraphrase + cite, never verbatim:**
- AHA, SCCM Surviving Sepsis (CC BY OA version when available), ADA, AACN procedures, AHRQ, ANA/ANCC, ENA/AWHONN/ONS/INS/ASPEN, ISMP (concept only, not list verbatim), Joint Commission, GOLD/GINA

**Tier 3 — original synthesis with AI grounding + Tier A review for high-risk:**
- "Nursing implications," "Watch for," "Monitoring" sections — original, RAG-grounded, CoVe-verified

**OUT — do not use as content source** (correcting earlier draft):
- StatPearls (CC BY-NC-ND — link only)
- AHFS PMI (ASHP-copyrighted)
- MedlinePlus drug pages + Encyclopedia (AHFS / A.D.A.M. licensed)
- Testing.com (non-commercial only)
- DrugBank full DB (non-commercial)
- Davis's, Mosby's, Lexicomp, UpToDate, Nursing Central (proprietary)
- ATI / Saunders / Lippincott / Kaplan / UWorld (review books — facts come from Tier 1–2 anyway)
- NCLEX items (strictly prohibited)

### 3.2 Coverage targets — v1 launch (~205 entries, NCLEX 2026 weighted)

| Test Plan tag | Point % | Target items | Where in libraries |
|---|---|---|---|
| Management of Care | 18% | ~37 | Communication, Reference, Scenarios |
| Safety & Infection Prev/Control | 13% | ~27 | Procedures, Reference, Diagnoses |
| Health Promotion | 9% | ~18 | Reference, Scenarios |
| Psychosocial Integrity | 9% | ~18 | Communication, Diagnoses, Scenarios |
| Basic Care & Comfort | 9% | ~18 | Procedures, Reference |
| **Pharmacological & Parenteral** | **16%** | **~33** | **Drugs + Drips + a few Procedures** |
| Reduction of Risk Potential | 12% | ~25 | Labs, Procedures, Scenarios |
| Physiological Adaptation | 14% | ~29 | Diagnoses, Drips, Procedures, Scenarios |

Functional library distribution (the user-facing IA) stays at the spec's 50 drugs / 15 drips / 30 labs / 20 procedures / 25 diagnoses / 30 scenarios / 20 communication / 15 reference. Each entry gets multi-tagged with Test Plan category + integrated processes; we don't duplicate entries across folders.

### 3.3 Content production cadence

- **Week 0–1:** confirm Open RN + OpenStax licenses, ingest corpus, write authoring scripts, recruit first reviewer
- **Week 1–2:** Editorial Standards page drafted, reviewer guide written, first 10 proof entries (mix of Tier A/B/C)
- **Week 3–6:** Med-Surg + ICU drugs (50) + drips (15) + labs (30) — "hot 95"
- **Week 5–8:** procedures (20) + diagnoses (25) in parallel
- **Week 7–9:** scenarios (30, NGN/CJMM-structured) + communication (20) + reference (15)
- **Week 9–10:** Tier B sample review pass; Tier A attestations confirmed for all high-risk entries
- **Week 10:** content freeze for v1; v1.1 backlog opens

**Quality gates** (no exceptions):
- Every clinical claim cites a Tier 1–2 source by ID
- Every dose/range/threshold has a citation within 100 chars
- Tier A entries have a signed reviewer attestation in `reviewer_attestations` before `is_published = TRUE`
- Tier B entries get a 10% sampled review monthly; failures escalate to Tier A
- `last_reviewed_at` set on every entry

### 3.4 Authoring workflow

```
docs/CONTENT_SOURCING.md §6 — full pipeline

corpus ingest (one-time + ongoing)
  ↓
RAG-drafted authoring (Claude + retrieved chunks + citation-required prompt)
  ↓
Chain-of-Verification second pass
  ↓
JSON entry in content/<category>/<slug>.json (versioned in git)
  ↓
Tier classification (A/B/C)
  ↓
[Tier A only: paid reviewer attestation]
  ↓
scripts/import-content.ts → library_entries + library_chunks (with embeddings)
```

Authoring is founder + AI; review is paid 1099 RNs/PharmDs for Tier A; structured editor TBD (could be VS Code with JSON + preview, no need for Notion/Sanity in v1).

---

## 4. Decisions log

Date-stamped record of every load-bearing decision. New decisions append to the bottom.

| Date | Decision | Why | Source |
|---|---|---|---|
| 2026-05-03 | Spec v2.0 frozen as the source of truth | Locks scope; later questions resolve to it | User direction |
| 2026-05-03 | iOS-only for v1; Android, web, EHR are v2+ | 90-day window; iOS is where the premium-app audience is | Spec §1.4 |
| 2026-05-03 | Anthropic Sonnet 4.7 + Haiku for AI; OpenAI text-embedding-3-small for vectors | Sonnet for quality, Haiku for cheap classification, OAI-3-small is proven and cheap | Spec §7.8 |
| 2026-05-03 | Supabase for everything (Postgres + auth + edge functions + pgvector) | One vendor, fast to ship, pgvector is sufficient at v1 scale | Spec §7.4 |
| 2026-05-03 | RevenueCat + StoreKit 2; pricing locked at $9.99/$69/$39/$179 | Industry standard wrapper; pricing tested against category benchmarks | Spec §1.4 |
| 2026-05-03 | No HIPAA-eligible vendors required | PHI prevented architecturally, not contractually | Spec §2.1 |
| 2026-05-03 | Davis's / Lexicomp / UpToDate off-limits for licensing in v1 | Cost-prohibitive for solo founder; advisor synthesis from Tier 1–3 sources is sufficient | Spec §6.3 |
| 2026-05-03 | Content authoring in structured editor → JSON in git → import script → Supabase | Versioned source of truth, schema validation | This file §3.4 |
| 2026-05-03 | NCLEX-RN test plan used to weight category coverage targets | NCLEX is the universal nursing knowledge map; aligns with student + new-grad audience | This file §3.2 |
| 2026-05-03 | Building without a full-time clinical advisor | Solo-founder timeline + cost; credibility delivered via license-correct sourcing + AI-grounded authoring + tiered ad-hoc review | User direction |
| 2026-05-03 | Tier system replaces single-advisor review: Tier A (paid RN review pre-publication) for high-alert/peds/emergency, Tier B (10% sampled), Tier C (reporting loop) | Defensible middle ground; matches NurseLabs/Geeky Medics credibility model | CONTENT_SOURCING.md §7 |
| 2026-05-03 | StatPearls REMOVED from sources (CC BY-NC-ND blocks commercial use); Open RN + OpenStax (CC BY 4.0) become the new content foundation | Research found license terms incompatible with commercial app; Open RN + OpenStax are the actual answer for nursing-tailored OER | CONTENT_SOURCING.md §2 |
| 2026-05-03 | AHFS PMI, MedlinePlus drug pages, MedlinePlus Encyclopedia, Testing.com, DrugBank full DB REMOVED from sources | License terms researched; all proprietary or non-commercial | CONTENT_SOURCING.md §2.4 |
| 2026-05-03 | NCLEX 2026 RN Test Plan adopted as content distribution blueprint (effective April 2026) | Active blueprint, not the 2023 version; weights drive entry counts | CONTENT_SOURCING.md §4 |
| 2026-05-03 | Scenarios structured on NCSBN Clinical Judgment Measurement Model (Recognize → Analyze → Prioritize → Generate → Take action → Evaluate) | NGN-aligned cognitive structure; differentiator vs static playbooks | CONTENT_SOURCING.md §5 |
| 2026-05-03 | AI authoring uses RAG + citation-required prompt + Chain-of-Verification second pass | Reduces hallucination to ~6% per Self-RAG/VeriCite research; jurisdictionally protective for FDA CDS safe-harbor | CONTENT_SOURCING.md §6 |
| 2026-07-02 | Category glyph + tint vocabulary promoted app-wide (DesignSystem/CategoryGlyphs.swift) | The Ask surface's per-category SF Symbol + source-tone map now renders on all Library/Tools rows — one shared vocabulary, no drift; tints are informational, accent stays singular | This session |
| 2026-07-02 | ICU depth round: ECMO, IABP, Impella, electrolyte-repletion references + CPP and ARDSNet-PBW calculators | Closes the last dedicated-entry gaps in the ICU audit; all non-directive, concept-cited (ELSO/BTF/SCAI/ARMA + openFDA/Open RN); drip-rate/Parkland stay cut per Apple 1.4.2 | This session |
| 2026-07-02 | Hairline result-scale bar on continuous calculators (Tools/Components/ResultScaleBar.swift) | Makes MAP/CPP/QTc/P-F/eGFR/anion-gap/Ca instantly interpretable — thin band track + single marker + mono thresholds, bands reuse the calc's own interpretation levels so bar and prose never disagree; no gradients | This session |
| 2026-07-03 | Lab reference-range scale built then reverted same day per user call | A parsed zone-map scale (LabRangeScale.swift) shipped and worked across all quantitative labs automatically, but user chose to hold the lab-entry redesign for now; component removed, LabEntryView restored. Drug quick-reference Grid alignment kept | This session |
| 2026-07-03 | Scenarios v4 expansion (ScenariosBatch4.swift, 10 entries → 29 total): prioritization, delegation, anaphylaxis, transfusion reaction, opioid oversedation, NPO hypoglycemia, covert hemorrhage, PE-as-anxiety, suicide risk on med-surg, chest tube emergency | Scenarios were the thinnest category (19) vs their NGN/CJMM differentiator role; batch targets the Management of Care NCLEX gap (15–21% of exam) + uncovered deterioration archetypes. AHRQ public-domain + Open RN CC BY 4.0 sourcing; Tier-A review flagged for anaphylaxis/transfusion/chest-tube before launch marketing leans on them | This session |
| 2026-07-03 | Drugs round 35 (DrugsRound35/35B.swift, 12 by-name workhorses): ibuprofen, meloxicam, dexamethasone, metoclopramide, prochlorperazine, isosorbide mononitrate, diazepam, alprazolam, clonazepam, epinephrine (anaphylaxis/arrest), insulin NPH, ticagrelor | Full drug-id extraction (493 entries) diffed against top-prescribed + hospital staples found looked-up-daily drugs missing (ibuprofen!, dexamethasone, standalone epinephrine — only drips existed). Remaining tier-2 candidates logged for a future round: propranolol, amitriptyline, verapamil, celecoxib, tizanidine, meclizine, benzonatate, fosphenytoin, atenolol. openFDA + Open RN + ISMP sourcing; benzos/epi/NPH/ticagrelor flagged high-alert consistent with corpus | This session |
| 2026-07-03 | Toxicology diagnosis depth (ToxicologyDiagnoses.swift, 8 entries): acetaminophen overdose, salicylate overdose, digoxin toxicity, iron overdose, CCB/beta-blocker overdose, toxic alcohols (ethylene glycol/methanol), anticholinergic poisoning, toxidrome recognition key | Existing tox coverage deep (TCA/CO/organophosphate/serotonin/NMS/MH/lithium) but the most common+testable poisonings were gaps. Audit alternation-grep initially missed two collisions (alcohol-withdrawal + sympathomimetic-toxicity already existed in DiagnosesBatch3/Round10) — caught at build, removed rather than duplicated. Antidotes named conceptually, doses deferred to protocol/poison-control (Apple 1.4.2). Open RN CC BY 4.0 + CDC public domain + AACT/ACMT concept citations; Tier-A flagged | This session |
| 2026-07-03 | Peds/OB diagnosis depth (NeonatalDiagnoses.swift + MaternityDiagnoses2.swift, 10 entries): neonatal RDS, TTN, BPD, NAS/NOWS, HIE+therapeutic hypothermia, IVH, ROP, PDA + pregnancy VTE (DVT/PE), amniotic fluid disorders | Audit found term-newborn conditions and most OB diagnoses covered; the coherent hole was the neonatal prematurity-complications cluster (surfactant existed as a drug but neonatal RDS had no disease entry). Apple 1.4.2-clean (recognition/nursing care/family teaching, no dose math). Open RN + OpenStax Maternal-Newborn CC BY 4.0 + CDC public domain + AAP/ACOG concept citations; Tier-A review flagged for neonatal high-acuity | This session |
| 2026-07-03 | Communication batch 3 (CommunicationBatch3.swift, 6 entries → 27 total): SPIKES, death notification/bereavement, chain-of-command escalation, error disclosure (CANDOR), incivility/bullying, family communication during deterioration/codes | Audit found the planned "interpretation skills" and "Management of Care reference" rounds already covered (12-lead/rhythm/ABG/FHR entries and delegation/consent/directives/triage entries exist); the real gap was the hard conversations, which existed only as scenario bullets. Open RN CC BY 4.0 + AHRQ TeamSTEPPS/CANDOR/PSNet public domain + SPIKES concept citation | This session |
| 2026-07-03 | Drips batch 3+4 (DripsBatch3/4.swift, 12 entries → 32 total): milrinone, dexmedetomidine, midazolam, argatroban, bivalirudin, lidocaine, isoproterenol, magnesium sulfate, furosemide, clevidipine, 3% hypertonic saline, TXA | Audit-first (existing 20 drips checked before authoring — esmolol/nicardipine/octreotide already covered). Fills inodilation, modern sedation, HIT anticoagulation, chronotropy, OB, decongestion, osmotherapy, hemostasis. openFDA CC0 + Open RN CC BY 4.0 + ISMP concept citations; reference-dose convention matches existing drip corpus; ISMP high-alert flags set per 2024 acute list; Tier-A review flagged | This session |
| 2026-07-03 | Scenarios v5 expansion (ScenariosBatch5.swift, 10 entries → 39 total): infant respiratory distress, neutropenic fever, dialysis-day errors, seizure response, anticoagulated head injury, restraint safety, neonatal fever, tracheostomy emergency, compartment syndrome, magnesium toxicity | Specialty balance for the scenario library — peds ×2, OB, onc, renal, neuro ×2, ortho, airway, behavioral safety. Each is a literature-documented recurring failure mode teaching one durable pattern (e.g. "quieter infant = fatigue," "pulses persist until late," "DTRs go first"). Sources: AHRQ + CDC (epilepsy/RSV/cancer) + NINDS TBI public domain, Open RN Fundamentals/Skills CC BY 4.0. Tier-A review flagged: trach, magnesium, neonatal fever, seizure | This session |
| 2026-07-02 | ISMP high-alert filter on drug/drip lists (FilteredEntryList) | Appears only when a list has high-alert entries; uses the exact isHighAlert flag + terracotta chip vocabulary. Drug-class grouping rejected — 441 distinct free-text class strings would render mostly 1-row sections | This session |
| 2026-07-03 | Profile home restructured to labeled sections (ProfileHomeView) | Enterprise IA — monogram avatar identity block, grouped PREFERENCES / RESOURCES / ACCOUNT with eyebrow headers, and appearance moved from a hidden header moon toggle into an inline System/Light/Dark segmented control (exposes System, which the toggle couldn't). Keeps hairlines-not-cards, single accent, serif | This session |
| 2026-07-03 | Product identity clarified: clinical reference for nurses (OpenEvidence-for-nurses), NOT a study app | Founder correction. Feature direction is reference/lookup depth, not exam prep. FDA-CDS (reference-not-directive) + FTC marketing-copy cautions persist as a separate axis (see feedback_marketing_positioning memory) | Founder direction |
| 2026-07-03 | Medication-safety reference added (MedicationSafetyReference.swift, 4 entries) | Nurse-specific safety lookups physician tools skip: High-alert medications (ISMP), Look-alike/sound-alike + tall man lettering, Do-not-crush, Error-prone abbreviations. Curator-model (facts cited to ISMP/FDA/TJC, lists not reproduced verbatim), non-directive, in reference category under "MEDICATION SAFETY" eyebrow. Reference 250→258 | This session |
| 2026-07-03 | Source-fidelity QA pass + reusable verifier (scripts/verify-citations.py) | Per-entry citation-integrity check: every body citationID must resolve to a source in that entry's own citations: array (renderer drops unbacked ids → uncited claims). Whole corpus (1,721 entries) now passes clean. Fixed 4 real dangling citations: ToxicAlcohol + IVPush (this session, missing CDC source in array) and Vasopressin + Phenylephrine drips (pre-existing — body cited openrn_pharm but array only had openrn_drips). Script handles closure-scoped var shadowing in batch files; run it after every content round | This session |
| 2026-07-03 | Duplicate-entry-ID audit + registry guardrail (ContentRegistry debug assertion) | Found 4 colliding entry ids (croup, postpartum-hemorrhage, preeclampsia = diagnosis-vs-reference pairs; lumbar-puncture-assist = two Procedure entries) + 6 double-registered appends (RLS, Biktarvy pre-existing; my 4 med-safety entries doubled by a concurrent edit). Registry keyed byID last-title-wins with no dedup → wrong-entry resolution + phantom duplicate rows. Fixed: renamed the 3 reference-entry ids (diagnosis keeps canonical, matches CrossReferenceRegistry), unregistered the redundant Round-3 lumbar dupe, removed 6 duplicate appends. Added `assert(byID[id] == nil)` so a collision can't silently ship again — it caught the runtime dupes on launch. Verified: 0 dups, builds, launches without tripping the assertion | This session |
| 2026-07-02 | ResultScale hairline range bar on calculator results (9 wired: MAP, CI, Shock Index, QTc, CPP, P/F, eGFR, AG, corrected Ca) | Bands mirror each calculator's prose interpretation thresholds exactly so bar and sentence never dis
| 2026-07-02 | Ask latency + streaming overhaul: Haiku intent classifier races generation instead of gating it (local keyword gate stays synchronous; a late refusal cancels/replaces the stream — safety floor unchanged); edge function verifies JWT locally when `SUPABASE_JWT_SECRET` is set (auth.getUser fallback) and consumes quota in one RPC (`consume_ask_quota_v2`); connection pre-warmed on Ask appear | ~1.5–2s off time-to-first-token; the serial classifier round trip was pure dead air on 100% of questions | This session |
| 2026-07-02 | Streaming render rebuilt: deltas buffer into a 30ms adaptive reveal loop (citation-marker holdback), stable-prefix parse cache + pill image cache kill the O(n²) per-delta reparse; auto-scroll breaks on user drag with a quiet ↓ re-pin affordance | Claude-grade smoothness is client-side work, not model work; per-delta full reparse stuttered on long answers and auto-scroll fought the reader | This session |
| 2026-07-02 | Failed questions refund quota (client + server `refund_ask_quota`) and the service-unavailable card gains Try again; thinking phases now name the real retrieved sources; ordered lists render properly (mono numerals) | A network blip burning one of a free user's 3 lifetime questions was indefensible; honest retrieval progress is an OpenEvidence-class trust signal | This session |
| 2026-07-03 | Brand accent moved from muted spring green (#4ABE7B / #7AD2A0) to vivid green #0BDA51 in BOTH modes; App Store icon + site favicon regenerated as #0BDA51 sparkle on cream (#F4F2EC); hover states #09BE46 light / #33E272 dark; CLAUDE.md accent language updated | Brighter, more distinctive shelf presence; icon, favicon, and in-app accent now read as one identity; link/citation family (deep emerald #1F6B3D) intentionally unchanged | User direction |
| 2026-07-03 | `NM_FAKE_PRO=1` DEBUG launch flag runs a session as Pro yearly without StoreKit; RevenueCat bridge + profile sync stand down while active | Pro-tier UX testing on simulator without purchases; compiled out of release builds | This session |
| 2026-07-31 | Typo-tolerant retrieval: bounded Damerau-Levenshtein correction over a title vocabulary, applied only to tokens that matched nothing anywhere, at 0.6 damping | `ContentRegistry.search` feeds both the Search sheet and `RAGRetriever`'s top-5, so a miss was simultaneously an empty screen and an ungrounded answer. Measured 0.00 → 1.00 recall@5 on 25 real misspellings; control and phrase groups unchanged by construction | This session |
| 2026-07-31 | Search corpus cached as a UTF-8 byte index, built once and prewarmed off-main at launch | `searchText` rebuilt a full string for all 1,721 entries per keystroke, and `specialties` walked the corpus a second time through ~150 Unicode scans per entry — a live cost on every AI question, since the app sets a specialty from the onboarding unit. 145.6ms → 43.0ms per query | This session |
| 2026-07-31 | `isHighAlert` split into two tiers: `isHighAlert` (ISMP Acute Care list, 131 drugs, must cite ISMP) and `isHighRisk` (institutional bedside danger, 23 drugs, outline-only pill); 8 drugs cleared entirely | "HIGH-ALERT MEDICATION" names a specific list, not a general caution. 31 drugs — tadalafil, tenofovir, isotretinoin, estradiol among them — were showing the badge without being on it, and `RAGRetriever` was asserting "ISMP high-alert" to the model for all 31. Founder chose the two-tier option | Founder direction |
| 2026-07-31 | Calculator math extracted from SwiftUI views into `ClinicalFormula` + `ClinicalScore` — 52 pure functions, all wired, golden-value tested | The beta gate requires math coverage and it was zero, because every formula lived as a `private var result` inside a view where no test could reach it. Audited ~30 published tables against source first: no clinical bugs found, so this is regression protection, not a fix | This session |
| 2026-07-31 | Library entries + calculators indexed into CoreSpotlight, with `ClinicalSynonyms` supplying brand-name keywords | A bedside tool should be reachable in one swipe, not five taps. Saved answers deliberately excluded — user-generated clinical questions are not ours to put in a system index | This session |
| 2026-08-09 | App Review rejection of 1.2.0 (17) fixed and resubmitted as 1.2.0 (19): onboarding `ReviewsView` no longer calls `requestReview` (5.6.3 forbids rating prompts in onboarding); the Ask-tab prompt now gates on the 3rd successful answer (`completedAnswerCount` in prefs), not the 1st. For 1.4.2, the registry was audited — zero dose calculators exist (scores/indexes/conversions only) — so the trigger was marketing copy claiming dosage tools: testimonial "drip rate and dosage tools", AuthView "Drips, doses, scores, conversions", Showcase "Reference doses · titration" all rewritten to name only what ships. Reply to App Review states the no-dose-calculator facts explicitly | App Review 2026-08-09, submission 4b1e6b07 |
| 2026-08-09 | Onboarding testimonials de-risked and humanized: fabricated "2w ago"-style timestamps removed (curated quotes must not impersonate dated App Store reviews), quotes rewritten in first-person reviewer voice with concrete moments (passed exam, named calculators at clinical, five-years-in nurse vs google), Priya's "still in school" line reconciled with her RN · Med-Surg byline. Known residual risk, founder-accepted: header still claims "4.9 average rating" | This session |
| 2026-08-09 | Paywall restored to its original recipe on non-Max phones: the canvas-tier pass (e66cccf…3d7a515) had silently re-proportioned standard-tier phones (844–899pt — includes 16/17 Pro) with a 36pt logo, looser header, tighter rows, 58pt CTA. `.standard`/`.compact` now share the original metrics (32pt logo, 40pt badges, md row gaps, 56pt CTA); only `.large` (932pt+) keeps the fuller treatment; bounded spacers (the three-islands fix) stay. Verified on 17, 17 Pro, 17 Pro Max sims. Debugging trap to remember: an older app build lingering on the iPhone 17 sim masqueraded as a layout regression — check the installed build before diagnosing layout | This session |
| 2026-08-11 | 1.4.2 rejection of build 19 (same submission 4b1e6b07) answered with a real audit instead of a copy fix: the "zero dose calculators" claim was wrong. Cut Free Water Deficit (output: liters of D5W/hypotonic saline to replace) and Na Correction Rate/Adrogue-Madias (rates named IV infusates per liter) — both are fluid-administration calculators. PBW tool no longer multiplies 4/6/8 mL/kg by patient PBW (published constants only; retitled from "Tidal Volume · PBW"). Scrubbed every dosing-framed string: CrCl/AdjBW "drug dosing" subtitles, Library "Doses ·" browse rows, paywall teaser "Complete dosing", showcase "higher doses", kg↔lb converter dosing note, IBW/BSA dosing notes. AI hardened: system prompt rule 4 forbids arithmetic on patient parameters to produce a dose/rate/volume (published cited values only); intent classifier + local keyword gate route "how much for a 20 kg child"-style questions to prescribing refusal; dose-asking suggested chips rewritten (magnesium loading dose, acetaminophen by weight, peds fluid bolus, titrate ×2). Marketing Pricing.tsx "patient-specific dosing tools" / "All non-dosing calculators" corrected (deploy pending — permission blocked). Peds 4-2-1 reference retitled "Pediatric weight-based reference values", worked example row removed. Registry now 149, matching the listing copy; listing gains an explicit "does not include medication dosage calculators" sentence. Build bumped to 1.2.0 (20); reply drafted in docs/APP_REVIEW_REPLY_BUILD20.md. Adversarial second pass caught residuals the first pass missed: tools-list subtitles advertising nonexistent tools ("TBSA · fluid resuscitation", "Units · drips", "ANC · INR · transfusion" → rewritten to actual contents), system-prompt line 104 contradicting the no-dose-computation rule ("absolute mg for adult" unit-conversion instruction → quote-source-units-only), FollowUpService "How fast can I run IV potassium?" chip + missing no-dose rule in both follow-up prompts, burns "fluid resuscitation target" chip, hypernatremia entry's "Calculate free water deficit and replace" bullet, minute-ventilation directive vent note, marketing count chaos (Hero/Bundle said 48, FAQ "forty-plus", Bundle claimed "all but six" calculators free + phantom "anticoagulation" domain → 149 / "Free to start: 6" / hematology), listing's false "Always free, in their entirety" + "Free is 5/day" → 6-free-to-try + 3/day. KNOWN OPEN: App Store screenshots (marketing/public/screenshots, captured May 7–9) predate every copy fix — library.png shows the old "Doses ·" browse rows; MUST recapture before resubmission (script is interactive; listing also calls for an iPad 13" asset and the reviewer was on iPad). ASC live metadata was the smoking gun: the description named "Parkland" and "drip rate" calculators that never existed — corrected via ASC web, saved, resubmitted with build 20 + thread reply. Marketing redeploy still pending (vercel token expired — needs `vercel login`) | App Review 2026-08-11, submission 4b1e6b07 |
| 2026-08-13 | Third 1.4.2 rejection (build 20, iPad Air, submission 4b1e6b07) answered by assuming the reviewer was right — and they were. Three-agent adversarial audit found: (1) **AI gate holes** — "how much morphine", "dosage calculator", "drip rate for levophed", "how many mL/hr for dopamine 5 mcg/kg/min on a 70 kg patient", and hyphenated ages ("2-year-old") all slipped the local keyword gate; the Haiku classifier merely RACED generation so dose text could render before the refusal blanked it (screenshot-able); classifier failed OPEN on network error; classifier prompt was biased to answer; ResponseValidator was log-only. (2) **Library taught dose math** — PedsReference "Five-step dose calculation" ("dose = weight × dose per kg", "give the max"), PedsDrugReference 4-2-1 worked examples ("10 kg → 40 mL/hr…"), DigiFab vial equations, Ganzoni iron formula ×3 files, protamine "verify dose calculation", alteplase "Calculate dose" procedure step, opioid-conversion CALCULATE→CONVERT→REDUCE workflow, Parkland worked example (70 kg × 40% = 11,200 mL, 700 mL/hr) in ChiefComplaints36C. (3) **Feed pipeline blind spot** — safety.ts caught only directive verbs, so a worked calculation ("for an 80 kg adult this works out to 2,000 mg [1]") would auto-publish; author prompt had no worked-calc rule and ask_followup_prompt (auto-sent into Ask from feed cards) had no dose constraint. FIXED: all listed content rewritten to verification framing (published values stay, cited; equations/worked examples/imperatives removed; "ordered dose comes from prescriber and pharmacy" convention); MockAskService gains `asksForDoseComputation` regex gate (compute-verb×dose-noun, rate-unit asks, amount+patient-params incl. hyphenated ages — tuned to NOT over-refuse "normal heart rate"/"calculate MAP"/mg-dL lab conversions); AnthropicAskService buffers deltas until classifier verdict (VerdictBox with resolved flag — nothing renders unverified) and runs `ResponseValidator.containsComputedDose` per-chunk as a hard output guard (kills stream → prescribing refusal); IntentClassifier prompt covers conversions/MME/"dose calculator" + when-in-doubt-refuse for dose asks, fails CLOSED for dose-adjacent questions on transport error; safety.ts gains `worked_dose_calculation` FORBIDDEN pattern; prompts.ts author FORBIDDEN + critic item 4 + followup-prompt no-dose constraint. NEW `DoseComputationGuardTests.swift`: 20 refuse-scripts, 12 must-answer scripts, output-guard positives/negatives, and a full-corpus scan (complete field walk, no sampling — searchText samples would have missed the DigiFab dosing blocks) asserting no entry teaches dose computation; the scan immediately caught a 9th entry (rights-of-medication) the manual pass missed. Verified live in ASC via Chrome: description + promo text clean (carry the no-dosage-calculators sentence), iPhone listing screenshots are the framed marketing set (not the stale May "Doses ·" captures — that KNOWN OPEN was wrong about which set was live), iPad slots empty (fine), 08-09 rejection has 4 reviewer screenshot attachments (build-17 era, not downloaded), 08-11 and 08-13 rejections have none. REMAINING RISK: live keywords still read `…drug,medication,calculator,…` — App Store search combines keywords order-independently, so "medication calculator"/"drug calculator" phrase matches exist; recommend dropping `medication` (option: also `calculator`) — needs founder call in ASC. Reply drafted in docs/APP_REVIEW_REPLY_BUILD21.md (specific about what was found/fixed — a third "we have no dose calculators" reply would not be credible; offers to take a Review consultation call) | App Review 2026-08-13, submission 4b1e6b07 |
| 2026-08-09 | Screenshot deep-link hooks added (DEBUG-only): `NM_ONBOARDING_STEP=<step>` pins onboarding at a named step, `NM_OPEN_PAYWALL=1` covers with the paywall (pre-existing), both suppress the ATT sheet while active; launch via `SIMCTL_CHILD_` env prefix. A process launched with the onboarding hook stays pinned in onboarding for its lifetime — relaunch normally to exit | This session |
| 2026-08-14 | FOURTH 1.4.2 rejection (build 21, iPhone 17 Pro Max) — verbatim boilerplate, no feature named, against the hardened build. Executed the pre-committed escalation: **App Review Board appeal + consultation-call request** (`docs/APP_REVIEW_APPEAL_142.md` has the appeal text, thread reply, and filing steps — founder files in ASC). Fresh adversarial audit re-confirmed build 21 contains zero dose-computing features (all 149 tools output scores/physiologic values/lab indexes/conversions; complete output-unit set has no mg/mcg/units/mL-hr/gtt). Scrubbed the residual pattern-match surfaces for a ready build 22: AdjBW calculator removed outright (dosing-weight selection is its only use; registry 149→148, counts reconciled in Hero/Bundle/Screenshots/listing/FreeTier), `ardsnet-vt` renamed `pbw` (id+struct+subtitle no longer say tidal volume), SOFA cardio rows de-drugged (banding named, thresholds moved to cited note), Caprini result no longer names LMWH/UFH, Rule-of-Nines note dropped "for resuscitation calculations" (Parkland pointer), CrCl note dropped FDA-labeling/dosing-weight framing, heparin drip "round to nearest 50 units/hr" → prescriber/pharmacy convention + protamine ratio → "per facility protocol", IBW/AdjBW defensive "this app does not calculate dosages" disclaimers removed (screens shouldn't argue with the guideline), Showcase drips row 20→32 + "Titration"→"Concentration". NEW `CalculatorRegistryGuardTests`: registry titles/subtitles must not match dose/drip/infusion/rate-unit patterns, and every 1.4.2-cut id (fwd, na-correction-rate, adjbw, ardsnet-vt, parkland, drip-rate, mme, …) is asserted absent — the previously-untested central claim now fails a build if regressed. **Audit's biggest find: `main` never received ANY 1.4.2 remediation** (28 commits behind; still registers fwd + na-correction-rate, no AI gate/classifier-fail-closed/output-guard, no guard tests) — merge `calculator-and-retrieval-hardening` → `main` before any future build, treat as launch blocker. Founder to verify live ASC keyword field carries no `medication`/`drug` + `calculator` combination before next submission | App Review 2026-08-14, submission 4b1e6b07 |
| 2026-08-13 | All six feed functions deployed to production with `--no-verify-jwt`: the deadlock fixes (302c6a5 — newest-first verify with terminal reject, publish gates in SQL) plus the b7e7956 `_shared/safety.ts` `worked_dose_calculation` pattern and `_shared/prompts.ts` no-worked-calc/followup rules now live in author/verify/classify/ingest/notify/publish. Keychain CLI token (was cram/Bibleplus account) replaced with a NurseMind PAT via `supabase login --token`. Note: `--no-verify-jwt` must be passed on every deploy — there is no config.toml pinning it. Post-deploy pump (verify → publish via Management API SQL): verify terminal-rejected 2, publish promoted 7 to auto_published (369→376); 18 verified items are Tier A holds (urgent drug_safety, manual review queue — founder action), 13 pending await future verify windows (10/day) | This session |

---

## 5. Open questions (need user decision before unblocking)

These are listed in §13 of the spec plus a few I've added during planning. Resolve in priority order — top blocks the most downstream work.

| # | Question | Blocks | Owner |
|---|---|---|---|
| Q1 | Final name "NurseMind" locked? Trademark search clean? | Domains, social, app submission | User + attorney |
| Q2 | ~~Clinical advisor candidate identified?~~ → **Resolved 2026-05-03**: not hiring full-time advisor; using ad-hoc paid reviewer pool. First Tier A reviewer to recruit by Week 3. | — | — |
| Q3 | Bible Plus genuinely in maintenance mode for 90 days? | Founder bandwidth | User |
| Q4 | Cadence (RT) project shelved for the 90-day window? | Founder bandwidth | User |
| Q5 | Initial unit focus = Med-Surg + ICU first 95 entries — confirmed? | Content scoping | User |
| Q6 | Lifetime tier at $179 with 1000-unit cap — comfortable with that math? | Paywall, RC products | User |
| Q7 | TikTok strategy: founder face on @nursemind, or separate brand presence? | Marketing day 1 | User |
| Q8 | Funding posture: bootstrap to profitability, or raise once at PMF? | Hiring, ad spend, runway model | User |
| Q9 | Content authoring tool: VS Code + JSON, Notion DB, or Sanity Studio? Lean recommendation: VS Code + JSON for solo authoring | Authoring workflow | User |
| Q10 | Reviewer pool structure: pay per session vs monthly retainer? Recommendation: per session ($200–500), keep pool of 3+ to avoid single-reviewer dependency | Tier A throughput | User |
| Q11 | Insurance broker contacted for tech E&O + cyber quote with **bodily-injury carve-back** endorsement? Without BI carve-back, the exact risk that matters is uninsured. | Public TestFlight gate | User |
| Q12 | LLC/EIN status — already exist, or new entity for NurseMind? | App Store, Stripe, contracts | User |
| **Q13** | **Apple 1.4.2 calculator decision**: cut all patient-specific drug-dose calculators (drip rate, weight-based, peds dose, opioid conversion, heparin nomogram, Parkland) from v1, OR partner with hospital/university/pharmacy as publisher of record? Recommendation: cut from v1, partner for v1.1. **Decision needed before Week 5.** | Calculator hub scope | User |
| Q14 | Counsel review of FDA CDS safe-harbor analysis (`docs/CONTENT_SOURCING.md` §9) — does NurseMind's design clear all four §520(o)(1)(E) criteria? | Public TestFlight gate | User + attorney |
| Q15 | Editorial Standards page tone — public-facing transparency about source hierarchy, tier review system, named reviewer pool. Approve drafting in Week 1? | nursemind.app launch | User |
| Q16 | Founder credentials/bio for the masthead — what's the public-facing positioning? Engineer building for nurses, with named reviewer pool, vs founder claiming clinical authority? Recommendation: the former. | Editorial Standards page | User |
| **Q17** | OpenStax AI-corpus permission email — discovered OpenStax CC BY 4.0 carries an *additional* restriction on AI/LLM ingestion. Library display is fine; RAG corpus use is ambiguous. Email contact@openstax.org for explicit permission, OR exclude OpenStax from AI corpus and use library-only. | AI co-pilot launch | User |

---

## 6. Risk register (active — from spec §10, status-tracked)

| Risk | Likelihood | Impact | Status | Mitigation in flight |
|---|---|---|---|---|
| Bad AI answer causes harm | Med | Critical | Mitigation building | RAG, citation enforcement, refusal patterns, advisor review, insurance |
| OpenEvidence eats nurse market with free tier | High | High | Watching | Bundle differentiation, no-NPI, premium UX |
| Content production too slow | Med | High | Active | Advisor hire is the unblock; ship Med-Surg+ICU deep first |
| App Store rejection (medical content) | Low | Med | Pre-empt | Disclaimers everywhere, advisor named, no medical-advice claims, EULA at launch |
| AI cost exceeds revenue at scale | Med | High | Modeling | Caching common Q&A, abuse detection, free-tier tier-down option, volume discount at $50K/mo |
| Anthropic API outage | Low | Med | Plan | Graceful degradation, OpenAI fallback as v2 |
| Trademark conflict | Low | High | Action | TESS search before file, ITU app immediately |
| Subscription fraud / chargebacks | Low | Low | Standard | StoreKit 2 fraud prevention, reasonable refund policy |
| Founder splitting attention with Bible Plus | High | High | Q3 to confirm | Maintenance mode commitment |

---

## 7. Weekly cadence (90-day calendar)

Compressed view of spec §12. Each week has a primary deliverable; secondary work runs in parallel where capacity allows.

| Week | Dates (TBD) | Primary deliverable | Parallel content work |
|---|---|---|---|
| 0 | 2026-05-03 → 05-09 | Legal, advisor hire, accounts, TikTok live | Style guide draft |
| 1 | 05-10 → 05-16 | Xcode skeleton + design system primitives + Supabase schema | First 10 proof entries |
| 2 | 05-17 → 05-23 | Onboarding flow + Profile + auth | 30 drug entries cumulative |
| 3 | 05-24 → 05-30 | Library home + category list + EntryRenderer | 50 drug entries cumulative |
| 4 | 05-31 → 06-06 | Drug/drip/lab detail views + search | 15 drips + 30 labs cumulative |
| 5 | 06-07 → 06-13 | Calculator hub + 12 calculators | Procedures begin |
| 6 | 06-14 → 06-20 | Remaining 13 calculators + scenario renderer | Diagnoses begin |
| 7 | 06-21 → 06-27 | PHI scrubber + intent classifier + embedding pipeline | Scenarios begin |
| 8 | 06-28 → 07-04 | RAG retrieval + ai-chat function + streaming Swift client | Comm + reference begin |
| 9 | 07-05 → 07-11 | ConversationView + refusal templates + flag flow | Internal beta starts |
| 10 | 07-12 → 07-18 | RevenueCat + paywalls + offline mode | Content freeze for v1 |
| 11 | 07-19 → 07-25 | Push notifications + dark mode + empty/error/loading states | Advisor full re-review pass |
| 12 | 07-26 → 08-01 | TestFlight closed beta (100 nurses) + App Store submission | Beta feedback triage |
| 13 | 08-02 → 08-08 | Beta iteration + App Store review response | Marketing site finalized |
| Launch | ~2026-08-01 | App Store public · TikTok push · email blast · ASA on | — |

**Beta gates (do not ship without):** — status as of 2026-07-31

| Gate | Status |
|---|---|
| AI flag rate < 1.5% on closed beta | `[ ]` no closed beta run yet |
| AI refusal rate < 8% | `[ ]` unmeasured |
| AI thumbs-up rate > 60% on un-flagged responses | `[ ]` unmeasured |
| Zero confirmed PHI leaks in logs | `[ ]` scrubber shipped; not audited against real logs |
| All calculators with 100% test coverage on math | `[~]` ~52 of 143. All 20 continuous formulas covered; ~30 weighted score tables remain |
| Advisor sign-off on every published entry | `[!]` no reviewer engaged. Blocks the ISMP high-alert corpus and the 23 newly-tagged high-risk drugs |

The last two are the live blockers. The calculator gate is the only one engineering can close alone; the rest need a beta cohort or a reviewer.

---

## 8. Success metrics — North Star

**Daily Active Pro users using AI + Library together** (the bundle works = the moat works).

Tracking dashboards to build during Week 11:
- Daily/weekly active by tier
- AI questions per Pro per day, by unit
- Library entries viewed per session
- AI flag rate, refusal rate, thumbs-up rate (rolling 7d)
- Free → Paid conversion (overall, by trigger)
- Day-30 retention by cohort
- Cost per question (rolling 7d)

KPI ladder (from spec §11.1):

| Metric | M1 | M3 | M6 | M12 |
|---|---|---|---|---|
| Total downloads | 5K | 25K | 80K | 250K |
| Paying subs | 250 | 1,800 | 6,000 | 15,000 |
| MRR | $2K | $15K | $50K | $125K |
| Free → Paid | 5% | 7% | 8% | 8% |
| AI flag rate | <2% | <1.5% | <1% | <0.8% |
| Day-30 retention | 35% | 40% | 45% | 50% |

---

## 9. Conventions for working in this repo

- **Update `PLAN.md` at the end of every working session.** Move tasks between status states. Append to the decisions log when something load-bearing changes. Add to open questions when you hit one — don't sit on it.
- **Never modify `BUILD_SPEC.md` without a version bump in the header and a note here.** v2.0 is locked unless we explicitly cut to v2.1.
- **`CLAUDE.md` changes are rare** — only when conventions or the bar shift.
- **Status updates are terse.** A one-liner in the relevant table cell beats a paragraph elsewhere.
- **One commit per logical change.** "feat: drug entry detail view" beats "WIP".
