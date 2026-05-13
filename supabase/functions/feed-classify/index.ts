// =============================================================================
// feed-classify — Haiku classification of pending Feed items.
//
// Assigns category / specialties / nclex_areas / priority. Run after
// feed-author and feed-verify; the result is stored on feed_items so
// feed-publish can route urgent items differently and the iOS app can
// filter by specialty / NCLEX area.
//
// Scoped to items in review_state='pending_review' with no specialty
// classification yet (`specialties = '{}'`). Items with an existing
// classification aren't re-touched — re-running is idempotent.
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"
import { callAnthropic, extractJson, MODEL_HAIKU } from "../_shared/anthropic.ts"
import { CLASSIFY_SYSTEM, classifyUserPayload } from "../_shared/prompts.ts"

const MAX_ITEMS = Number(Deno.env.get("FEED_CLASSIFY_MAX_ITEMS") ?? "15")

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

const VALID_CATEGORIES = new Set([
    "drug_safety", "clinical_guideline", "public_health",
    "medication_safety", "licensure", "research",
])

const VALID_SPECIALTIES = new Set([
    "icu", "ed", "peds", "med_surg", "ob", "mental_health",
    "oncology", "perioperative", "geriatric", "home_health",
])

const VALID_NCLEX = new Set([
    "safe_effective_care_environment",
    "health_promotion_maintenance",
    "psychosocial_integrity",
    "physiological_integrity",
])

type ClassifyOutput = {
    category: string
    specialties: string[]
    nclex_areas: string[]
    priority: "urgent" | "standard"
}

type FeedItemRow = {
    id: string
    headline: string
    why_nurses_care: string
    body: string
}

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS_HEADERS })
    if (req.method !== "POST")    return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))       return jsonError(401, "Unauthorized — service_role required")

    const items = await fetchUnclassified()
    let totalIn = 0
    let totalOut = 0
    const results = []

    for (const item of items) {
        const r = await classifyItem(item)
        results.push(r)
        if (r.input_tokens)  totalIn  += r.input_tokens
        if (r.output_tokens) totalOut += r.output_tokens
    }

    return jsonResponse(200, {
        ok: true,
        classified: results.length,
        results,
        totalInputTokens: totalIn,
        totalOutputTokens: totalOut,
        elapsedMs: Date.now() - startedAt,
    })
})

async function fetchUnclassified(): Promise<FeedItemRow[]> {
    const admin = adminClient()
    // PostgREST quirk: filtering "specialties array equals empty array" via
    // .eq("specialties", "{}") doesn't work cleanly; use .is.eq.{} or the
    // cardinality filter via RPC. Simpler: read pending_review items and
    // filter client-side.
    const { data, error } = await admin
        .from("feed_items")
        .select("id, headline, why_nurses_care, body, specialties")
        .eq("review_state", "pending_review")
        .order("ingested_at", { ascending: true })
        .limit(MAX_ITEMS * 2)

    if (error) {
        console.error("fetchUnclassified failed", error)
        return []
    }

    return (data ?? [])
        .filter((row) => Array.isArray(row.specialties) && row.specialties.length === 0)
        .slice(0, MAX_ITEMS)
        .map((row) => ({
            id: row.id,
            headline: row.headline,
            why_nurses_care: row.why_nurses_care,
            body: row.body,
        }))
}

async function classifyItem(item: FeedItemRow): Promise<{
    feed_item_id: string
    classified: boolean
    category?: string
    priority?: string
    error?: string
    input_tokens?: number
    output_tokens?: number
}> {
    let output: ClassifyOutput
    let usage = { input_tokens: 0, output_tokens: 0 }
    try {
        const result = await callAnthropic({
            model: MODEL_HAIKU,
            max_tokens: 300,
            temperature: 0.0,
            system: CLASSIFY_SYSTEM,
            messages: [{
                role: "user",
                content: classifyUserPayload({
                    headline: item.headline,
                    why_nurses_care: item.why_nurses_care,
                    body: item.body,
                }),
            }],
        })
        usage = result.usage
        output = extractJson<ClassifyOutput>(result.text)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        return {
            feed_item_id: item.id,
            classified: false,
            error: `classify: ${message}`,
            input_tokens: usage.input_tokens,
            output_tokens: usage.output_tokens,
        }
    }

    // Enum sanitization — the DB CHECK constraint will reject bad enum values,
    // but it's cheaper to drop them client-side than burn a constraint error.
    const category    = VALID_CATEGORIES.has(output.category) ? output.category : null
    const specialties = (output.specialties ?? []).filter((s) => VALID_SPECIALTIES.has(s))
    const nclex_areas = (output.nclex_areas ?? []).filter((n) => VALID_NCLEX.has(n))
    const priority    = output.priority === "urgent" ? "urgent" : "standard"

    if (!category) {
        return {
            feed_item_id: item.id,
            classified: false,
            error: `classify: invalid category "${output.category}"`,
            input_tokens: usage.input_tokens,
            output_tokens: usage.output_tokens,
        }
    }

    const admin = adminClient()
    const { error: updateErr } = await admin
        .from("feed_items")
        .update({ category, specialties, nclex_areas, priority })
        .eq("id", item.id)

    if (updateErr) {
        return {
            feed_item_id: item.id,
            classified: false,
            error: `update: ${updateErr.message}`,
            input_tokens: usage.input_tokens,
            output_tokens: usage.output_tokens,
        }
    }

    return {
        feed_item_id: item.id,
        classified: true,
        category,
        priority,
        input_tokens: usage.input_tokens,
        output_tokens: usage.output_tokens,
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
    return new Response(JSON.stringify(body), {
        status,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
    })
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { ok: false, error: message })
}
