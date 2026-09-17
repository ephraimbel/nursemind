# Ask improvements — September 17, 2026

The new backend behavior is deployed to `ai-chat-v2`. The rebuilt iOS app is installed on the separate **NurseMind AI Evidence QA** simulator; it still requires an App Store release. The legacy endpoint was not changed. Concurrent library, paywall, and advertising work was preserved.

## What changed

- The answer appears before related library/calculator handoffs. Handoffs appear after validation and the answer reveal finish.
- The loading indicator says “Finding a supported answer…” rather than cycling through imaginary library/research/drafting stages. A longer-wait message appears after twelve seconds. Its task cancels when the view disappears, and Reduce Motion disables the pulse. This is an honest waiting state, not live server-stage telemetry.
- Both inline citations and the references list open one scrollable source sheet. “See All” shows the full list inside that sheet; another source can be selected without dismissing it. “Done” closes it.
- Citation details include the passages supplied for that answer, retrieval date, and an original-source link. Library summaries are explicitly distinguished from fetched source passages. Retrieval dates are **not** presented as publication or update dates. No unknown publication dates were invented. Older saved answers without passage metadata continue to open their original references.
- Structured generation can supply a supported partial answer plus missing topics. The server distinguishes that from a total refusal. Every released clinical statement still needs a valid source, value/unit checks, and automated evidence review. Malformed structured output goes through bounded repair instead of immediately becoming a transport error; invalid display labels produce a generic missing-coverage notice rather than exposing their text.
- Scope classification distinguishes general institutional-protocol questions from individual treatment requests. The low-confidence message suggests a specific topic/point to clarify. The diagnostic refusal no longer promises an assessment list that the UI never renders.
- Simple lookups may use one supported statement rather than a mandatory minimum of three. Profile context was shortened to the actual specialty information; population restrictions remain in the server-owned policy. The adult ABG shortcut cannot override conversation history or a pediatric/maternity profile. Generic warnings about children in an old client prompt are not mistaken for the selected population.
- Privacy-safe timing counters now distinguish classification, answer generation, and evidence review on the server, and validated-answer arrival versus completion on the client. They contain no questions, answers, or source passages.

## Reliability findings and limits

A generated reticulocyte explanation repeatedly transferred a statement about total red blood cells to reticulocytes, despite model-based review. The source paragraph contains an ambiguous “too few/many” referent; see the original [MedlinePlus reticulocyte-count page](https://medlineplus.gov/lab-tests/reticulocyte-count/). That specific paragraph is excluded from retrieval, while explicit definitions/indications remain available. A narrowly scoped regression rule rejects the observed marker-risk substitution and supplies repair feedback. The final targeted reticulocyte response omitted that substitution. This rule handles an observed failure; it does **not** establish general semantic correctness.

Mixed questions combining a general medical topic and an unavailable local hospital protocol exposed classification and structured-output failures. Supported partial output was observed live, but earlier runs also refused or failed; do not claim every multi-part question will succeed. Repairs remain bounded and unsupported output is withheld.

## Verification

- **48 server tests passed**, including partial-answer handling, malformed-output repair, population/history boundaries, source extraction, the observed risk substitution, citation/value enforcement, and existing request/privacy/quota rules.
- **16 Swift tests in five suites passed**, covering passage attribution, source-versus-library provenance, persistence/older records, production transport, citation/unit rules, and PHI handling.
- `deno check` and the Release iOS simulator build passed.
- The real authenticated ABG answer rendered on the simulator. Source passages, the retrieval date, “See All,” selecting the second source, and “Done” were checked through the actual UI. Screenshots: [source details](audit-assets/2026-09-17/ask-improvements/citation-sheet.png), [all references](audit-assets/2026-09-17/ask-improvements/all-references.png).
- A fixed set of **28 synthetic questions** is prepared in [ask-evaluation-cases.json](qa/ask-evaluation-cases.json), covering ICU, everyday bedside care, medications, procedures, populations, gaps, and scope boundaries. These are review prompts, not clinician-approved answer keys. No clinician scoring has been performed.
- `scripts/evaluate_ai_chat.py` runs selected cases against the deployed endpoint with **empty client-library context**, records answers/source evidence and timings for review, and deletes its isolated anonymous evaluation accounts. It requires `--live` because it makes metered model calls. It never writes credentials.

The initial repeated six-question latency sample made twelve requests: eight returned answers, two correctly refused the dose request, and two refused the mixed question. Among the eight returned answers, median time was **11.354 seconds**, maximum **15.466 seconds**. This was an early baseline, not the final version, and HTTP 200 does not mean clinically correct. Later targeted runs are saved separately below. No improvement in overall latency percentiles or clinical accuracy is claimed.

## Remaining release work

Qualified clinicians must score the fixed cases and their citations, including omitted qualifications, misleading causal claims, high-risk topics, and inappropriate refusals. Expand to repeated end-to-end tests using the exact shipping library and real client context; the external-only benchmark is not representative of all app traffic. Refresh the evidence catalog after ongoing library changes settle. External lookup still commonly takes well over the five-second target. Submit the updated iOS client through the normal App Store process after release checks.

## Saved live results

- [Initial latency sample](qa/ask-initial-latency-2026-09-17.json): early version, includes the misleading reticulocyte wording that prompted the later fix. Internal QA only.
- [Source regression checks](qa/ask-source-regressions-2026-09-17.json): reticulocyte answer returned in 14.032 seconds without the observed risk substitution; the mixed question refused in 10.316 seconds; the patient-dose request correctly refused in 1.317 seconds.
- [Final mixed-question checks](qa/ask-partial-final-2026-09-17.json): one request refused in 12.497 seconds, one returned a cited A1C explanation plus an explicit missing-hospital-protocol notice in 13.206 seconds. The remaining refusal failed automated source-support review after a structured-output repair. These two observations do not establish a success rate or an accuracy score.

All saved clinical review statuses remain pending. No clinical reviewer was contacted, paid, or represented as having approved the output.
