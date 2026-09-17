# NurseMind 1.5.1 (26)

Onboarding patch submission — September 17, 2026.

## Reason for the new version

The founder authorized replacing 1.5.0 build 24 with the corrected onboarding build and resubmitting it. At execution time, App Store Connect showed 1.5.0 (24) already Ready for Distribution. A released version cannot accept a replacement binary, so the same verified correction is packaged as 1.5.1 (26).

## Change and validation

Application code is identical to build 25; only the version/build metadata changed. The preview illustration scales to the remaining page space, preventing Ask, Library and NCLEX titles from being pushed behind the status bar. Visual checks on iPhone 17 Pro and iPhone SE and navigation checks remain recorded in `docs/audit-assets/2026-09-17/onboarding-showcase/validation.md`.

Signed Release archive and App Store distribution export passed. Deep signature verification passed. The IPA confirms `app.nursemind.ios`, version 1.5.1, build 26.

Archive: `build/Nursemind-1.5.1-26.xcarchive`.
IPA: `build/export-1.5.1-26/Nursemind.ipa`.
IPA SHA-256: `f2ae647a9956f474d4e75f059023246170a299ae28287e3946f76d4dd4534981`.

Upload succeeded at 16:38 CDT through the existing Xcode App Store Connect session. Apple processing completed, and build 26 was attached to version 1.5.1. App Store Connect build ID: `4d500616-f765-4c99-80e8-4368f1ef7ba1`.

Submitted for App Review and verified the confirmation “1 Item Submitted” and version status “1.5.1 Waiting for Review.” Submission ID: `4c6cb82f-2292-491c-9393-4fdeaf5c0fc0`. [App Review submission](https://appstoreconnect.apple.com/apps/6767489231/distribution/reviewsubmissions/details/4c6cb82f-2292-491c-9393-4fdeaf5c0fc0).

## App Store metadata

Promotional text matches the approved 1.5.0 promotional text.

What's New:

> Fixed clipped titles in the onboarding previews. The phone examples now resize to fit your screen, keeping headings and navigation buttons visible, including on smaller iPhones.

Review notes describe the layout correction and how to reach the showcase, and confirm that clinical content, AI behavior, subscriptions and calculator availability are unchanged from approved version 1.5.0 (24). Existing screenshots and release settings are retained.
