# TikTok purchase measurement — 2026-09-17

App-side changes are implemented locally. Dashboard setup and real-device delivery verification are **not complete**. This is not a claim that a live campaign is optimizing for purchases.

## Event ownership and consent

- TikTok SDK initialization, account identification, and advertising events require authorized ATT consent. Denied/not-determined events are dropped, not replayed after consent. Backgrounding pauses transmission; foregrounding rechecks consent. Revocation clears pending app events and trial-conversion state, disables SDK transmission, and removes the identified account. Account changes reset TikTok identity before identifying the next account.
- Disable TikTok automatic payment tracking. The verified RevenueCat purchase path is the only app-side owner of payment events. Disable automatic enhanced-data capture, automatic launch/retention events, and the TikTok SKAN updater. App activation is sent explicitly after consent; the SDK retains its consent-gated installation event.
- Library searches no longer produce TikTok events. Paywall events carry only the constant `paywall`, never the entry, specialty, query, or source that led to it. No clinical payload, email, phone, or name is sent.
- DEBUG enables TikTok's test-event pipeline. Release does not enable debug mode and rejects sandbox subscription revenue. Tests use injected dependencies and do not send events to TikTok.

| Action | TikTok event | Revenue |
| --- | --- | --- |
| Consented app activation | `LaunchAPP` | None |
| Onboarding completion | `Registration` | None |
| Tutorial completion | `CompleteTutorial` | None |
| Paywall displayed | `ViewContent` | None |
| Valid subscription package selected and checkout initiated | `Checkout` | None |
| Verified free trial transaction | `StartTrial` | Zero |
| Verified immediate paid subscription | `Purchase` | RevenueCat's confirmed paid amount and currency |
| Observed conversion of a locally started trial | `Purchase` | Confirmed paid amount and currency |

`Checkout` is the SDK's standard event name; tapping a purchase button does not mean payment details were entered. Missing offerings do not emit Checkout. Subscribe is no longer used as the paid conversion signal.

A payment requires an active, purchased App Store entitlement without a refund/billing issue, a matching StoreKit transaction identifier/product/date, and the currently linked account. Restore-only customer info cannot create a new purchase. No catalog-price or USD fallback is used for advertising revenue. Missing price can recover from later verified customer info. Each transaction/event receives a stable ID; a persisted 256-ID ledger prevents repeated callbacks and app restarts from submitting it again. The ledger records submission to the SDK, not acknowledgment by TikTok's servers.

## Trial conversion limits

A consented trial started on this installation is retained locally. RevenueCat customer-info updates and foreground refresh can report its first confirmed paid conversion. Already-existing subscriptions, another account/product/subscription chain, refunds, family sharing, zero-price grants, and stale purchases cannot be reported as new purchases.

Observed payments must be no more than 24 hours old: the SDK assigns its own event time, so old renewals must not masquerade as today's purchase. Refresh attempts stop after 35 days. Revocation/account deletion removes the pending conversion. This client path does **not** capture every renewal or a conversion when the user never reopens the app. Complete lifecycle measurement still requires a consent-aware server/MMP integration with transaction deduplication; the existing Supabase RevenueCat webhook does not forward events to TikTok. Do not claim that it does.

## Shared SKAN schema

NurseMind's existing `SKANAttributionService` remains the sole conversion-value writer, independent of ATT. TikTok and Meta must interpret the same values:

| Value | Meaning | Coarse value |
| --- | --- | --- |
| 0 | No recorded app event | None |
| 1 | App opened in the current window | Low |
| 2 | Trial started | Medium |
| 3 | First paid purchase | High |

Windows: days 0–2, 3–7, and 8–35; no early locking. These values represent events, not currency or ROAS. A three-day trial normally converts in window two. See `META_ADS_SETUP.md` for the existing window/state logic. Do not replace this with TikTok's default schema or enable a second SDK updater.

TikTok's official guidance says to keep its updater disabled and upload the matching schema when another non-MMP component owns conversion values. Test-mode events are separate from production reporting. [TikTok SDK integration guide](https://ads.tiktok.com/resources/help/article/how-to-integrate-tiktok-app-events-sdk), [SKAN 4 guidance](https://ads.tiktok.com/resources/help/article/about-skan-4-0-and-tiktok).

## Dashboard status and next checks

Signed into NurseMind's TikTok account and selected `NurseMind_adv` (`7641979134956224529`). TikTok requires two-step verification before allowing access. The user explicitly deferred dashboard work; no account-security settings, event mappings, ad campaigns, or budgets were changed.

After the user completes two-step verification:

1. Open Events Manager and verify the existing NurseMind app destination against the app's credentials. Do not create a duplicate app.
2. Publish/read back the exact shared fine/coarse SKAN mapping above.
3. On a physical DEBUG test build, grant ATT and verify Checkout, zero-value StartTrial, and a verified paid Purchase with amount/currency in Test Events. Exercise cancellation and restore to confirm no extra Purchase. Revoke ATT and verify events stop. Do not fabricate production purchases.
4. Implement/verify consent-aware server lifecycle delivery before relying on trial conversions without app reopen or renewal revenue.
5. Release the tested app, verify legitimate production Purchase delivery, then select Purchase as the campaign optimization event where TikTok makes it eligible. No campaign was launched in this task.

## Local validation

- 27 focused tests passed: 14 TikTok, 5 Meta, and 8 SKAN. Coverage includes consent gating/revocation, initialization failure and consent changes during initialization, account switching, stable transaction deduplication across restart, actual paid amounts/currencies, zero-revenue trials, three-day conversion after restart, stale/restored/ineligible/malformed payment rejection, missing-price recovery, foreground/background handling, and refresh expiry.
- Release ARM64 simulator app build passed with two build jobs. The initial dual-architecture build was stopped for memory pressure; no project build settings were changed.
- Focused diff whitespace checks passed. The configured Apple app ID matches NurseMind (`6767489231`); all TikTok credentials are populated. Their live validity was not verified.
- Logs: `/tmp/nursemind-tiktok-tests.log` and `/tmp/nursemind-tiktok-release.log`.
- No physical-device purchase test, live event-delivery verification, backend deployment, commit, push, or App Store release was performed.


## Server delivery follow-up

The user requested continuing server-side tracking after the app fixes. Inspection confirmed that the existing RevenueCat webhook updates entitlements but does not forward TikTok events. TikTok's SDK maintainer directed developers to request App Events API allowlisting on August 4, 2026; NurseMind's own access remains unverified because the advertiser account still requires two-step verification. Prepared `TIKTOK_SERVER_ACCESS_REQUEST.md` with the exact account/app identifiers, questions about SDK/API coexistence and deduplication, and implementation requirements. No support message was sent. Existing tested SDK behavior and production subscription handling remain intact; no server delivery was enabled or claimed.
