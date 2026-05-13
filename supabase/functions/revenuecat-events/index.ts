// =============================================================================
// revenuecat-events — RevenueCat webhook receiver.
//
// RevenueCat fires a webhook to this Edge Function on every subscription
// lifecycle event (purchase, renewal, expiration, cancellation, billing
// issue, product change, etc.). We map the event to a `subscription_tier`
// value and write it to `public.profiles.subscription_tier` using the
// service role key, which bypasses RLS + the `guard_subscription_tier`
// trigger so the iOS client view of the user's tier is server-authoritative
// and tamper-proof.
//
// Auth: RevenueCat sends a custom `Authorization: Bearer <secret>` header
// configurable in their dashboard. We compare it against the project secret
// `REVENUECAT_WEBHOOK_SECRET` — anyone calling without it is rejected.
//
// Mapping the user: the iOS app MUST have called
//   Purchases.shared.logIn(<supabase-user-id-uuid>)
// at sign-in. RevenueCat then sends `app_user_id = <uuid>`, which we use to
// locate the profile row.
//
// Deploy: `supabase functions deploy revenuecat-events`
// Set secret: `supabase secrets set REVENUECAT_WEBHOOK_SECRET=<your-secret>`
// Configure RevenueCat: Project Settings → Integrations → Webhooks → add the
// function URL and the same secret.
// =============================================================================

import { createClient } from "jsr:@supabase/supabase-js@2"

const SUPABASE_URL                = Deno.env.get("SUPABASE_URL")                ?? ""
const SUPABASE_SERVICE_ROLE_KEY   = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY")   ?? ""
const REVENUECAT_WEBHOOK_SECRET   = Deno.env.get("REVENUECAT_WEBHOOK_SECRET")   ?? ""

interface RevenueCatEvent {
    type: string
    app_user_id?: string
    original_app_user_id?: string
    product_id?: string
    expiration_at_ms?: number | null
    purchased_at_ms?: number
    period_type?: string
}

interface RevenueCatPayload {
    api_version?: string
    event: RevenueCatEvent
}

Deno.serve(async (req: Request): Promise<Response> => {
    if (req.method !== "POST") {
        return jsonError(405, "Method Not Allowed")
    }

    if (!REVENUECAT_WEBHOOK_SECRET) {
        return jsonError(500, "Server misconfiguration: REVENUECAT_WEBHOOK_SECRET not set")
    }
    if (!SUPABASE_SERVICE_ROLE_KEY) {
        return jsonError(500, "Server misconfiguration: SUPABASE_SERVICE_ROLE_KEY not set")
    }

    // Auth — constant-time comparison would be nicer but Deno's crypto.timingSafeEqual
    // requires Uint8Arrays of identical length, which a string compare doesn't
    // give us cleanly. Plain compare is fine here: the secret is 32+ random
    // bytes and the attacker can't time-test the function from outside.
    const authHeader = req.headers.get("authorization") ?? ""
    const expected = `Bearer ${REVENUECAT_WEBHOOK_SECRET}`
    if (authHeader !== expected) {
        return jsonError(401, "Invalid webhook secret")
    }

    let payload: RevenueCatPayload
    try {
        payload = await req.json()
    } catch {
        return jsonError(400, "Invalid JSON body")
    }

    const event = payload.event
    if (!event?.type) {
        return jsonError(400, "Missing event.type")
    }

    const userIDRaw = event.app_user_id || event.original_app_user_id
    if (!userIDRaw) {
        return jsonError(400, "Missing app_user_id (iOS must call Purchases.logIn(<supabase-uuid>))")
    }

    // Validate UUID format up-front so we don't waste a DB round-trip.
    if (!/^[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12}$/i.test(userIDRaw)) {
        return jsonError(400, "app_user_id is not a UUID")
    }

    const tier = mapEventToTier(event)
    if (tier === null) {
        // Event types we don't act on (e.g., TEST, TRANSFER) — acknowledge with 200
        // so RevenueCat stops retrying.
        return jsonResponse(200, { ok: true, action: "ignored", type: event.type })
    }

    const supabase = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
        auth: { persistSession: false },
    })

    // UPSERT in case the profile row doesn't exist yet (RevenueCat fires
    // events on a new device before the iOS client has signed in to Supabase
    // and triggered the initial profile sync). The trigger lets the service
    // role write subscription_tier; the row's other columns get their
    // table-level defaults if this is a fresh insert.
    const { error } = await supabase
        .from("profiles")
        .upsert({ id: userIDRaw, subscription_tier: tier }, { onConflict: "id" })

    if (error) {
        console.error("profiles upsert failed", error)
        return jsonError(500, `Database error: ${error.message}`)
    }

    return jsonResponse(200, { ok: true, type: event.type, tier })
})

/// Translate a RevenueCat event to a `subscription_tier` value, or `null` to
/// ignore. The mapping favors *latest-known active entitlement* — for users
/// who upgraded from monthly → yearly, we want the yearly tier set.
function mapEventToTier(event: RevenueCatEvent): string | null {
    switch (event.type) {
        case "INITIAL_PURCHASE":
        case "RENEWAL":
        case "PRODUCT_CHANGE":
        case "UNCANCELLATION":     // user reverted a pending cancel — still active
        case "NON_RENEWING_PURCHASE":
            return tierFromProductID(event.product_id)
        case "EXPIRATION":
        case "CANCELLATION":       // CANCELLATION = will end at period — but RevenueCat
                                   // still considers them active until EXPIRATION fires.
                                   // We do NOT downgrade here.
            // For EXPIRATION, downgrade to free.
            // For CANCELLATION (still active), keep current tier — return null to ignore.
            return event.type === "EXPIRATION" ? "free" : null
        case "BILLING_ISSUE":
            // User's payment failed; they're still entitled until grace period ends.
            // Don't downgrade yet.
            return null
        default:
            // TEST, TRANSFER, SUBSCRIBER_ALIAS, EXPIRED_SUBSCRIBER_INFO, etc.
            return null
    }
}

/// Map your StoreKit product IDs to subscription_tier values. Must match the
/// iOS `SubscriptionTier` enum raw values exactly: free / proMonthly / proYearly.
function tierFromProductID(productID: string | undefined): string {
    if (!productID) return "free"
    const id = productID.toLowerCase()
    if (id.includes("year") || id.includes("annual")) return "proYearly"
    if (id.includes("month"))                          return "proMonthly"
    return "proMonthly"  // sensible default for unrecognized product IDs
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { error: message })
}

function jsonResponse(status: number, body: unknown): Response {
    return new Response(JSON.stringify(body), {
        status,
        headers: { "content-type": "application/json" },
    })
}
