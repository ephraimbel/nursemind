# NurseMind 1.5.0 (24)

Release preparation — September 17, 2026.

## Included changes

- Expanded Library: 2,139 entries across all eight categories, 54 topic collections, added source records and review evidence, and deeper ICU, bedside, specialty, medication, laboratory, procedure and scenario coverage.
- Ask: the `ai-chat-v2` client, passage-level evidence, external reference support, answer presentation, source sheets, retrieval and privacy controls, and local follow-up suggestions.
- Refined paywall layout and compact-screen behavior; native App Store review request on the onboarding social-proof page.
- Consent-aware Meta and TikTok attribution, SKAdNetwork support, subscription-event handling, and corresponding privacy disclosures.
- Supporting tests, source snapshots, QA records, ad assets and the Seedance production brief.
- App version updated to 1.5.0 with build number 24; Python bytecode excluded from version control.

## Verification

- All 48 Deno backend tests and `deno check` passed.
- Isolated SQL quota/role/refund checks passed.
- Eight importer tests passed using the existing content Python environment.
- Marketing production build passed.
- All 218 Swift tests in 63 suites passed in Release with `ENABLE_TESTABILITY=YES`. Search averaged 12.2 ms per query, 9.2 ms for repeated searches and 627 ms for index construction.
- The earlier Debug run passed functional checks but exceeded three timing thresholds; an isolated Debug query run also exceeded its 50 ms threshold. Production-optimized performance passes; no timing limits were weakened. A TikTok test was corrected to expect SDK debug mode only in Debug and disabled in Release.
- The generated app project initially resolved PostHog 3.58.1 while package tests used 3.58.3. Final archive and export were rebuilt with all dependency pins matching the checked-in package lock. The upload script now copies that lock and disables automatic resolution for archiving.
- Generated evidence catalog matches all 42,839 local server fingerprints. Both Swift-exported request fixtures pass server validation (7 sources / 7,544 context characters and 5 sources / 5,644 characters).
- Changed-file credential-pattern scan found no matches. Actual credentials remain ignored.
- Signed release archive and App Store distribution export passed. Archive code signature and IPA metadata verify `app.nursemind.ios`, version 1.5.0, build 24. The final simulator build installed and launched successfully; the Feed rendered normally. Launch evidence: `build/qa-1.5.0-24/simulator-launch.png` (local artifact).
- Shell syntax and staged whitespace checks passed. Raw source snapshots retain their original bytes through `.gitattributes`.

## Artifacts and publication scope

Archive: `build/Nursemind-1.5.0-24.xcarchive`.
Export: `build/export-1.5.0-24/Nursemind.ipa` (31.5 MiB).

IPA SHA-256: `939e9eadf2c293b5ce2c12491a8f98c416c417cd32b3ae56f3b53aa727ae6bd6`.

Build artifacts and local credentials are not committed. This checkpoint does not itself submit an App Store release, deploy backend changes, or establish clinical review approval. The existing content review queues, AI evaluation limitations, attribution delivery checks and onboarding-review App Review history remain documented in their respective records. The local evidence catalog is verified against this exact app corpus; this task does not claim that the deployed backend catalog has been updated.
