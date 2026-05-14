# NurseMind — Engineering Brief

**Read this before reading the build spec.**

The full spec lives at `docs/BUILD_SPEC.md`. The live operational plan lives at `docs/PLAN.md`. This file is the bar, the stakes, and the priority order — re-established at the start of every session.

---

## What we are building

NurseMind is a premium, iOS-native subscription product for licensed and student nurses in the United States. It bundles a curated, evidence-based clinical reference library, a strictly-scoped AI co-pilot grounded in that library, and a complete suite of nursing calculators into a single, beautifully designed experience. It is the modern successor to legacy reference apps like Davis's Drug Guide and Nursing Central, built for the workflow and aesthetic expectations of nurses in 2026.

The target user opens the app at the bedside, the nursing station, or during a study session and gets a trustworthy, cited answer in under five seconds — whether that answer is a drip rate, a lab interpretation, a clinical scenario walkthrough, or a free-form question to the AI co-pilot. Every clinical claim is cited. Every interaction is fast. Every surface is calm, premium, and deliberately designed.

## The bar

This is not a side project, not an MVP-quality build, and not a hackathon. The reference points for execution quality are Linear, Mercury, Notion, Aven, OpenAI's product surfaces, and the Eden.so design language. Every interaction, every animation, every loading state, and every empty state should feel native, considered, and confident. If a piece of the build feels rushed, the answer is not to ship it faster — the answer is to cut scope until the remaining surface meets the bar.

The aesthetic is editorial-modern, not enterprise-corporate. The typography pairs Instrument Serif (display) with Inter (body) and SF Mono (numerics), set on a cool sage-cream background with a subtle film-grain texture. White space is structural, not decorative. Hairline dividers replace cards. A single deep forest green accent color carries every primary action. There are no emojis, no illustrated icons, no gradients, no decorative chrome. The information does the talking; the design quietly carries it.

## What makes this hard

**Safety is a first-class architectural concern.** This is a clinical reference tool used by licensed healthcare professionals at the bedside. A single bad answer that influences patient care could cause real harm and could end the company. The product is architecturally prevented from collecting Protected Health Information. The AI is tightly scoped via system prompts, intent classification, and response validation — it never diagnoses, never prescribes, and never makes unsourced clinical claims. Every clinical assertion in the library and every AI response is cited to a specific evidence source. Citations are enforced server-side via regex validation; responses that make numerical claims without citations are rejected and regenerated. We do not have a full-time clinical advisor; instead, content credibility comes from a three-layer system: license-correct public sources (openFDA/DailyMed/Open RN/OpenStax/VA PBM/CDC), AI-grounded authoring with Chain-of-Verification + citation enforcement, and tiered ad-hoc paid RN review for high-risk content (ISMP high-alert drugs, peds dosing, emergency protocols). None of this is optional, and none of it is retrofittable — it must be designed in from commit one. Full sourcing playbook lives in `docs/CONTENT_SOURCING.md`.

**Premium feel is the moat.** OpenEvidence is free, well-funded, and explicitly targeting the nursing market. ChatGPT for Clinicians shipped to nurses in April 2026. NurseMagic is publicly traded and growing. NurseMind cannot win on AI capability alone — Anthropic, OpenAI, and Google have larger models. NurseMind wins by being the *bundle* (library + calculators + AI in one place), by being *nurse-native* (no NPI required, accessible to students and CNAs), and by being demonstrably more beautiful than any other product in the category. Visual polish is not a nice-to-have; it is the differentiator. Every typographic choice, every spacing decision, every haptic, every animation duration — they collectively constitute the moat.

**The constraint is shipping, not ideating.** The build window is 90 days from project start to App Store launch. The category is heating up — every additional month of delay narrows the window. Scope discipline is the single most important engineering virtue on this project. The build spec defines exactly what ships in v1; anything outside it is v2. When in doubt, cut.

## Decision priority order

When the spec is ambiguous, decide in this order:

1. **Does it preserve safety?** No PHI. Every clinical claim cited. Refusal patterns honored. If a decision compromises safety, it loses regardless of what else it offers.
2. **Does it match the design system?** Hairlines not cards. Serif display + sans body + mono numerics. Single accent. Generous space. Editorial, not chat-bubble. If a decision drifts from the design language, it loses.
3. **Does it ship in 90 days?** Speed of delivery beats elegance of architecture for v1. If a decision adds two weeks for a feature the spec doesn't require, cut the feature.
4. **Does it scale?** Will this decision still work when there are 50,000 paying users and 200,000 free users? If not, redesign now.

If a decision satisfies all four, ship it. If it conflicts on any one, escalate before building.

## Stack (locked)

