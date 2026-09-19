# NurseMind Meta attribution

Setup date: September 17, 2026. No ad campaigns or spending were activated.

September 17 campaign follow-up: Meta's low-volume AEM acknowledgement was available and accepted during the purchase-campaign setup. Its eligibility dialog now confirms **“Your app is eligible”** for Meta's attribution for iOS 14+. The saved, inactive campaign uses **Maximize number of app events → Purchase** with AEM and optional SKAN reporting off. This does not publish the pending SKAN schema or verify production Purchase delivery; no Purchase event was visible in today's production event table. Campaign and identity details: `docs/META_AD_DRAFT_2026-09-17.md`.

## Accounts

| Asset | Identifier |
| --- | --- |
| Meta app | `1428327009477918` |
| NurseMind business portfolio | `1401616082083732` |
| NurseMind App Events dataset | `4348855118713111` |
| Meta sandbox app | `1100153889194517` |
| NurseMind Sandbox Events dataset | `1485036596784813` |
| Approved ad account | `2147670782515663` |
| RevenueCat project | `807b6ffc` |
| iOS bundle | `app.nursemind.ios` |
| App Store app | `6767489231` |

The business portfolio owns the app. The app is published, authorizes the approved ad account, and is paired with the dedicated dataset; the dataset's sharing list also confirms that ad account. Meta's app dashboard shows no required actions. Business verification remains uncompleted but did not block this app-ad use case from publishing.

## App integration

Meta iOS SDK 18.1.1 is pinned in NursemindCore. `MetaAnalyticsService` waits for authorized ATT status before initializing Meta, collecting attribution identifiers, or activating the app. It refreshes RevenueCat attribution after account linking and foregrounding, and clears the Facebook anonymous attribute when consent is absent. RevenueCat itself maintains the ATT consent attribute.

Meta receives app activation and a typed, parameter-free funnel from the SDK: onboarding completed, tutorial completed, paywall viewed, and checkout started. Checkout fires only when a real RevenueCat package is available. RevenueCat is the only sender of trial and purchase events. Automatic logging is disabled in Info.plist, runtime settings, and Meta's dashboard; automatic advanced matching and event suggestions are off. No clinical questions, answers, reference topics, profile fields, email, or phone matching are supplied to Meta. Attribution identifiers are refreshed immediately before submitting a purchase as well as after account linking.

Only the public Meta App ID and SDK client token belong in the ignored `Nursemind/Secrets.swift`. Neither the Meta App Secret nor a Conversions API access token belongs in the app or repository. Populate the two public values on any other build machine; blank values disable this integration.

Debug builds use `metaSandboxAppID` and `metaSandboxClientToken`; they never fall back to the production Meta app. Release builds use the production keys. RevenueCat independently routes sandbox receipts to the sandbox dataset. TestFlight uses Release code and Apple sandbox receipts, so its SDK activations still go to the production app while its purchase events go to the sandbox dataset. Use the signed Debug build for completely isolated SDK-and-purchase testing.

The app-owned SKAN 4 service is enabled at launch and handles app open, trial start, and first paid purchase. Meta's SDK updater stays disabled, and TikTok's SDK updater is now explicitly disabled before initialization, leaving one conversion-value owner. The user scoped this launch to Meta only; no TikTok dashboard work or sign-in is required. Meta's matching dashboard mapping still needs to be published before running SKAN campaigns.

Meta's activation flush now waits for the SDK's queued activation event. An immediate flush after `activateApp()` could run before that event existed when using explicit-only flushing.

## SKAN configuration — app enabled, Meta mapping pending

**The app implementation is enabled; the Meta dashboard is not yet complete.** On September 17, Events Manager showed one active SDK App install. Both Customize and Use Recommendations → Custom Integration still led to zero selectable events and disabled Add Event/Next, with a message requiring events to be processing first. No mapping was saved. The SDK-managed option also remained disabled. Partner import requires a configured measurement partner's schema URL; NurseMind does not currently have one.

`SKANAttributionService.shared.configure()` now enables the app-owned updater by default. The earlier `sharedSchemaIsPublished = false` release gate was removed: the user wants Meta only, and waiting for dashboard event availability should not force a second release just to enable the app's API calls. TikTok's `disableSKAdNetworkSupport()` is unconditional, while Meta's SDK updater stays off. The upcoming build can produce Apple's conversion values; do not start SKAN campaigns until Meta has the matching interpretation below. This change does not publish a Meta schema, verify a real postback, or activate ads.

