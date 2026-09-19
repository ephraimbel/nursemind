// =============================================================================
// feed-notify — the one daily push, at shift start, only when personal.
//
// Runs hourly (pg_cron, see migration 0015). Each run:
//   1. DIGEST: for users with push_digest_enabled whose shift_start_local in
//      their tz falls in this hour, count this week's unread stories and the
//      stories touching their saved entries. Nothing to say → no push.
//      One digest per user per day (feed_notification_log dedupe index).
//   2. URGENT: for urgent stories published in the last 24h, push to users
//      with push_urgent_enabled whose saved entries the story touches. One
//      per user per item per day. Never to everyone.
//
// Payloads carry counts only; no headline ever reaches the lock screen.
// Body options: { "dry_run": true } reports decisions without sending or
// logging; { "now": "<ISO>" } overrides the clock for verification.
// Requires APNS_AUTH_KEY_P8 / APNS_KEY_ID / APNS_TEAM_ID unless dry_run.
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"
import { APNSEnv, APNSPayload, credentialsFromEnv, sendPush } from "../_shared/apns.ts"
import {
    assertLockScreenSafe, decideDigest, DigestUser, isCaseStale, isShiftHour, urgentBody, urgentRecipients, WeekItem,
} from "../_shared/push-digest.ts"

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

const MAX_USERS_PER_RUN = Number(Deno.env.get("FEED_NOTIFY_MAX_USERS") ?? "2000")

type Options = { dry_run?: boolean; now?: string }
type ProfileRow = {
    id: string
    shift_start_local: string
    tz: string
    pinned_entry_ids: string[]
    push_digest_enabled: boolean
    push_urgent_enabled: boolean
    notifications_enabled: boolean
}
type TokenRow = { user_id: string; token: string; env: APNSEnv }
type Send = { user_id: string; kind: "digest" | "urgent"; body: string; deep_link: string; feed_item_id: string | null; hits: number; unread: number }

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()
    if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS_HEADERS })
    if (req.method !== "POST")    return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))       return jsonError(401, "Unauthorized — service_role required")

    const options = await readOptions(req)
    const now = options.now ? new Date(options.now) : new Date()
    const dryRun = options.dry_run === true
    const creds = credentialsFromEnv()
    if (!dryRun && !creds) return jsonError(500, "APNS_AUTH_KEY_P8 / APNS_KEY_ID / APNS_TEAM_ID not set")

    const admin = adminClient()

    // Users who opted in to anything. Master switch must be on too.
    const { data: profileRows, error: profileErr } = await admin
        .from("profiles")
        .select("id, shift_start_local, tz, pinned_entry_ids, push_digest_enabled, push_urgent_enabled, notifications_enabled")
        .eq("notifications_enabled", true)
        .or("push_digest_enabled.eq.true,push_urgent_enabled.eq.true")
        .limit(MAX_USERS_PER_RUN)
    if (profileErr) return jsonError(500, `profiles: ${profileErr.message}`)
    const profiles = (profileRows ?? []) as ProfileRow[]

    // This week's visible stories, once.
    const weekAgo = new Date(now.getTime() - 7 * 86_400_000).toISOString()
    const { data: itemRows, error: itemErr } = await admin
        .from("feed_items_visible")
        .select("id, related_entry_ids, priority, published_at")
        .gte("published_at", weekAgo)
    if (itemErr) return jsonError(500, `feed_items: ${itemErr.message}`)
    const weekItems = (itemRows ?? []).map((r) => ({
        id: r.id as string,
        related_entry_ids: (r.related_entry_ids ?? []) as string[],
        priority: r.priority as "urgent" | "standard",
        published_at: r.published_at as string,
    })) as WeekItem[]

    // ---- 1. Digest candidates (shift hour only) -----------------------------
    const inHour = profiles.filter((p) => p.push_digest_enabled && isShiftHour(toDigestUser(p), now))

    const readByUser = await readSets(admin, inHour.map((p) => p.id), weekItems.map((i) => i.id))
    const lastCaseByUser = await lastCaseAnswers(admin, inHour.map((p) => p.id))
    const sends: Send[] = []
    for (const p of inHour) {
        // R4 hook: a user who has not answered a daily case in a week hears
        // about today's in the same digest (opt-in via the digest toggle,
        // no separate switch). Unknown history (table not yet migrated)
        // counts as recent, so the hook never fires on a guess.
        const caseStale = lastCaseByUser.has(p.id) ? isCaseStale(lastCaseByUser.get(p.id) ?? null, now) : false
        const decision = decideDigest(toDigestUser(p), weekItems, readByUser.get(p.id) ?? new Set(), now, caseStale)
        if (!decision.send || !decision.body) continue
        sends.push({
            user_id: p.id, kind: "digest", body: decision.body,
            deep_link: decision.deep_link,
            feed_item_id: null, hits: decision.hits, unread: decision.unread,
        })
    }

    // ---- 2. Urgent stories from the last 24h --------------------------------
    const dayAgo = now.getTime() - 24 * 3_600_000
    const urgentItems = weekItems.filter((i) => i.priority === "urgent" && new Date(i.published_at).getTime() >= dayAgo)
    const urgentUsers = profiles.filter((p) => p.push_urgent_enabled)
    for (const item of urgentItems) {
        for (const userID of urgentRecipients(item, urgentUsers.map((p) => ({ user_id: p.id, pinned_entry_ids: p.pinned_entry_ids ?? [] })))) {
            sends.push({
                user_id: userID, kind: "urgent", body: urgentBody(),
                deep_link: `nursemind://feed?item=${item.id}`,
                feed_item_id: item.id, hits: 1, unread: 0,
            })
        }
    }

    for (const s of sends) assertLockScreenSafe(s.body)

    if (dryRun) {
        return jsonResponse(200, {
            ok: true, dry_run: true, now: now.toISOString(),
            profiles: profiles.length, digest_candidates: inHour.length, week_items: weekItems.length,
            urgent_items: urgentItems.length, would_send: sends, elapsedMs: Date.now() - startedAt,
        })
    }

    // ---- 3. Log first (dedupe), then deliver --------------------------------
    const tokensByUser = await deviceTokens(admin, [...new Set(sends.map((s) => s.user_id))])
    let delivered = 0, deduped = 0, noToken = 0, failed = 0, removedTokens = 0
    const errors: string[] = []

    for (const s of sends) {
        const tokens = tokensByUser.get(s.user_id) ?? []
        if (tokens.length === 0) { noToken++; continue }

        const { data: logRow, error: logErr } = await admin
            .from("feed_notification_log")
            .insert({ user_id: s.user_id, feed_item_id: s.feed_item_id, kind: s.kind, watchlist_hits: s.hits, unread_count: s.unread })
            .select("id")
            .single()
        if (logErr) {
            // 23505 = already sent today for this (user, kind, item)
            if (logErr.code === "23505") deduped++
            else errors.push(`log ${s.user_id}: ${logErr.message}`)
            continue
        }

        const payload: APNSPayload = {
            aps: { alert: { title: "NurseMind", body: s.body }, sound: "default", "thread-id": "feed", "interruption-level": "active" },
            deep_link: s.deep_link, kind: s.kind, log_id: logRow.id as string,
        }
        let anyOK = false
        for (const t of tokens) {
            const result = await sendPush(creds!, t.token, t.env, payload, `${s.kind}:${s.user_id}:${s.feed_item_id ?? "digest"}`)
            if (result.ok) { anyOK = true; continue }
            if (result.unregistered) {
                await admin.from("device_tokens").delete().eq("token", t.token)
                removedTokens++
            } else {
                errors.push(`apns ${t.env} ${result.status} ${result.reason}`)
            }
        }
        if (anyOK) delivered++
        else {
            failed++
            // Nothing reached a device: release the dedupe slot so the next run may retry.
            await admin.from("feed_notification_log").delete().eq("id", logRow.id)
        }
    }

    return jsonResponse(200, {
        ok: true, now: now.toISOString(), profiles: profiles.length, digest_candidates: inHour.length,
        planned: sends.length, delivered, deduped, no_token: noToken, failed, removed_tokens: removedTokens,
        errors, elapsedMs: Date.now() - startedAt,
    })
})