iOS-native Swift 5.9+ with SwiftUI. Supabase for Postgres, auth, edge functions, and pgvector. Anthropic Claude (Haiku 4.5 for both generation and classification — ~3.3× cheaper than Sonnet, equivalent quality on the ~80% of NurseMind traffic that's retrieval-grounded clinical Q&A; cite-or-refuse is server-enforced regardless of model so the safety floor is unchanged). OpenAI text-embedding-3-small for vector embeddings. RevenueCat + StoreKit 2 for subscriptions. Sentry for errors, PostHog for product analytics. No HIPAA-eligible vendors required for v1 because the product is architecturally prevented from handling Protected Health Information. Android, web, and EHR integration are explicitly v2+.

## Conventions

- **The spec wins.** When `docs/BUILD_SPEC.md` contradicts old documentation, a Slack message, or a different developer's intuition — the spec wins. When the spec is silent, refer to the four priorities above.
- **No emojis in code, copy, or UI.** Sparkle ✦ and check ✓ are the only allowed glyphs. Everything else is SF Symbols.
- **Hairlines, not cards.** Dividers separate content; cards over-package it.
- **One accent.** Deep forest green appears only on primary CTAs and the AI send button. Nowhere else.
- **Italic is deliberate.** Subtitles, footers, accent words, citation source names. Never random.
- **Numbers in mono, language in serif, body in sans.**
- **Cite or refuse.** No clinical claim without a citation. Server-side enforced.
- **No PHI.** Architectural prevention, not user discipline.
- **License-correct sourcing.** Foundation tier (commercial-use OK with attribution): openFDA, DailyMed, RxNorm, Open RN textbooks, OpenStax Nursing, VA PBM, LiverTox, CDC, NIH treatment guidelines, MedlinePlus NLM-authored content, PMC OA articles (CC BY/CC0 only). **Off-limits**: StatPearls (NC-ND), AHFS PMI, MedlinePlus drug pages + Encyclopedia (A.D.A.M.), Testing.com, DrugBank full DB, Davis's/Mosby's/Lexicomp/UpToDate/Nursing Central, ATI/Saunders/Lippincott/Kaplan/UWorld, NCLEX items. See `docs/CONTENT_SOURCING.md` §2 for the full audit.
- **Tiered review** replaces a full-time advisor. Tier A (paid RN review pre-publication) for high-alert drugs, peds, emergencies. Tier B (10% sampled). Tier C (reporting loop).
- **NCLEX 2026 Test Plan** is the structural blueprint for content distribution; **NCSBN Clinical Judgment Measurement Model** (Recognize → Analyze → Prioritize → Generate → Take action → Evaluate) is the structural pattern for Scenarios.
- **FDA CDS safe-harbor**: never produce directive output ("give X mg"), always cite primary sources, never analyze medical images/signals. This is jurisdictional, not stylistic.
- **Apple 1.4.2**: patient-specific drug-dose calculators require publisher-of-record from a hospital/university/pharmacy/manufacturer/etc. Drip rate, weight-based dose, peds dose, opioid conversion, heparin nomogram, Parkland are at risk. MAP/GFR/MEWS/etc. are fine.

## File map

```
nursemind/
├── CLAUDE.md                    ← this file (auto-loaded)
├── docs/
│   ├── BUILD_SPEC.md            ← source of truth (v2.0, locked)
│   ├── PLAN.md                  ← live operational plan (update every session)
│   └── CONTENT_SOURCING.md      ← license-correct sourcing + AI authoring + tier review playbook
├── NurseMind/                   ← Xcode project (Week 1+)
├── content/                     ← library entries (JSON, advisor-authored)
│   ├── drugs/
│   ├── drips/
│   ├── labs/
│   ├── procedures/
│   ├── diagnoses/
│   ├── scenarios/
│   ├── communication/
│   └── reference/
├── supabase/                    ← migrations, edge functions
│   ├── migrations/
│   └── functions/
│       ├── ai-chat/
│       └── phi-scrubber/
└── marketing/                   ← nursemind.app landing page
```

## Working style

- Default to terse responses. Every word earns its place.
- Updates as you work — one sentence at key moments, not a running commentary.
- End-of-turn summary: one or two sentences. What changed and what's next.
- No comments in code unless the WHY is non-obvious.
- No backwards-compatibility shims, no premature abstractions, no "for v2 we might want to..."
- For UI work: start the dev server / run on simulator before reporting done. Type checks ≠ feature checks.

## The principle

Build it like the company depends on it, because it does. Build it like a nurse will trust it at 3 AM with a patient deteriorating, because they will. Build it like Apple is going to feature it in the App Store, because they should.

The information does the talking. The design quietly carries it. Ship in 90 days.
