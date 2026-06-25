// =============================================================================
// feed-author — Author / Critic / Revise pipeline for queued Feed items.
//
// Pipeline position:
//   feed-ingest  → feed-ingest_queue (state='queued')
//   [THIS]       → feed_items        (review_state='pending_review')
//                  feed-ingest_queue (state='authored')
//   feed-verify  → flags faithfulness + clinical-safety
//   feed-classify→ assigns category / specialties / NCLEX / priority
//   feed-publish → promotes pending_review → auto_published
//
// Per invocation: claim up to FEED_AUTHOR_MAX_ITEMS items, run each through
// the three Sonnet passes, insert successful items into feed_items, update
// queue state. Bounded by FEED_AUTHOR_MAX_TOKENS to cap cost per run.
//
// Invocation:
//   POST /functions/v1/feed-author
//   Headers: Authorization: Bearer <service_role_key>
//   Body:    {} (no body required)
// =============================================================================

import { adminClient } from "../_shared/supabase.ts"
import { callAnthropic, extractJson, MODEL_SONNET, MODEL_HAIKU } from "../_shared/anthropic.ts"

// Model tiering (locked decision, docs/CONTENT_SOURCING.md): the ~80% of items
// that are retrieval-grounded recalls/shortages/alerts are formulaic, so author
// + critic run on Haiku (~3× cheaper). Only the revise pass — which fires solely
// when the Haiku critic flags an issue — escalates to Sonnet, where quality
// matters most. checkCitations/checkClinicalSafety are model-independent, so the
// server-enforced safety floor is unchanged regardless of authoring model.
const MODEL_AUTHOR = MODEL_HAIKU
const MODEL_CRITIC = MODEL_HAIKU
const MODEL_REVISE = MODEL_SONNET
import {
    AUTHOR_SYSTEM, authorUserPayload,
    CRITIC_SYSTEM, criticUserPayload,
    REVISE_SYSTEM, reviseUserPayload,
} from "../_shared/prompts.ts"
import { checkCitations, checkClinicalSafety } from "../_shared/safety.ts"
import { findSource } from "../_shared/sources.ts"

const MAX_ITEMS         = Number(Deno.env.get("FEED_AUTHOR_MAX_ITEMS")  ?? "5")
const MAX_ATTEMPTS      = Number(Deno.env.get("FEED_AUTHOR_MAX_ATTEMPTS") ?? "2")
const MAX_TOKENS_PER_RUN = Number(Deno.env.get("FEED_AUTHOR_MAX_TOKENS") ?? "60000")

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

type AuthorOutput = {
    refused?: boolean
    reason?: string
    headline?: string
    why_nurses_care?: string
    body?: string
    ask_followup_prompt?: string
    citations?: Array<{ n: number; source: string; url: string; quote: string }>
}

type CriticOutput = {
    overall: "pass" | "fail"
    issues: Array<{ rule: string; detail: string }>
}

type QueueRow = {
    id: string
    source: string
    source_url: string
    source_title: string
    source_excerpt: string | null
    source_published_at: string | null
    raw_payload: Record<string, unknown>
    state: string
    attempts: number
}

type ItemResult = {
    queue_id: string
    source: string
    source_url: string
    outcome: "authored" | "skipped" | "failed"
    feed_item_id?: string
    reason?: string
    passes_used?: number
    input_tokens?: number
    output_tokens?: number
}

Deno.serve(async (req: Request): Promise<Response> => {
    const startedAt = Date.now()

    if (req.method === "OPTIONS") {
        return new Response(null, { status: 204, headers: CORS_HEADERS })
    }
    if (req.method !== "POST") return jsonError(405, "Method Not Allowed")
    if (!isAuthorized(req))    return jsonError(401, "Unauthorized — service_role required")

    let totalInputTokens = 0
    let totalOutputTokens = 0
    const results: ItemResult[] = []

    for (let i = 0; i < MAX_ITEMS; i++) {
        // Cost ceiling — bail before claiming another item if we're already
        // near the per-run token budget. Token cost dominates this function;
        // the time cost is secondary.
        if (totalInputTokens + totalOutputTokens > MAX_TOKENS_PER_RUN) {
            break
        }

        const claimed = await claimNextItem()
        if (!claimed) break  // queue empty

        const result = await processItem(claimed)
        results.push(result)

        if (result.input_tokens)  totalInputTokens  += result.input_tokens
        if (result.output_tokens) totalOutputTokens += result.output_tokens
    }

    return jsonResponse(200, {
        ok: true,
        results,
        totalInputTokens,
        totalOutputTokens,
        elapsedMs: Date.now() - startedAt,
    })
})

// -----------------------------------------------------------------------------
// Claim + process
// -----------------------------------------------------------------------------

/**
 * Atomically claim the next queued item by reading then conditionally
 * updating to state='authoring'. The .eq('state', 'queued') on the UPDATE
 * is the race-condition guard — if a concurrent worker already grabbed it,
 * the update affects zero rows and we return null.
 */
