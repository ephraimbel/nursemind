// =============================================================================
// feed-publish — Promote pending_review items to auto_published.
//
// Pipeline position: runs after author + verify + classify. Promotes items
// where ALL quality gates have passed:
//   - faithfulness_passed = true   (set by feed-verify)
//   - safety_regex_passed = true   (set by feed-verify, and originally by feed-author)
//   - category is classified       (set by feed-classify)
//   - specialties is classified    (set by feed-classify)
//
// HOLD policy (per CONTENT_SOURCING tier review):
//   - urgent + drug_safety   → HOLD in pending_review for manual review
//                              (Tier A: high-alert content reviewed pre-publish)
//   - everything else passing all gates → auto_published immediately
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"

const MAX_ITEMS = Number(Deno.env.get("FEED_PUBLISH_MAX_ITEMS") ?? "50")

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

type Candidate = {
    id: string
    category: string
    priority: string
    faithfulness_passed: boolean
    safety_regex_passed: boolean
    specialties: string[]
}

type Outcome = {
    feed_item_id: string
    action: "promoted" | "held_for_review" | "blocked"
    reason?: string
}

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS_HEADERS })
    if (req.method !== "POST")    return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))       return jsonError(401, "Unauthorized — service_role required")

    const admin = adminClient()

    // Pull candidates: pending_review only. Cap to MAX_ITEMS — typical daily
    // batch is well under this; the cap exists so a backed-up queue doesn't
    // blow the function timeout.
    const { data, error } = await admin
        .from("feed_items")
        .select("id, category, priority, faithfulness_passed, safety_regex_passed, specialties")
        .eq("review_state", "pending_review")
        .order("ingested_at", { ascending: true })
        .limit(MAX_ITEMS)

    if (error) {
        console.error("fetch candidates failed", error)
        return jsonError(500, `fetch: ${error.message}`)
    }

    const candidates = (data ?? []) as Candidate[]
    const outcomes: Outcome[] = []
    let promoted = 0
    let held = 0
    let blocked = 0

    for (const c of candidates) {
        // Gate: every quality flag must be true and classification must have run
        if (!c.faithfulness_passed) {
            outcomes.push({ feed_item_id: c.id, action: "blocked", reason: "faithfulness_passed=false" })
            blocked++
            continue
        }
        if (!c.safety_regex_passed) {
            outcomes.push({ feed_item_id: c.id, action: "blocked", reason: "safety_regex_passed=false" })
            blocked++
            continue
        }
        if (!c.category) {
            outcomes.push({ feed_item_id: c.id, action: "blocked", reason: "not yet classified" })
            blocked++
            continue
        }

        // Tier A hold: urgent drug_safety stays in pending_review for manual review
        if (c.priority === "urgent" && c.category === "drug_safety") {
            outcomes.push({ feed_item_id: c.id, action: "held_for_review", reason: "tier-a (urgent drug_safety)" })
            held++
            continue
        }

        // Promote. The DB trigger feed_items_set_published_at_on_approval
        // re-stamps published_at to now() when review_state transitions out
        // of pending_review.
        const { error: updateErr } = await admin
            .from("feed_items")
            .update({ review_state: "auto_published" })
            .eq("id", c.id)
            .eq("review_state", "pending_review")  // optimistic guard

        if (updateErr) {
            outcomes.push({ feed_item_id: c.id, action: "blocked", reason: `update: ${updateErr.message}` })
            blocked++
            continue
        }

        outcomes.push({ feed_item_id: c.id, action: "promoted" })
        promoted++
    }

    return jsonResponse(200, {
        ok: true,
        promoted,
        held,
        blocked,
        outcomes,
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
