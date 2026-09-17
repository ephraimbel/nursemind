# NurseMind 1.5.0 (25)

Onboarding layout correction — September 17, 2026.

The showcase phone preview now scales uniformly to fit the space below each heading. This prevents the fixed-height illustration from pushing the eyebrow and headline behind the status bar. The Ask, Library and NCLEX screens retain their existing typography, copy and navigation.

## Verification

- Debug simulator build passed.
- All three showcase screens were visually checked on iPhone 17 Pro (iOS 26.3) and iPhone SE, third generation (iOS 26.2).
- Complete headings, subtitles, phone outlines and bottom controls remain visible.
- Continue advances through the pages; Get started and Skip reach personalization.
- Before/after evidence and details: `docs/audit-assets/2026-09-17/onboarding-showcase/validation.md`.
- This change only affects layout and build metadata. It does not change library content, AI behavior or subscription logic; the full build-24 test results remain recorded in `docs/RELEASE_1.5.0_BUILD_24.md`.

## Build and distribution

Version stays 1.5.0; build number increases to 25. Signed Release archive and App Store distribution export passed. Deep code-signature verification passed; the exported IPA confirms `app.nursemind.ios`, version 1.5.0, build 25.

Archive: `build/Nursemind-1.5.0-25.xcarchive`.
IPA: `build/export-1.5.0-25/Nursemind.ipa`.
IPA SHA-256: `e14e3de3950b053d509e2e0051fb906406644dae55f313f97526cf0a9d223c3c`.

Upload succeeded at 08:35 CDT; App Store Connect now confirms processing Complete for 1.5.0 (25).

At the start of distribution work, App Store Connect showed build 24 already Waiting for Review. Replacing it requires withdrawing the existing submission; no withdrawal or new review submission has been performed by this task.


Follow-up: before the authorized replacement could run, Apple approved 1.5.0 with build 24. The same onboarding fix was submitted as 1.5.1 (26) and is Waiting for Review; see `docs/RELEASE_1.5.1_BUILD_26.md`. Build 25 remains an uploaded, unsubmitted artifact.