async function claimNextItem(): Promise<QueueRow | null> {
    const admin = adminClient()

    // Look for 'queued' OR 'failed' with attempts under the cap. Failed items
    // are retried because the failure may have been transient (Anthropic 5xx,
    // network blip).
    const { data: candidates, error: selectErr } = await admin
        .from("feed_ingest_queue")
        .select("*")
        .or(`state.eq.queued,and(state.eq.failed,attempts.lt.${MAX_ATTEMPTS})`)
        .order("ingested_at", { ascending: true })
        .limit(1)

    if (selectErr) {
        console.error("claim select failed", selectErr)
        return null
    }
    if (!candidates || candidates.length === 0) return null

    const candidate = candidates[0] as QueueRow
    const { data: claimed, error: updateErr } = await admin
        .from("feed_ingest_queue")
        .update({
            state: "authoring",
            attempts: candidate.attempts + 1,
        })
        .eq("id", candidate.id)
        .in("state", ["queued", "failed"])
        .select()
        .single()

    if (updateErr) {
        // PGRST116 = no rows returned, meaning another worker claimed it.
        // That's expected concurrency, not an error.
        if ((updateErr as { code?: string }).code !== "PGRST116") {
            console.error("claim update failed", updateErr)
        }
        return null
    }
    return claimed as QueueRow
}

async function processItem(item: QueueRow): Promise<ItemResult> {
    const source = findSource(item.source)
    if (!source) {
        await markFailed(item.id, `Unknown source id: ${item.source}`)
        return {
            queue_id: item.id,
            source: item.source,
            source_url: item.source_url,
            outcome: "failed",
            reason: `Unknown source id: ${item.source}`,
        }
    }

    let totalIn  = 0
    let totalOut = 0
    let passesUsed = 0

    // -------- Pass 1: Author --------
    let authorOutput: AuthorOutput
    try {
        const result = await callAnthropic({
            model: MODEL_AUTHOR,
            max_tokens: 1600,
            temperature: 0.4,
            system: AUTHOR_SYSTEM,
            messages: [{
                role: "user",
                content: authorUserPayload({
                    sourceTitle: item.source_title,
                    sourceUrl: item.source_url,
                    sourceExcerpt: item.source_excerpt,
                    sourceLabel: source.label,
                    sourcePublishedAt: item.source_published_at,
                }),
            }],
        })
        totalIn  += result.usage.input_tokens
        totalOut += result.usage.output_tokens
        passesUsed = 1
        authorOutput = extractJson<AuthorOutput>(result.text)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        await markFailed(item.id, `author pass: ${message}`)
        return errorResult(item, `author pass: ${message}`, totalIn, totalOut, passesUsed)
    }

    // Author explicitly refused — terminal, mark skipped, no further retry.
    if (authorOutput.refused) {
        await markSkipped(item.id, authorOutput.reason ?? "author refused without reason")
        return {
            queue_id: item.id,
            source: item.source,
            source_url: item.source_url,
            outcome: "skipped",
            reason: authorOutput.reason ?? "author refused",
            input_tokens: totalIn,
            output_tokens: totalOut,
            passes_used: passesUsed,
        }
    }

    // -------- Pass 2: Critic --------
    let criticOutput: CriticOutput
    try {
        const result = await callAnthropic({
            model: MODEL_CRITIC,
            max_tokens: 800,
            temperature: 0.0,
            system: CRITIC_SYSTEM,
            messages: [{ role: "user", content: criticUserPayload(authorOutput) }],
        })
        totalIn  += result.usage.input_tokens
        totalOut += result.usage.output_tokens
        passesUsed = 2
        criticOutput = extractJson<CriticOutput>(result.text)
    } catch (e) {
        const message = e instanceof Error ? e.message : String(e)
        await markFailed(item.id, `critic pass: ${message}`)
        return errorResult(item, `critic pass: ${message}`, totalIn, totalOut, passesUsed)
    }

    // -------- Pass 3: Revise (only if critic flagged issues) --------
    let finalOutput: AuthorOutput = authorOutput
    if (criticOutput.overall === "fail" && criticOutput.issues.length > 0) {
        try {
            const result = await callAnthropic({
                model: MODEL_REVISE,
                max_tokens: 1600,
                temperature: 0.3,
                system: REVISE_SYSTEM,
                messages: [{
                    role: "user",
                    content: reviseUserPayload({
                        authorOutput,
                        criticIssues: criticOutput.issues,
                    }),
                }],
            })
            totalIn  += result.usage.input_tokens
            totalOut += result.usage.output_tokens
            passesUsed = 3
            finalOutput = extractJson<AuthorOutput>(result.text)

            // Revise can also legitimately refuse if a critic issue can't be
            // grounded. Treat that the same as author refusal.
            if (finalOutput.refused) {
                await markSkipped(item.id, finalOutput.reason ?? "revise refused")
                return {
                    queue_id: item.id,
                    source: item.source,
                    source_url: item.source_url,
                    outcome: "skipped",
                    reason: finalOutput.reason ?? "revise refused",
                    input_tokens: totalIn,
                    output_tokens: totalOut,
                    passes_used: passesUsed,
                }
            }
        } catch (e) {
            const message = e instanceof Error ? e.message : String(e)
            await markFailed(item.id, `revise pass: ${message}`)
            return errorResult(item, `revise pass: ${message}`, totalIn, totalOut, passesUsed)
        }
    }

    // -------- Server-side gates (post-revise) --------
    const validation = validateOutput(finalOutput)
    if (!validation.ok) {
        await markFailed(item.id, `validation: ${validation.reason}`)
        return errorResult(item, `validation: ${validation.reason}`, totalIn, totalOut, passesUsed)
    }

    const citations = checkCitations(finalOutput.body!)
    const safety = checkClinicalSafety(
        `${finalOutput.headline} ${finalOutput.why_nurses_care} ${finalOutput.body}`,
    )

    // -------- Insert feed_items --------
    const admin = adminClient()
    const { data: inserted, error: insertErr } = await admin
        .from("feed_items")
        .insert({
            source: item.source,
            source_url: item.source_url,
            source_published_at: item.source_published_at,
            headline:            finalOutput.headline,
            why_nurses_care:     finalOutput.why_nurses_care,
            body:                finalOutput.body,
            ask_followup_prompt: finalOutput.ask_followup_prompt,
            // feed-classify will overwrite these. We need *some* value for
            // category because the column is NOT NULL with a CHECK constraint;
            // the source's default_category is a safe placeholder.
            category:    source.category,
            specialties: [],
            nclex_areas: [],
            priority:    "standard",
            citations:           finalOutput.citations,
            author_passes:       passesUsed,
            faithfulness_passed: false,                  // feed-verify will set
            safety_regex_passed: citations.passed && safety.passed,
            review_state: "pending_review",
        })
        .select("id")
        .single()

    if (insertErr || !inserted) {
        const message = insertErr?.message ?? "no row returned"
        await markFailed(item.id, `insert feed_items: ${message}`)
        return errorResult(item, `insert feed_items: ${message}`, totalIn, totalOut, passesUsed)
    }

    await admin
        .from("feed_ingest_queue")
        .update({
            state: "authored",
            feed_item_id: inserted.id,
            last_error: null,
        })
        .eq("id", item.id)

    return {
        queue_id: item.id,
        source: item.source,
        source_url: item.source_url,
        outcome: "authored",
        feed_item_id: inserted.id,
        passes_used: passesUsed,
        input_tokens: totalIn,
        output_tokens: totalOut,
    }
}

