# Onboarding review request verification

Date: 2026-09-17

- Debug simulator build succeeded with code signing disabled.
- Device: NurseMind Digestive Urology QA Sep17, iPhone 17 Pro, iOS 26.3.
- Launched the existing DEBUG `NM_ONBOARDING_STEP=reviews` route.
- Native StoreKit “Enjoying NurseMind?” prompt appeared automatically on the social-proof page. No rating or review was submitted.
- App-container preferences confirmed `nm.review.hasRequested` persisted as true.
- Relaunching the same route showed the social-proof page without another prompt.
- Continue advanced to the paywall. No subscription purchase was attempted.
- Restored normal app launch after verification.

Screenshots: `native-review-on-social-proof.png`, `social-proof-revisit.png`, `continue-to-paywall.png`.

The app records a request attempt; StoreKit does not report whether it displayed a prompt. Apple controls presentation in distributed builds. This change restores a flow previously associated with the documented August 9 App Review rejection, at the founder’s explicit request. No App Store submission was made.

Sources: [RequestReviewAction](https://developer.apple.com/documentation/storekit/requestreviewaction), [Requesting App Store reviews](https://developer.apple.com/documentation/storekit/requesting-app-store-reviews), [App Review guidelines](https://developer.apple.com/app-store/review/guidelines/#ratings-and-reviews).
