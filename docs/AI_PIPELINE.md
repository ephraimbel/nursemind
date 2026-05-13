# NurseMind AI Pipeline — Architecture & Security

The AI co-pilot is the second-most safety-critical surface after the library itself. This document describes the v1 implementation, the security boundaries, and the production migration plan.

## High-level pipeline

```
User question
     │
     ▼
┌──────────────────────────────────────────────────────────────┐
│ 1. Client-side PHI scrubber (PHIScrubber.swift)              │
│    • Regex pass over input (spec §2.2)                       │
│    • If PHI matched → user sees in-chat notice              │
│    • Scrubbed text proceeds                                  │
└──────────────────────────────────────────────────────────────┘
     │
     ▼
┌──────────────────────────────────────────────────────────────┐
│ 2. Intent classifier (Claude Haiku, IntentClassifier.swift)  │
│    Categorizes question into one of 6:                        │
│    • nursing_clinical (~90% — proceed)                        │
│    • diagnostic_request → refusal A                           │
│    • prescribing_request → refusal B                          │
│    • patient_facing → refusal F                               │
│    • non_clinical → refusal E                                 │
│    • low_clarity → refusal D                                  │
│    Cost: ~$0.0007 per question                               │
└──────────────────────────────────────────────────────────────┘
     │
     ▼ (only nursing_clinical proceed past here)
┌──────────────────────────────────────────────────────────────┐
│ 3. RAG retrieval (RAGRetriever.swift)                        │
│    • ContentRegistry.search() over the bundled library      │
│    • Top 5 entries become context chunks                    │
│    • Each chunk gets a [c001]–[c005] id and citation        │
│    • If no high-confidence match → low-confidence refusal   │
└──────────────────────────────────────────────────────────────┘
     │
     ▼
┌──────────────────────────────────────────────────────────────┐
│ 4. Generation (Claude Sonnet 4.5, AnthropicClient.swift)     │
│    • System prompt (SystemPrompt.swift, spec §7.5)          │
│    • User context: career stage, units                       │
│    • Last 6 turns of conversation                            │
│    • Retrieved chunks as labeled context                     │
│    • Temperature: 0.2 (low — clinical content)              │
│    • Max tokens: 1024                                        │
│    • Streaming: yes (SSE)                                    │
│    Cost: ~$0.012 per question                               │
└──────────────────────────────────────────────────────────────┘
     │
     ▼
┌──────────────────────────────────────────────────────────────┐
│ 5. Response validator (ResponseValidator.swift)              │
│    • Citation regex check: every numerical clinical claim   │
│      (dose, range, threshold, vital sign target) must have  │
│      a [cXXX] within 100 characters                          │
│    • Hallucinated citation check: every cited [cXXX] must   │
│      exist in the retrieved corpus                           │
│    • Length check: <600 words                                │
│    Failure → regenerate with stronger "cite or refuse"       │
│    prompt (one retry); second failure → low-confidence       │
└──────────────────────────────────────────────────────────────┘
     │
     ▼
┌──────────────────────────────────────────────────────────────┐
│ 6. Stream to client                                          │
│    Citations attached at end of stream                       │
│    Footer auto-appended: "Reference only — verify..."       │
└──────────────────────────────────────────────────────────────┘
```

## Security boundary — the most important section

### Where the key lives now (DEVELOPMENT)

The Anthropic API key is in `NurseMind/Secrets.swift`, which is **gitignored**. The file is included in `#if DEBUG` only — release builds will return `nil` and the AI will fall back to `MockAskService`.

This works for: simulator testing, local development, ad-hoc internal builds.

### Where the key MUST live for production

iOS app binaries can be reverse-engineered. Any string baked into the app is extractable by anyone who downloads the IPA. **Shipping the API key in an iOS app is unsafe regardless of obfuscation.**

Production architecture:

```
┌─────────────────┐     auth + question      ┌──────────────────────────────┐
│  iOS app        │ ────────────────────────▶│  Supabase Edge Function      │
│  (no API key)   │                           │  /ai-chat                    │
│                 │                           │  • Validates auth (RLS)      │
│                 │                           │  • Runs PHI scrubber         │
│                 │                           │  • Runs intent classifier    │
│                 │                           │  • Runs RAG (pgvector)       │
│                 │                           │  • Calls Claude (key here)   │
│                 │                           │  • Validates response        │
│                 │ ◀──── streaming SSE ──── │  • Streams back              │
└─────────────────┘                           └──────────────────────────────┘
                                                            │
                                                            ▼
                                              ┌──────────────────────────┐
                                              │ Anthropic Messages API   │
                                              │ (key in Edge env vars)   │
                                              └──────────────────────────┘
```

**Migration steps before TestFlight:**

1. Spin up the Supabase Edge Function (`supabase/functions/ai-chat/`) — scaffolding already created
2. Move the system prompt and pipeline logic server-side
3. Configure `ANTHROPIC_API_KEY` as a Supabase secret
4. Update `AnthropicAskService` to call the Edge Function URL with the user's auth token instead of Anthropic directly
5. Delete `NurseMind/Secrets.swift` and `Secrets.anthropicAPIKey`
6. Verify a release build no longer contains any reference to "sk-ant"

This is tracked in `docs/PLAN.md` as a public-launch blocker.

### Other safety layers

- **PHI scrubber runs client-side first** — even if the server-side scrubber fails, the request leaving the device is already scrubbed
- **Refusal templates are hard-coded** — diagnostic, prescribing, PHI-detected, low-confidence, non-clinical, patient-facing. They never go through the LLM.
- **Citation enforcement** — server-side regex rejects any numerical claim without a citation. Hallucinated citation IDs are caught.
- **Conversation logs are PHI-stripped** before storage (currently in-memory, will be Supabase post-migration).
- **No PHI sources** — the AI corpus contains zero patient data; only the curated library.

## What this is NOT

This pipeline does NOT:

- **Diagnose** — refuses with template A
- **Prescribe** — refuses with template B
- **Process medical images or signals** — keeps us out of FDA jurisdiction
- **Provide patient-facing advice** — refuses with template F
- **Generate clinical content not grounded in the library** — RAG-required + citation-enforced
- **Persist patient identifiers** — PHI scrubbed pre-call, logs anonymized

These boundaries are jurisdictional under the FDA CDS guidance (§520(o)(1)(E)) and contractual via Apple App Store Guideline 1.4.1 / 1.4.2. Crossing them means the product becomes a regulated medical device.

## Costs (back-of-envelope)

| Component | Per-question cost |
|---|---|
| Intent classifier (Haiku) | ~$0.0007 |
| RAG retrieval (local search) | $0 |
| Generation (Sonnet, 2K in / 400 out) | ~$0.012 |
| **Total** | **~$0.013** |

At Pro user behavior (~3 questions/day):
- 6,000 Pro users × ~$1.20/mo = **~$7K/mo Anthropic spend at month 6**
- 15,000 Pro users × ~$1.20/mo = **~$18K/mo at month 12**

These tracks are within the Pro pricing margin ($9.99/mo) even before optimization. Caching common Q&A and free-tier rate limiting will keep growth bounded.

## What's still TODO before public launch

| # | Item | Owner | Status |
|---|---|---|---|
| 1 | Server-side proxy (Supabase Edge Function) | Founder | Not started |
| 2 | pgvector + OpenAI embeddings for true RAG (current: keyword search) | Founder | Not started |
| 3 | Conversation log persistence with PHI-strip pass | Founder | Not started |
| 4 | Cost dashboard | Founder | Not started |
| 5 | Counsel review of the system prompt + refusal templates | Founder + attorney | Not started |
| 6 | Tech E&O insurance bound | Founder + broker | Not started |
| 7 | Editorial Standards page on nursemind.app documenting all of this | Founder | Not started |

Until all of these are done, the app stays in dev/internal-testing only.