// -----------------------------------------------------------------------------
// Validation + state helpers
// -----------------------------------------------------------------------------

type ValidationResult = { ok: true } | { ok: false; reason: string }

function validateOutput(o: AuthorOutput): ValidationResult {
    if (!o.headline)            return { ok: false, reason: "missing headline" }
    if (!o.why_nurses_care)     return { ok: false, reason: "missing why_nurses_care" }
    if (!o.body)                return { ok: false, reason: "missing body" }
    if (!o.ask_followup_prompt) return { ok: false, reason: "missing ask_followup_prompt" }
    if (!o.citations || o.citations.length === 0) {
        return { ok: false, reason: "missing citations" }
    }
    if (o.headline.length        < 10  || o.headline.length        > 100)  return { ok: false, reason: "headline length out of range" }
    if (o.why_nurses_care.length < 20  || o.why_nurses_care.length > 180)  return { ok: false, reason: "why_nurses_care length out of range" }
    if (o.body.length            < 100 || o.body.length            > 5000) return { ok: false, reason: "body length out of range" }
    return { ok: true }
}

async function markFailed(queueId: string, reason: string): Promise<void> {
    const admin = adminClient()
    await admin
        .from("feed_ingest_queue")
        .update({ state: "failed", last_error: reason.slice(0, 1000) })
        .eq("id", queueId)
}

async function markSkipped(queueId: string, reason: string): Promise<void> {
    const admin = adminClient()
    await admin
        .from("feed_ingest_queue")
        .update({ state: "skipped", last_error: reason.slice(0, 1000) })
        .eq("id", queueId)
}

function errorResult(
    item: QueueRow,
    reason: string,
    inTok: number,
    outTok: number,
    passes: number,
): ItemResult {
    return {
        queue_id: item.id,
        source: item.source,
        source_url: item.source_url,
        outcome: "failed",
        reason,
        input_tokens: inTok,
        output_tokens: outTok,
        passes_used: passes,
    }
}

// -----------------------------------------------------------------------------
// HTTP helpers
// -----------------------------------------------------------------------------

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