function toDigestUser(p: ProfileRow): DigestUser {
    return { user_id: p.id, shift_start_local: p.shift_start_local, tz: p.tz, pinned_entry_ids: p.pinned_entry_ids ?? [] }
}

// deno-lint-ignore no-explicit-any
async function readSets(admin: any, userIDs: string[], itemIDs: string[]): Promise<Map<string, Set<string>>> {
    const map = new Map<string, Set<string>>()
    if (userIDs.length === 0 || itemIDs.length === 0) return map
    const { data, error } = await admin
        .from("feed_user_state")
        .select("user_id, item_id")
        .in("user_id", userIDs)
        .in("item_id", itemIDs)
        .not("read_at", "is", null)
    if (error) throw new Error(`feed_user_state: ${error.message}`)
    for (const row of (data ?? []) as { user_id: string; item_id: string }[]) {
        if (!map.has(row.user_id)) map.set(row.user_id, new Set())
        map.get(row.user_id)!.add(row.item_id)
    }
    return map
}

/// Most recent micro_case_answers.answered_on per user. Users with no row
/// map to null. If the table is missing (migration 0016 not applied) the
/// map is empty and the case hook stays off.
// deno-lint-ignore no-explicit-any
async function lastCaseAnswers(admin: any, userIDs: string[]): Promise<Map<string, string | null>> {
    const map = new Map<string, string | null>()
    if (userIDs.length === 0) return map
    const { data, error } = await admin
        .from("micro_case_answers")
        .select("user_id, answered_on")
        .in("user_id", userIDs)
        .order("answered_on", { ascending: false })
    if (error) {
        console.warn("micro_case_answers unavailable; case hook disabled:", error.message)
        return map
    }
    for (const id of userIDs) map.set(id, null)
    for (const row of (data ?? []) as { user_id: string; answered_on: string }[]) {
        if (map.get(row.user_id) === null) map.set(row.user_id, row.answered_on)
    }
    return map
}

// deno-lint-ignore no-explicit-any
async function deviceTokens(admin: any, userIDs: string[]): Promise<Map<string, TokenRow[]>> {
    const map = new Map<string, TokenRow[]>()
    if (userIDs.length === 0) return map
    const { data, error } = await admin.from("device_tokens").select("user_id, token, env").in("user_id", userIDs)
    if (error) throw new Error(`device_tokens: ${error.message}`)
    for (const row of (data ?? []) as TokenRow[]) {
        if (!map.has(row.user_id)) map.set(row.user_id, [])
        map.get(row.user_id)!.push(row)
    }
    return map
}

async function readOptions(req: Request): Promise<Options> {
    try {
        const body = await req.json()
        return body && typeof body === "object" ? body as Options : {}
    } catch {
        return {}
    }
}

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
    return new Response(JSON.stringify(body), { status, headers: { ...CORS_HEADERS, "content-type": "application/json" } })
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { ok: false, error: message })
}
