# NurseMind product review — September 17, 2026

NurseMind already has a coherent visual identity and a substantial reference library. The biggest opportunity is to make useful, verifiable nursing information easier to reach. Reliability and evidence enforcement come first; the next product improvement should be a nursing-first quick-reference experience.

## What was actually evaluated

- Built the current checkout successfully with Xcode; ran version 1.2.0 (23) on an iPhone 17 Pro simulator, iOS 26.3.
- Walked through onboarding, free Ask, Library, shorthand search, a free drug preview, full drug/lab/diagnosis/scenario entries, related-entry navigation, Feed, Profile, and light/dark appearance.
- Used the existing `NM_FAKE_PRO` debug fixture to inspect paid content. No purchase was made.
- Submitted one live educational question: “How do I read an ABG quickly?” It failed with an Anthropic insufficient-credit response. This Debug build is configured to use a development API key directly. **This does not establish an outage in the released app.** Live answer accuracy, citation behavior, follow-up quality, and answer latency remain unverified.
- Changed simulator text size from Large to the largest accessibility size. Scenario body text remained the same size. Restored the simulator setting afterward.
- Compared competitor App Store descriptions and published product screenshots, plus ICU Advantage's official site. Neither competitor's authenticated app was tested. Their performance and clinical accuracy were not independently established.
- This is a product and implementation audit, not a clinical validation of the corpus. Clinical text seen in screenshots is existing app content, not endorsed guidance.

## The competitive lesson