Implemented app schema (must be matched exactly in Meta before campaign activation):

| Signal | Fine value, first window | Coarse value, every window | Meta event |
| --- | --- | --- | --- |
| App opened | 1 | low | `fb_mobile_activate_app` |
| Trial started | 2 | medium | `StartTrial` |
| First paid subscription / trial conversion | 3 | high | `fb_mobile_purchase` |

Value optimization and early window locking stay off. These values describe events, **not dollar amounts or exact SKAN ROAS**. RevenueCat CAPI remains the source of consented purchase amounts/currency and renewals. No clinical activity, account identifier, or product ID is passed to Apple's conversion API.

NurseMind is the advertised app, not an app displaying third-party ads. Apple's advertised-app setup requires the conversion API call; adding a publisher's `SKAdNetworkItems` list is not the missing integration. No optional developer postback-copy endpoint was added.

The implementation:

- Uses Apple's fine/coarse/lock-window API with `lockWindow: false`, independently of ATT. Meta's identifier-based SDK and CAPI consent gates remain separate.
- Keeps the highest pending value in each of the 0–48 hour, 48 hour–7 day, and 7–35 day windows. It does not replay an earlier trial/purchase as a new conversion in a later window.
- Stores pending and successful values locally, excludes this state from backups, serializes API updates, and retries a failed update on the next foreground/event. Apple ultimately controls attribution windows, privacy thresholds, and delivery.
- Records purchases only from a completed purchase with a recent transaction. Ignores pre-install/restored subscriptions, family-shared/promotional access, known billing issues/refunds, and paid periods with unknown or zero paid amounts. Release builds ignore sandbox subscriptions.
- Watches a trial actually started on this installation and refreshes RevenueCat on foreground during the attribution period. A matching later paid transaction upgrades that window to high once. Renewals are not replayed as new acquisitions.

The annual trial is three days, so conversion normally belongs in the second window. A background RevenueCat webhook cannot directly update SKAN on the device. If the user never reopens the app during a remaining window, this implementation cannot report that trial conversion through SKAN; CAPI delivery remains separate and consent-dependent.

To unblock Meta's editor: release the enabled app and obtain legitimate app-open, trial, and purchase events in the **production** dataset; then publish/read back the exact Meta schema above. No additional app release is needed if the saved mapping matches these values. Sandbox events belong in the separate sandbox destination and do not establish production event availability. No purchase was fabricated to unlock the editor, and no production charge, ad campaign, or release was made. TikTok advertising is deferred; its dashboard would need the same mapping before any future TikTok SKAN campaign, since its SDK no longer owns the conversion values.

## RevenueCat configuration

Conversions API is saved with dataset `4348855118713111`, not the Meta App ID. The dataset token was generated without Dataset Quality API access and stored only in RevenueCat's integration settings. **Send events when ATT consent is not authorized** is unchecked; this was verified after reloading the saved integration. RevenueCat currently shows no integration events.

Saved and reloaded mapping:

| Billing event | Meta event | Meaning |
| --- | --- | --- |
| Trial started | `StartTrial` | Trial activation, not paid revenue |
| Trial converted | `fb_mobile_purchase` | First charge after the trial |
| Initial purchase | `fb_mobile_purchase` | Paid subscription without a trial |
| Renewal | `fb_mobile_purchase` | Subsequent successful charge |
| Non-subscription purchase | `fb_mobile_purchase` | Reserved for any future one-time product |

`fb_mobile_purchase` is Meta's standard app Purchase event. The paid-event mapping intentionally replaces RevenueCat's default `Subscribe`, so Purchase reporting includes successful billing. Renewals can contribute to purchase count and revenue when Meta attributes them under its reporting rules; these counts are not counts of newly acquired subscribers. RevenueCat sends the amount and currency from its server-side transaction reporting, with CAPI values normalized to USD. Do not hardcode the $99.99/$14.99 list prices or log a second SDK purchase. Use RevenueCat for net revenue/refunds: this integration does not support negative revenue.

Both production and sandbox Apple Server Notification URLs were applied through RevenueCat and independently verified in App Store Connect to match RevenueCat's destination. In-app purchase and App Store Connect API credentials show valid. The notification history still shows no notifications received; saved URLs are configuration evidence, not delivery evidence.

