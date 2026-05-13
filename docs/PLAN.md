# NurseMind — Operational Plan

**The live execution layer for the v2.0 spec.**

Last updated: 2026-05-03 · Day 0 of 90 · Pre-build setup

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

**Day 0.** Repo initialized. Spec v2.0 locked. Five foundational docs (this, CLAUDE.md, BUILD_SPEC.md, CONTENT_SOURCING.md, v1_SCOPE.md). No code written. No content authored.

**Path C committed (2026-05-03):** v1 is the **curator model**. NurseMind is a beautifully-designed reader + AI assembler over accredited public-domain and CC BY 4.0 nursing content. We don't author clinical claims, we don't synthesize nursing implications, we don't structure custom NCJMM scenarios — we display, restructure, cite, and assemble. Full scope in `docs/v1_SCOPE.md`; sourcing system in `docs/CONTENT_SOURCING.md`.

**Effects on the plan:**
- ✅ **No clinical advisor needed** — credibility comes from primary sources, not a credentialed reviewer
- ✅ **No Tier A/B/C review system** — replaced by source-fidelity QA + reporting loop
- ✅ **Apple 1.4.2 resolved** — at-risk drug-dose calculators cut from v1 (drip rate, weight-based, peds dose, opioid conversion, heparin nomogram, Parkland, 4-2-1)
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
| AI authoring scripts written (`scripts/author-entry.ts` + `scripts/cove-verify.ts`) | `[ ]` | RAG corpus assembly + drafting prompt + CoVe verification |
| First 10 entries authored as proof of pipeline | `[ ]` | Norepi (Tier A), lactate (Tier B), ABG (Tier B), MAP scenario (Tier C), sepsis scenario (Tier A), hypotensive playbook (Tier A) + 4 more |
| Content corpus ingested into Supabase library_chunks (openFDA top 200 + Open RN + OpenStax + VA PBM + CDC) | `[ ]` | Ingest script in `scripts/ingest-corpus.ts`; tags every chunk with source_id, license, retrieved_at |

### 2.3 Design system foundation `[ ]`

Can start independently of advisor. Token files, font bundles, component primitives.

| Task | Status |
|---|---|
| Instrument Serif + Inter font files licensed (SIL OFL — both free) and bundled | `[ ]` |
| Color asset catalog with all light + dark tokens (§5.1 of spec) | `[ ]` |
| Grain texture PNG generated (240×240, 6% opacity) and bundled | `[ ]` |
| Typography extension (`Font.displayHero`, `Font.body`, `.eyebrow()` modifier) | `[ ]` |
| Component library: PrimaryButton, SecondaryButton, EyebrowLabel, Hairline, ListRow, InputField, SectionHeader, HighAlertPill | `[ ]` |
| Storybook-style preview catalog (single SwiftUI file) for visual review | `[ ]` |

### 2.4 iOS app skeleton `[ ]`

| Task | Status |
|---|---|
| Xcode project created, structure per §8.1 | `[ ]` |
| 4-tab TabView with empty placeholder screens | `[ ]` |
| AppEnvironment / dependency injection container | `[ ]` |
| Supabase Swift client wired (auth + select) | `[ ]` |
| Sign in with Apple + email auth flows | `[ ]` |
| Onboarding flow: 6 screens (Welcome → Career → Unit → Safety → Notifications → Paywall) | `[ ]` |
| SwiftData local cache for library entries | `[ ]` |
| EntryRenderer with all 9 section renderers | `[ ]` |
| Navigation: deep links between drugs ↔ drips ↔ calculators | `[ ]` |
| Search (local FTS over SwiftData) | `[ ]` |

### 2.5 Backend (Supabase) `[ ]`

| Task | Status |
|---|---|
| Two projects: dev + prod | `[ ]` |
| Schema deployed per §6.1 (users, library_entries, citation_sources, library_chunks, ai_*, calculator_usage, audit_log) | `[ ]` |
| pgvector extension enabled, IVFFlat index on library_chunks.embedding | `[ ]` |
| Row-level security policies on every user-scoped table | `[ ]` |
| Backup + point-in-time recovery confirmed | `[ ]` |
| Audit log triggers on sensitive tables | `[ ]` |
| Daily 5% sample export job for QA review queue | `[ ]` |

### 2.6 AI pipeline `[ ]`

The riskiest section. Build only after schema exists and content has 30+ entries embedded.

| Task | Status |
|---|---|
| `phi-scrubber` Edge Function with 100% test coverage on patterns + 200-question safe-corpus | `[ ]` |
| `intent-classifier` Edge Function (Haiku, 6 categories) | `[ ]` |
| `embed-content` job (OpenAI text-embedding-3-small, 1536-dim) | `[ ]` |
| `ai-chat` Edge Function: scrub → classify → retrieve → assemble → stream → validate → log | `[ ]` |
| Response validator: citation regex + hallucinated-cite check + length cap | `[ ]` |
| 6 refusal templates wired (diagnostic, prescribing, PHI, low-confidence, non-clinical, patient-facing) | `[ ]` |
| Rate limiter: 5/day free, unlimited Pro (per `ai_usage` table) | `[ ]` |
| Anthropic streaming Swift client (no official SDK as of build start) | `[ ]` |
| ConversationView with editorial rendering, citation tap-to-source, action row (👍 👎 ⎘ ⚑) | `[ ]` |
| Flag → clinical advisor queue routing | `[ ]` |
| Cost dashboard (per-user, per-day) | `[ ]` |

### 2.7 Subscriptions, calculators, polish `[ ]`

| Task | Status |
|---|---|
| RevenueCat configured, 4 products defined (monthly, annual, student, lifetime) | `[ ]` |
| StoreKit 2 introductory offer (7-day trial on annuals) | `[ ]` |
| Paywall views: post-onboarding, mid-app upsell, restore-purchases | `[ ]` |
| Student verification flow (SheerID or similar; defer to v1.1 if budget tight) | `[ ]` |
| Lifetime tier ($179, 1000-unit cap, removed at month 4) — counter logic | `[ ]` |
| 25 calculators (§4.13 inventory) — pure Swift, 100% test coverage on math | `[ ]` |
| Push notifications: weekly tip, no shift-time alerts | `[ ]` |
| Offline mode (Pro): full library JSON sync via SwiftData | `[ ]` |
| Empty / error / loading states for every screen | `[ ]` |
| Dark mode QA pass | `[ ]` |
| Haptics: confirmation on actions, none on streaming | `[ ]` |

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

**Beta gates (do not ship without):**
- AI flag rate < 1.5% on closed beta
- AI refusal rate < 8%
- AI thumbs-up rate > 60% on un-flagged responses
- Zero confirmed PHI leaks in logs
- All 25 calculators with 100% test coverage on math
- Advisor sign-off on every published entry

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