**ICU Advantage:** learn from the distinction between a fast reference and a deeper explanation, its organ-system navigation, contextual definitions, visual references, and explicit offline availability. Its official site also advertises adjustable text size and content updates without a store release. [Official product site](https://rapidreference.app/), [App Store](https://apps.apple.com/us/app/icu-advantage-rapid-reference/id6763389459).

**OpenEvidence:** learn from making evidence inspection part of answering: claim citations, source access, licensed literature, and evidence-strength presentation. Its current listing describes free access for verified U.S. clinicians and says NPI required; do not assume universal RN/student access from the phrase “for nurses.” These are publisher claims, not independently tested capabilities. [App Store](https://apps.apple.com/us/app/openevidence/id6612007783).

**NurseMind's opportunity:** a calm reference companion organized around nursing assessment, monitoring, communication, and learning, with a short path from question → cited answer → underlying source → related reference. Keep the existing editorial typography and hairlines. Competing on the number of entries or model branding would miss the workflow advantage.

## Preserve what works

- The Library showed **1,718 entries**; this is the observed count, superseding older counts in PLAN for this audit.
- `norepi` returned the drug and drip as the first two results. Shorthand search is already useful.
- Source attribution, review dates, high-alert labels, drug section jumps, bookmarks, recent entries, saved answers, and Ask handoffs already exist.
- Drug → sepsis → scenario navigation worked. Build on the existing related-entry graph rather than rebuilding it.
- Light and dark reading surfaces are coherent. Long-form body text is readable at the default size.
- The failed AI request produced an explicit error rather than a fabricated answer.

## Fix first: reliability and earned trust

### 1. Enforce the AI safety contract on the server — P0

**Evidence:** `supabase/functions/ai-chat/index.ts:123` accepts the client-composed request and forwards it to Anthropic; line 255 returns the upstream body directly. The route does not invoke PHI filtering, own the clinical system prompt, or validate the generated answer. In `AnthropicAskService.swift:206`, citation validation runs after streaming and only logs failures. There are client-side input, intent, and computed-dose guards, but they do not establish the server-enforced guarantee in the engineering brief.

**Change:** make the server own input validation, scoped prompts, retrieval boundaries, and output validation. Never deliver unvalidated clinical claims. Start with whole-answer validation and regeneration/refusal; introduce smaller validated chunks only if they preserve the same guarantee. Resolve citations against the actual retrieved source IDs, not the number of context lines. Apply limits to every request path, including non-streaming helpers; the current quota gate trusts the client-provided `stream` flag.

**Acceptance:** a direct API request cannot substitute the system prompt or bypass scope/citation checks; uncited and unknown-source claims do not reach the client; test-only synthetic identifiers exercise redaction; invalid output regenerates or refuses. Citation presence alone is insufficient—source-fidelity review must check whether the cited passage supports the claim. Do not present regex matching as proof that arbitrary free text can never contain PHI.

### 2. Restore a working AI test path and useful failure recovery — P0

**Evidence:** the simulator's educational ABG request returned HTTP 400 with an insufficient-credit error. The UI rendered “I can't reach the AI right now” and a generic connectivity/configuration explanation.

**Change:** restore the development account's service availability; independently smoke-test the production proxy. Add provider-credit/service-health monitoring. Give users a contextual “Open ABG reference” fallback when generation is unavailable, retaining their question and quota. Keep billing diagnostics in internal monitoring.

**Acceptance:** repeatable successful smoke requests through the production-equivalent path; no quota loss on failure; relevant Library access directly from the error state. Measure time to first useful **validated** content before claiming the five-second target.

### 3. Make every claim inspectable and every entry reportable — P0/P1

**Evidence:** the full norepinephrine quick-reference table renders plain key/value strings without inline source markers (`QuickReferenceTable.swift`). Potassium range rows have superscript citations, but they are static text. Source lists and review dates are at the bottom. The Library entry toolbar exposes Save and Ask, but no reporting action; Editorial Standards nevertheless says every entry has “Report an issue.”

**Change:** require source IDs in every clinical content structure, including quick-reference rows; audit interpretation blocks for rendered citation coverage. Add an accessible source action for each claim or tightly scoped block. The source sheet should expose the supporting passage/section, publication or revision date when known, and source type. Keep retrieval date distinct from clinical review date. Add a working entry-report action carrying entry/version/source identifiers, with no patient information required.

**Acceptance:** a reviewer can verify a claim without hunting through a whole monograph; every source reference resolves; unsupported claim coverage fails the content gate; entry reports reach a real triage queue. Use evidence-strength labels only when backed by an explicit method—do not invent an authoritative-looking grade.

## The next product release: faster reference use

### 4. Put nursing priorities in the first viewport — P1, highest product impact

**Evidence:** the sepsis entry opens with Definition and Pathophysiology. Its Priority assessments are much farther down. Norepinephrine opens with classification, onset, half-life, and supplied formulation; nursing monitoring appears below indications, mechanism, dosing, warnings, adverse reactions, and interactions. The drug jump row works, but scrolls away; diagnosis and lab readers lack the same jump affordance.

**Change:** offer **Quick reference / Read in depth**, built from the same source-backed content. Quick reference should foreground the relevant monitoring, warning, and assessment material, clearly framed as reference. Keep medication dosing context attached to its source and formulation; do not derive patient-specific advice. Add a compact persistent contents control shared across entry types, a source shortcut, and a visible related-content entry point.

**Acceptance:** from a drug or diagnosis page, reach monitoring/priority-assessment content in one tap; return to the source or another section without scrolling to the top. Check the proposed five-second lookup target with nurses using representative tasks, not just developer tap speed.

### 5. Make the ICU selection useful on Library home — P1

**Evidence:** selecting ICU changes the subtitle, but the first-use Library is still the same category directory. Search is a separate sheet. The Ask home uses a large greeting and several suggested questions; it has no equally prominent direct reference lookup.

**Change:** retain the existing tabs for this iteration. Put a shared “Search references or ask a question” entry point on Ask and Library. Let reference matches open immediately and let questions move into Ask. On Library, show a small set of curated ICU topic shortcuts and the existing pinned/recent items before the directory. Use existing content relationships to group topics such as ventilation, hemodynamics, and assessment; label collections clearly and avoid new unsourced clinical synthesis.

**Search refinement:** after the two strong `norepi` matches, the result list included chemotherapy extravasation, cirrhosis complications, and duloxetine. Separate direct matches from related mentions and show the matched phrase. Keep broad retrieval available, but make its relevance legible.

**Acceptance:** an ICU nurse can find a familiar topic without composing an AI question; brand names, shorthand, and common misspellings are covered by a clinically reviewed search fixture set. Do not remove existing fast local search.

### 6. Respect reading accessibility and tighten visual discipline — P1

**Evidence:** `RootView.swift:98` applies `.dynamicTypeSize(...DynamicTypeSize.large)` to the whole app. At the largest simulator accessibility setting, scenario body text did not grow. Ask has a green radial glow; active navigation, suggestion arrows, quota dots, and Profile actions also use the primary accent. In deep reading, body text is visible behind the status/header area.

**Change:** allow body text to follow accessibility settings; constrain only display headings where necessary. Test long titles and numeric tables at accessibility sizes. Improve weak tertiary metadata contrast and citation hit targets. Give scrolled content a deliberate header boundary. Remove the decorative Ask glow and restore the current engineering brief's distinction between primary-action green and informational links.

**Acceptance:** body text visibly scales without truncating clinical values or hiding actions; VoiceOver can identify sources, section controls, and bookmarks; reduced-motion and compact-phone checks pass. Preserve the serif/sans/mono typography rather than starting a visual redesign.

### 7. Demonstrate value before setup and payment — P1, product decision required

**Evidence:** the first launch presented ATT before value, followed by welcome, setup/showcase, name/role/unit/experience, notifications, safety notice, testimonials, paywall, and success. A paid drug's free preview exposes an indication before the upgrade prompt. Code allows six library samples and three lifetime AI questions. BUILD_SPEC §1.4 instead promises the full free library and three questions per day.

**Change:** retain the safety notice before Ask; reduce the path to the first useful cited reference. Make name entry and notification consent later steps. Lead with one relevant usable sample, then explain the paid benefit. Review the onboarding image, which visibly contains an exhausted-quota/upgrade message. Verify the provenance of the displayed 4.9 rating and testimonials before treating them as trust evidence.

**Decision:** reconcile the locked spec and current entitlements before changing prices, trial length, or access. Recommendation is to measure activation and repeated use, not to silently change the business model.

**Acceptance:** instrument first useful reference, first successful answer, source opened, paywall exposure, and return use. Audit actual paths for both free and paid users.

### 8. Make Feed freshness explicit — P1

**Evidence:** on September 17, the selected **THIS WEEK** feed led with an **August 21** item. `FeedListView.swift:169` falls back to the entire list when the seven-day window is empty. This establishes a misleading filter state, not the cause of the older content or a confirmed pipeline outage.

**Change:** label fallback content as “Latest available,” show the last successful refresh/source date, and distinguish “nothing new this week” from a failed fetch. Verify ingestion/publishing health separately. Rank relevant safety updates above generic evergreen regulatory articles. Deduplication is already recorded as outstanding in PLAN and should be verified before publishing more items.

**Acceptance:** no older article masquerades as this week's content; stale data remains usable with an honest status; a backend failure is observable internally. Feed work should not delay the core reference improvements.

## Then add depth selectively

Pilot a small set of source-reviewed visual references and comparison layouts using existing high-use topics—ventilator concepts, hemodynamic patterns, and assessment frameworks. Use licensed or original clinically reviewed diagrams; do not treat generated medical artwork as evidence. Pair each concise view with a deeper explanation and sources. Existing scenarios can gain progressive disclosure for study after source fidelity is established; a new question bank is a separate scope decision.

Investigate versioned content delivery and offline freshness after the reader and evidence model are dependable. First expose what is available offline and when it was updated. Actual airplane-mode use, offline source access, paid entitlement expiry, and content updates were not tested in this pass.

## Recommended order

1. **Trust/reliability:** server safety enforcement, available AI test path, claim coverage, working content reports.
2. **One excellent nursing-reference loop:** quick/deep reader, persistent contents, source inspection, shared lookup, ICU shortcuts, accessible body text.
3. **Activation and maintenance:** reconcile free access, shorten onboarding, honest Feed freshness, then a small visual-reference pilot.

Keep calculators gated under the existing App Review decision. Current approval status was not checked and competitor availability is not evidence that NurseMind can re-enable them. Do not add EHR integration, ambient documentation, or broad new content programs to this iteration.

No app behavior or production configuration was changed during this audit. Build and simulator checks establish the observed product behavior; they do not establish clinical safety or production readiness.

## Captured evidence

- [Free norepinephrine preview](audit-assets/2026-09-17/norepinephrine-free.png)
- [Full norepinephrine first viewport](audit-assets/2026-09-17/norepinephrine-pro.png)
- [Nursing section in dark mode](audit-assets/2026-09-17/nursing-dark.png)
- [Sepsis first viewport](audit-assets/2026-09-17/sepsis-dark.png)
- [Scenario at largest accessibility text setting](audit-assets/2026-09-17/scenario-largest-text.png)
- [This Week showing an August article](audit-assets/2026-09-17/feed.png)
