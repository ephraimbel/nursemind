# NurseMind AI chat v2

Authenticated nursing-reference endpoint deployed alongside the legacy `ai-chat`. The app sends `x-nursemind-contract: 2`; classifier/enrichment calls and arbitrary provider requests are not public operations.

Library evidence is optional. Valid catalog-matched excerpts take the fast path; missing or stale excerpts are discarded and use server-fetched external references. Insufficient library answers also trigger the fallback. External retrieval uses a bounded Anthropic web search, exact host/path and license restrictions, bounded page reads with redirect validation, and a six-hour bounded cache of public source pages. ABG questions preferentially fetch the audited Open RN chapter and its reference table directly. General adult ABG-reading questions can use an explicitly authored teaching sequence that must pass the same value checks and automated source-support review; specialized or patient-specific requests do not qualify. Extracted tables preserve their column labels.

The server reserves quota, classifies scope, generates structured statements with explicit source IDs, renders citations, validates values and units, and runs a separate claim-support review before returning text. A rejected review feeds its corrections into the bounded repair. Each evidence stage allows one repair, which sees the rejected draft and validation categories. At most one external retrieval runs. Sources are actual fetched pages, never URLs invented in answer text. The source list and evidence are sent in an `evidence` SSE event before the answer; the client validates both before display.

HTTP 422 carries a typed clinical refusal, 429 a quota limit, and 503 a service failure. Backend logs include only operational metrics and validation categories. No prompts, drafts, source excerpts, or generated answers are logged.

See `docs/AI_CHAT_QUALITY_2026-09-17.md` for validation, release status, and clinical limitations. The app changes still need an App Store release; existing installs using legacy `ai-chat` do not receive these controls.
