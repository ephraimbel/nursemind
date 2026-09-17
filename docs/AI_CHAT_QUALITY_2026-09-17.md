# AI chat quality and safety — September 17, 2026

The new `ai-chat-v2` endpoint and its quota migration are deployed to NurseMind Supabase. Client changes are local for the next app release; no App Store update has been submitted. The legacy endpoint remains unchanged. Claude Haiku 4.5 remains the model. These engineering checks do not establish clinical superiority or parity with OpenEvidence.

## What changed

- Retrieval indexes every eligible cited passage across the bundled library, including later reference sections, procedure preparation/aftercare, documentation, and watch-fors. It ranks passages, preserves their individual source attribution and entry title, corrects common misspellings, and carries the previous question into explicit follow-ups. It caps evidence at 16,000 characters / 24 passages / five entries, without cutting an individual passage in half. Uncited sections and passages involving sources marked as restricted for AI ingestion are excluded.
- A server catalog contains SHA-256 fingerprints of 42,448 eligible passages from the current library snapshot. The new endpoint discards excerpts that do not exactly match that catalog and falls back to independently fetched sources. Missing library excerpts are allowed. Fingerprints establish correspondence to the packaged corpus, not independent verification of medical truth, license metadata, or source freshness.
- The production app sends one request to `ai-chat-v2`. The server owns the model, prompts, token limits, PHI-pattern pass, scope classification, quota reservation, generation, validation, and one repair per evidence stage. Missing or insufficient library evidence can trigger one external retrieval and a new generation stage. Client-authored system instructions/model settings are discarded. No clinical answer is released until it has completed and passed the checks. The app applies its own second validation gate before smooth text reveal.
- Checks reject missing/invented/malformed citations, uncited statements, numerical values and quantities absent from the cited excerpts, detected identifiers, directive medication amounts, calculated patient-specific doses, excessive length, truncated streams, and upstream failures. Numbers and units are compared conservatively; this is not semantic entailment verification.
- The model is asked for direct, concise answers: usually 40–100 words for a lookup, 120–220 for bedside explanations, and up to 450 for requested detail. It must preserve population, qualifications, conflicts, and missing evidence, and must not present selected excerpts as a complete procedure.
- Local follow-up suggestions replace the paid enrichment request. The normal path now uses three model calls (classification + answer + separate evidence review), and one device-to-backend request. Repairs and external lookup add calls. The evidence review was added after a real on-screen test exposed a cited but reversed clinical relationship that citation/number rules could not detect. No percentage reduction in total spend or latency is claimed.
- Short prompts are no longer described as cached. Haiku 4.5 requires a 4,096-token prefix for caching; the new policy is intentionally short. [Anthropic prompt-caching documentation](https://platform.claude.com/docs/en/build-with-claude/prompt-caching).
- History is re-scrubbed, bounded, and stripped of old citation markers. Cancellation propagates to the request. Failure analytics no longer include raw error descriptions. Server metrics contain only outcome, attempts, latency, context length, and token counts—not questions, answers, identifiers, or source text.
- Database migration restricts quota consumption/refunds to the service role and adds a daily request-attempt ceiling so repeated refunded failures cannot buy unlimited model calls. Missing configuration or quota failures stop the request.

## Validation performed

- Release simulator app build passed; installed and launched successfully on the separate validation simulator.
- 25 focused Swift tests across 11 suites passed, including parameterized dose/privacy cases and five tests using the actual production service and a controlled HTTP transport. Subsequent focused rerun after retrieval refinements: seven tests across three suites passed.
- 28 Deno tests passed: request normalization, citation/number/unit checks, classification failures, bounded repair, refusal behavior, quota outages, refunds, catalog tampering, and no partial-answer release.
- `deno check` passed for the new edge function.
- A real Swift-generated request was decoded and verified against the server catalog: seven sources / 7,544 evidence characters.
- Ten bedside retrieval cases covered norepinephrine extravasation, HIT, digoxin toxicity, chest drains, tracheostomy obstruction, vancomycin monitoring, transfusion reactions, DKA, pressure injury, and a misspelled vancomycin query. All found the expected topic and stayed within the context budget. This is retrieval regression coverage, not an answer-accuracy benchmark.
- SQL migration executed in an isolated in-memory PostgreSQL runtime; role permissions, free/pro quotas, refunds, and retry ceilings passed. This did not touch Supabase production.

Reproduce server checks:

```sh
deno check supabase/functions/ai-chat-v2/index.ts
deno test supabase/functions/ai-chat-v2/contract_test.ts supabase/functions/ai-chat-v2/evidence_test.ts
deno run --allow-read --allow-env scripts/test_ai_request_limits.ts
```

## Release sequence

1. Finish the parallel library work and run its content checks. Regenerate the evidence catalog from the exact corpus that will ship:

   ```sh
   bash scripts/export_ai_evidence_manifest.sh SIMULATOR_UDID DERIVED_DATA_PATH
   deno run --allow-read scripts/validate_ai_evidence.ts EXPORTED_REQUEST_JSON
   ```

   The export command prints the request-fixture path. New or edited passages absent from the server catalog use the external-source fallback, which is slower than a valid library match. Plan catalog compatibility for supported app versions; do not silently trust arbitrary client evidence.

2. The exact quota migration was applied in a transaction through the Management API after checking existing function definitions. Read-back verified that the new function exists, service-role execution is allowed, and authenticated-client execution is denied. Existing service-role quota calls remain supported. Do not blindly run `db push`: the remote migration history does not match the repository’s duplicate timestamp scheme.
3. `ai-chat-v2` is now deployed with in-function authentication, alongside the unchanged legacy endpoint. It authenticates JWTs itself; if gateway JWT verification is disabled, retain the in-function authentication. `ANTHROPIC_API_KEY`, the Supabase service-role/anon credentials, and project URL must be present. Optional local JWT verification still falls back to Supabase Auth.
4. Real authenticated Haiku calls were tested on the deployed endpoint using isolated anonymous test accounts, which were deleted afterward. With zero library context, the ABG question returned cited Open RN output in 9.59 seconds; a reticulocyte-count question returned cited MedlinePlus output through web search in 12.35 seconds. The actual Swift-exported ABG request with library context also returned a cited answer (HTTP 200) in 5.33 seconds. Those timings preceded the final separate automated evidence-review stage and must not be treated as final latency. These are individual observed requests, not p50/p95 measurements or a clinical accuracy benchmark. Initial live failures exposed formatting and numerical-normalization bugs that fixture tests had missed; these were corrected before the successful checks.
5. Release the new app, whose endpoint is `ai-chat-v2`. The legacy `ai-chat` endpoint remains unchanged so existing installs continue working. Its old pass-through behavior and helper/quota weaknesses remain until it is retired; the new controls must not be described as protecting legacy traffic. Retire it deliberately after the supported-client transition.


## Final live verification

The final general adult ABG teaching path returned HTTP 200 in 4.83 seconds with no library context, fetched Open RN citations, correct respiratory/opposite and metabolic/same-direction relationships, and the separate automated source-support review. The general MedlinePlus search path also returned HTTP 200 (reticulocyte question, 13.93 seconds). These are individual requests, not latency percentiles or a clinical-quality benchmark.

A fresh **NurseMind AI Evidence QA** simulator (`E3AAAAD3-606A-4FFC-9F96-7A6038E72864`, iOS 26.2) runs the rebuilt Release app. The real first-launch authenticated request completed, and the actual on-screen answer plus both external reference links were verified. No mock AI or canned network transport was used. The ABG text itself is an explicitly authored quick-reference sequence checked against the fetched sources, not a fresh free-form model answer. The original Meta validation simulator was not erased.

Earlier live testing exposed two clinically misleading generated ABG responses despite citation/value checks and a model reviewer: an inverted respiratory relationship and conflation of normal and critical cutoffs. General ABG-reading questions therefore use a deliberately bounded, source-checked teaching sequence. Numeric/patient-specific, pediatric, and more specialized questions do not qualify for this quick-reference match. Tables retain column labels during extraction so normal ranges and critical thresholds remain distinct. Broader generated answers still require clinical evaluation; a model review is not a guarantee of correctness.

## External references and false-refusal correction

- The client no longer stops production requests just because local retrieval has no match. External sources and evidence arrive in a validated metadata event and replace the local citation mapping for that answer; unrelated library links are not attached.
- The server fetches source pages from approved MedlinePlus medical-test, CDC, FDA drug, DailyMed, and Open RN paths. NCBI Bookshelf is restricted to a specifically audited Open RN chapter and its ABG table; StatPearls and other Bookshelf titles are excluded. MedlinePlus Encyclopedia/drug pages, lookalike hosts, non-HTTPS URLs, unexpected ports, and redirects outside the allowlist are excluded. Open RN pages must expose CC BY 4.0 licensing.
- ABG questions preferentially retrieve the original Open RN pages rather than potentially incomplete library excerpts. ABG retrieval includes the separate adult reference-range table rather than assuming its values are present in the chapter text. Extracted table cells preserve spacing; bibliography/navigation content is removed.
- Production generation submits structured factual statements and supporting source IDs through a forced tool. The server renders the citation markers and footer, avoiding failures caused by markdown tables or missing punctuation around citations. A repair receives the rejected draft, exact unsupported values/units and supported quantities, and any reviewer feedback so it can correct the source mapping. The separate structured review checks meaning, directional relationships, causal claims, population, and qualifications against the specific cited excerpts. This model-based review can still make mistakes; it is not a substitute for clinical evaluation.
- The Swift and server gates normalize numbered/bold steps, nonclinical headings, footer decoration, equivalent decimal notation, and both endpoints of a cited numerical range. Chemical-subscript digits are not treated as standalone measurements. Changing a numerical value or medication unit still fails validation.
- App startup now waits for its initial Supabase sign-in task before requesting a token and can use the captured session token only while unexpired, addressing a first-request authentication race. A focused token test covers valid, expired, nearly expired, and malformed fallback tokens.
- Focused server checks: 42 tests passed, including external fallback, restricted sources, bounded extraction, structured citations, range/decimal equivalence, and unchanged medication-unit rejection. Focused Swift transport/format/value suites passed. These tests establish transport and rule behavior, not clinical semantic correctness.

## Evidence needed before a “best medical AI” claim

Use a fixed, de-identified nursing evaluation set with ICU and everyday bedside coverage, including pediatric/pregnancy boundaries, incomplete evidence, conflicting sources, prompt injection, diagnosis/prescribing requests, and follow-ups. Have qualified clinicians independently score factual correctness, citation support, relevance, missing safety context, refusal appropriateness, and usability. Measure end-to-end latency, repair/refusal rates, and cost on the same questions. Compare providers only under the same retrieval and safety conditions.

Bundled-library retrieval remains lexical, not semantic. External retrieval can search and fetch only the explicitly approved public or openly licensed source paths; this is not comprehensive literature coverage. It cannot guarantee that every citation supports the meaning of a sentence, that the corpus is current/complete, that every identifier is detected, or that every possible unsafe answer is blocked. Some legitimate answers may be refused by conservative unit/number matching. High-risk content and generated-answer evaluation still need clinical review; changing providers alone does not resolve those gaps.

## Ask presentation and evaluation follow-up

The subsequent [Ask improvements record](ASK_IMPROVEMENTS_2026-09-17.md) documents answer-first layout, honest loading text, source passages and functional reference navigation, partial-answer support, profile-context corrections, source-subject regression controls, and timing instrumentation. The current follow-up passed 48 server tests and 16 Swift tests plus Release build and real simulator checks. External lookup latency remains above the target, and live mixed-question output is still inconsistent. The 28-case review set is prepared but has not been clinically scored.
