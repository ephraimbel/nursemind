// =============================================================================
// feed-verify — Haiku faithfulness check + clinical-safety regex re-validation.
//
// Pipeline position: runs after feed-author. Scans feed_items where
// review_state='pending_review' AND faithfulness_passed=false. For each one,
// calls Haiku to compare the body against the source excerpt. If faithful,
// flips faithfulness_passed=true. Otherwise leaves it false, so feed-publish
// won't promote it.
//
// Also re-runs the clinical-safety regex from _shared/safety.ts as a
// defense-in-depth check — feed-author already runs it, but running it
// again here means if author was bypassed or regex patterns were updated
// between the two stages, items still get gated.
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"
import { callAnthropic, extractJson, MODEL_HAIKU } from "../_shared/anthropic.ts"
import { VERIFY_SYSTEM, verifyUserPayload } from "../_shared/prompts.ts"
import { checkCitations, checkClinicalSafety } from "../_shared/safety.ts"

const MAX_ITEMS = Number(Deno.env.get("FEED_VERIFY_MAX_ITEMS") ?? "10")

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

type VerifyOutput = {
    faithful: boolean
    issues: Array<{ claim: string; reason: string }>
}

type FeedItemRow = {
    id: string
    source: string
    source_url: string
    headline: string
    why_nurses_care: string
    body: string
}

type IngestRow = {
    feed_item_id: string
    source_title: string
    source_excerpt: string | null
}

type ItemResult = {
    feed_item_id: string
    faithful: boolean
    safety_passed: boolean
    issues?: VerifyOutput["issues"]
    input_tokens?: number
    output_tokens?: number
    error?: string
}

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") return new Response(null, { status: 204, headers: CORS_HEADERS })
    if (req.method !== "POST")    return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))       return jsonError(401, "Unauthorized — service_role required")

    const items = await fetchPendingItems()
    const results: ItemResult[] = []
    let totalIn = 0
    let totalOut = 0

    for (const item of items) {
        const result = await verifyItem(item)
        results.push(result)
        if (result.input_tokens)  totalIn  += result.input_tokens
        if (result.output_tokens) totalOut += result.output_tokens
    }

    return jsonResponse(200, {
        ok: true,
        verified: results.length,
        results,
        totalInputTokens: totalIn,
        totalOutputTokens: totalOut,
        elapsedMs: Date.now() - startedAt,
    })
})

async function fetchPendingItems(): Promise<FeedItemRow[]> {
    const admin = adminClient()
    const { data, error } = await admin
        .from("feed_items")
        .select("id, source, source_url, headline, why_nurses_care, body")
        .eq("review_state", "pending_review")
        .eq("faithfulness_passed", false)
        .order("ingested_at", { ascending: true })
        .limit(MAX_ITEMS)

    if (error) {
        console.error("fetch pending items failed", error)
        return []
    }
    return (data ?? []) as FeedItemRow[]
}

async function verifyItem(item: FeedItemRow): Promise<ItemResult> {
    const admin = adminClient()

    // Pull the source excerpt from the queue row so the Haiku call has the
    // ground-truth text to compare against.
    const { data: queueRow } = await admin
        .from("feed_ingest_queue")
        .select("feed_item_id, source_title, source_excerpt")
        .eq("feed_item_id", item.id)
        .single<IngestRow>()

    if (!queueRow) {
        return {
            feed_item_id: item.id,
            faithful: false,
            safety_passed: false,
            error: "queue row not found for verification — source excerpt unavailable",
        }
    }

    // Defense-in-depth: re-run safety regex even though author already did.
    // If regex patterns were updated between author and verify, we want to
    // catch items that slipped through.
    const citations = checkCitations(item.body)
    const safety    = checkClinicalSafety(`${item.headline} ${item.why_nurses_care} ${item.body}`)
    const safetyPassed = citations.passed && safety.passed

    let verifyOutput: VerifyOutput
    let usage = { input_tokens: 0, output_tokens: 0 }
    try {
        const result = await callAnthropic({
            model: MODEL_HAIKU,
            max_tokens: 500,
            temperature: 0.0,
            system: VERIFY_SYSTEM,
            messages: [{
                role: "user",
                content: verifyUserPayload({
                    sourceTitle:   queueRow.source_title,
                    sourceUrl:     item.source_url,
                    sourceExcerpt: queueRow.source_excerpt ?? "",
                    body:          item.body,
                }),
            }],
        })
        usage = result.usage
        verifyOutput = extractJson<VerifyOutput>(result.text)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        // Leave faithfulness flag as-is (false); item stays in pending_review.
        await admin
            .from("feed_items")
            .update({ safety_regex_passed: safetyPassed })
            .eq("id", item.id)
        return {
            feed_item_id: item.id,
            faithful: false,
            safety_passed: safetyPassed,
            error: `verify: ${message}`,
            input_tokens: usage.input_tokens,
            output_tokens: usage.output_tokens,
        }
    }

    await admin
        .from("feed_items")
        .update({
            faithfulness_passed: verifyOutput.faithful,
            safety_regex_passed: safetyPassed,
        })
        .eq("id", item.id)

    return {
        feed_item_id: item.id,
        faithful: verifyOutput.faithful,
        safety_passed: safetyPassed,
        issues: verifyOutput.issues,
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
