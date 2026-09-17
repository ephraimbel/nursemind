# TikTok server-side app events — access request

Prepared 2026-09-17. Draft only; not submitted.

## Support request

Subject: Enable server-side App Events API alongside NurseMind's existing iOS SDK

Please confirm and, if needed, enable server-side App Events API access for our existing NurseMind app:

- Advertiser: NurseMind_adv — 7641979134956224529
- TikTok App ID: 7643270946913714183
- Apple App Store ID: 6767489231
- iOS bundle ID: app.nursemind.ios
- Existing connection: TikTok iOS Business SDK

NurseMind uses RevenueCat for App Store subscriptions. We need to send verified paid trial conversions and renewals from RevenueCat webhooks when the app is not running, alongside SDK install and funnel events.

Please confirm:

1. Whether this advertiser/app is approved for server-side App Events API and whether approval is needed for SDK and API reporting to the same existing app destination.
2. The currently supported app-event endpoint, access-token type, required app/user/ATT fields, supported purchase event name, and test-event procedure for our setup.
3. Whether SDK and server events are deduplicated across both connections using the same event name and event ID, including the applicable time window. We can use one payment-event owner if cross-connection deduplication is unavailable.
4. How server events can be used for Purchase optimization on this app and whether any additional eligibility steps are required.

Our event payload will be restricted to verified subscription transactions, paid amount/currency, event time, and a consented pseudonymous account identifier. We will not send clinical activity, searches, patient information, names, email addresses, or phone numbers. ATT authorization will be checked before sharing any identifier-based advertising event. NurseMind already owns its SKAN conversion updates; the TikTok SDK updater stays disabled.

Thank you.

## Evidence and implementation boundary

A TikTok SDK collaborator instructed developers requesting server-side trial conversion reporting to submit an allowlisting ticket on August 4, 2026. This is evidence of an access prerequisite, not proof that NurseMind's account has been denied: [maintainer response](https://github.com/tiktok/tiktok-business-ios-sdk/issues/57#issuecomment-5179087068). The current account remains blocked at TikTok's required two-step-verification screen, so its app-event permissions and SDK/API coexistence cannot yet be inspected.

TikTok's public guide describes Events API at a high level but does not establish account-specific access: [Events API overview](https://ads.tiktok.com/resources/help/article/events-api). Its detailed app documentation did not load successfully during this check. An SDK key being populated does not prove that it authorizes server-side reporting.

The existing RevenueCat webhook was inspected. It changes subscription access only; it has no TikTok forwarding, delivery ledger, or server-readable tracking consent. Production Supabase access is available for the linked NurseMind project, but no functions, secrets, migrations, entitlement behavior, or tested SDK payment paths were changed while the supported delivery contract remains unverified.

Once access is confirmed, the implementation must include:

- Authenticated RevenueCat webhook intake restricted to the correct app, store, environment, and product IDs.
- Paid amount from `price_in_purchased_currency` paired with its `currency`; no USD conversion paired with another currency and no catalog-price fallback. Free trials remain separate zero-revenue events.
- Actual payment timestamps. RevenueCat documents that App Store renewal `purchased_at_ms` can describe a future billing-period start; it must not blindly replace the actual payment event time.
- Server-readable consent synchronized by authenticated app users, revocation handling, account deletion cleanup, and no replay of pre-consent events.
- One owner per payment event, stable transaction IDs, an atomic delivery ledger, bounded retries, and checks for HTTP success plus TikTok's response code.
- A separate test destination or validated test-event code; no fabricated production purchase events.

RevenueCat's field definitions: [event types and fields](https://www.revenuecat.com/docs/integrations/webhooks/event-types-and-fields).
