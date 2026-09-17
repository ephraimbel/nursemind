# Paywall design refinement — September 17, 2026

Local UI changes in `PaywallView.swift`; not released.

## Final design

- Centered green NurseMind wordmark, explicitly retained at the user's request.
- Separate rounded Yearly and Monthly plan buttons, also explicitly requested, with a soft green fill, vivid border, and green checkmark only on the selected plan. Unselected plans have a neutral background, border, and radio circle.
- Centered feature titles, icons, supporting text, and plan heading; consistent 24-point content margins, serif headline, aligned monospaced prices, and readable billing terms. Reduced upper spacing and removed the full-width footer divider for a more cohesive composition.
- Fixed purchase/footer area keeps the CTA, renewal terms, Restore purchases, Terms, and Privacy accessible while content can scroll.
- Compact screens use shorter feature summaries so both plan options remain visible at the default text size.
- Close and legal controls have 44-point minimum tap targets; plans expose button and selected accessibility traits. Selection animation respects Reduce Motion.
- Prices, purchase/restore implementations, and consent-aware advertising checkout calls are preserved. Annual equivalent pricing is explicitly labeled as an equivalent; the actual annual price remains prominent.

## Verified

- Debug ARM64 iOS Simulator build passed. Log: `/tmp/nursemind-paywall-centered-build.log`.
- Installed and opened on dedicated iPhone 17 Pro and iPhone SE (3rd generation) simulators running iOS 26.2.
- Inspected light and dark screenshots on both sizes. Both plans and the purchase footer are visible on the compact screen.
- Switched between monthly/yearly: selected state, CTA text, and billing terms update correctly.
- Exercised the debug preview's missing-offering path: inline message is readable; no StoreKit purchase was initiated. Switching plans clears the error.
- Verified standard dismissal and the onboarding close/free path, which advances to the welcome completion screen.
- Inspected accessibility labels and selected button traits. This was not a full spoken VoiceOver audit.
- Focused whitespace validation passed. No production purchase, release, commit, or push performed.

Screenshots: `audit-assets/2026-09-17/paywall/` (`standard-light.png`, `standard-dark.png`, `compact-light.png`, `compact-dark.png`, `monthly-unavailable.png`, and `before.png`).

## Current visual validation

The latest user-directed revision centers the feature list and uses green only for the selected plan. Refreshed and inspected standard/compact light/dark screenshots after a successful Debug build. Earlier interaction checks established plan switching, billing-copy updates, the missing-offering message, and both exit paths; those handlers remain unchanged. `monthly-unavailable.png` and `compact-monthly-dark.png` retain earlier interaction evidence and predate this final centering/color revision.