Sandbox dataset `1485036596784813` is linked to the dedicated Meta test app. Its CAPI token was generated without Dataset Quality API access, stored only in RevenueCat's sandbox field, and verified saved after reload. The production credentials were retained. Automatic/codeless and automatic purchase events are off in the sandbox too. The user chose to test on the paired iPhone later; no sandbox transaction was fabricated and no production purchase was made. A successful build or saved integration does not demonstrate purchase-event delivery or campaign attribution.

## Release checks still required

- Complete business verification if Meta later requires it; the Meta app is already published with no current required actions.
- Publish the updated website privacy policy and update the live App Store privacy answers before releasing this build. Local copies were updated; live publishing is not implied. Live App Store Connect currently lists only Device ID, Payment Info, and Name, with Name incorrectly marked for advertising; reconcile the complete disclosure with `APP_STORE_PRIVACY.md` before publishing the new release.
- Install a release/TestFlight build on a physical device. Test ATT denied and allowed, foregrounding, anonymous-to-signed-in account linking, and subsequent consent withdrawal. Confirm RevenueCat's `$attConsentStatus`, `$fbAnonId`, and authorized device identifiers without recording their raw values.
- Verify a sandbox trial and purchase once in the sandbox destination. Check RevenueCat delivery status and the matching Meta events; ensure there is no duplicate SDK purchase. Real Meta attribution/optimization eligibility requires Meta's own processing and event-volume requirements.
- The dataset is categorized **Health & wellness - other**, matching the general information category. Meta has **Core setup: On**, which can restrict parameters. Review any subsequent event restrictions; do not disguise event names or content to evade restrictions.
- Complete Meta's pending SKAN dashboard mapping after real event types become selectable. The next app build enables SKAN independently of ATT; its identifier-based CAPI purchase path still requires ATT consent. Do not describe enabled client code or saved CAPI settings as verified SKAN attribution.

## Validation completed

- SKAN follow-up, including the final Meta-only activation change: the Release simulator app build and all 13 focused tests passed (8 SKAN + 5 Meta). Cases cover disabled configuration, default-enabled startup, a three-day trial converting in window two, direct paid purchase, restored/zero-value/ineligible subscription rejection, serialized updates, failure/relaunch retry, window boundaries, no renewal replay, and unrelated subscription rejection. Apple's update call is substituted in unit tests; this does not prove a real ad-attributed postback.
- The enabled Release build was installed and launched on the separate NurseMind Meta Validation simulator. Its persisted state showed first-window `desired: 1`; TikTok logged `SKAdNetwork Support: NO`, and StoreKit logged an attempted conversion-value update. StoreKit returned `SKANErrorDomain` code 10 (`unknown` in Apple's SDK header), so `submitted` correctly stayed 0 for retry. This confirms the call path and failure handling, not accepted attribution or a successful postback. No sandbox purchase or production charge was made.
- Debug and Release iOS simulator builds passed with the new SDK and application wiring.
- Five focused tests passed for consent denial, no pre-consent replay, consent withdrawal, activation deduplication, purchase-identifier ordering, and missing configuration. The signed development iPhone build succeeded. Device installation and the sandbox purchase test were deferred by the user.
- App launched on the separate “NurseMind Meta Validation” simulator; Library rendered.
- Privacy plists parsed; marketing TypeScript check passed; integration changes passed whitespace checks.
- Meta automatic event logging, purchase logging, advanced matching, and event suggestions were verified off.
- App Store ID and bundle ID were verified in Meta. The published Meta app, linked dataset/ad account, and persisted RevenueCat settings were read back successfully. No purchase delivery or campaign-attribution result is claimed.

References: [RevenueCat Meta Ads integration](https://www.revenuecat.com/docs/integrations/attribution/meta-ads), [event delivery and revenue fields](https://www.revenuecat.com/docs/integrations/attribution/reference/meta-ads), [Apple sandbox testing](https://www.revenuecat.com/docs/test-and-launch/sandbox/apple-app-store), [official Meta iOS SDK](https://github.com/facebook/facebook-ios-sdk/tree/v18.1.1).

SKAN references: [Apple conversion windows](https://developer.apple.com/documentation/storekit/receiving-postbacks-in-multiple-conversion-windows), [RevenueCat on server events and SKAN](https://www.revenuecat.com/blog/growth/skadnetwork-server-to-server-events-attribution-revenuecat), [TikTok SKAN 4 schema guidance](https://ads.tiktok.com/resources/help/article/about-skan-4-0-and-tiktok).
