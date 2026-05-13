// =============================================================================
// feed-notify — Send APNs push for urgent published items.
//
// Pipeline position: runs after feed-publish. Looks for feed_items where
// review_state='auto_published' AND priority='urgent' AND published_at >
// (now - notification_window). For each user with notifications_enabled and
// outside their quiet_hours window, sends a single APNs push per item.
//
// STATUS: scaffold only. APNs requires:
//   - .p8 auth key from ASC ("Keys" section)
//   - Key ID
//   - Team ID (LRDHWBMA87 per project.yml)
//   - Bundle ID (app.nursemind.ios)
//   - Device token table populated by iOS app on first launch
//
// None of those are wired yet. Document the integration shape and emit the
// notification queue, but don't actually call APNs. When ready:
//   1. Generate .p8 key in ASC, set APNS_AUTH_KEY_P8, APNS_KEY_ID, APNS_TEAM_ID
//   2. Add migration for device_tokens table (user_id, token, env, last_seen_at)
//   3. Add iOS code to register for remote notifications + write token to table
//   4. Replace the simulated dispatch with a real JWT-signed HTTP/2 call to
//      api.push.apple.com (Deno doesn't have HTTP/2 natively — likely use
//      apns2 npm via esm.sh, or proxy through a Cloudflare Worker that has
//      first-class HTTP/2).
//
// Until APNs is live: this function logs would-have-pushed items and writes
// to a feed_notification_log table (also pending migration) for offline
// debugging.
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"

const NOTIFICATION_WINDOW_MINUTES = Number(Deno.env.get("FEED_NOTIFY_WINDOW_MIN") ?? "120")

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

type UrgentItem = {
    id: string
    headline: string
    why_nurses_care: string
    category: string
    specialties: string[]
    published_at: string
}

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS_HEADERS })
    if (req.method !== "POST")    return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))       return jsonError(401, "Unauthorized — service_role required")

    const admin = adminClient()

    const cutoff = new Date(Date.now() - NOTIFICATION_WINDOW_MINUTES * 60_000).toISOString()
    const { data, error } = await admin
        .from("feed_items")
        .select("id, headline, why_nurses_care, category, specialties, published_at")
        .eq("review_state", "auto_published")
        .eq("priority", "urgent")
        .gt("published_at", cutoff)
        .order("published_at", { ascending: false })

    if (error) {
        return jsonError(500, `fetch: ${error.message}`)
    }

    const items = (data ?? []) as UrgentItem[]

    // SCAFFOLD: real implementation would now query device_tokens joined with
    // profiles (notifications_enabled, specialty, quiet_hours), then dispatch
    // an APNs push per (item, eligible_user). For now we just report what
    // would have been pushed.
    const simulated = items.map((item) => ({
        feed_item_id: item.id,
        headline: item.headline,
        why_nurses_care: item.why_nurses_care,
        published_at: item.published_at,
        would_push: true,
        note: "APNs not yet wired — see file header",
    }))

    return jsonResponse(200, {
        ok: true,
        scaffold: true,
        urgentItemsInWindow: simulated.length,
        items: simulated,
        elapsedMs: Date.now() - startedAt,
    })
})

function isAuthorized(req: Request): boolean {
    const expected = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
    const header = req.headers.get("authorization") ?? ""
    if (!expected) return false
    if (!header.toLowerCase().startsWith("bearer ")) return false
    const token = header.slice("bearer ".length).trim()
    if (token.length !== expected.length) return false
    let diff = 0
    for (let i = 0; i < token.length; i++) diff |= token.charCodeAt(i) ^ expected.charCodeAt(i)
    return diff === 0
}

function jsonResponse(status: number, body: unknown): Response {
    return new Response(JSON.stringify(body), {
        status,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
    })
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { ok: false, error: message })
}
