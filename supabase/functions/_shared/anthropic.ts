// =============================================================================
// _shared/anthropic.ts — Anthropic Messages API client for the Feed pipeline.
//
// We call api.anthropic.com directly (not through the ai-chat proxy) because:
//   1. The pipeline runs server-side with the project's ANTHROPIC_API_KEY
//      already in env — no key-exposure risk like the iOS client has.
//   2. Going direct skips a needless hop and avoids the per-user quota gate
//      in ai-chat (the pipeline isn't a user; it's a system actor).
//
// Model selection per docs/CONTENT_SOURCING.md and locked decisions:
//   - claude-sonnet-4-6  : authoring + critic + revise (quality matters)
//   - claude-haiku-4-5   : classification + verification (cost matters)
// =============================================================================

const ANTHROPIC_API_KEY     = Deno.env.get("ANTHROPIC_API_KEY") ?? ""
const ANTHROPIC_ENDPOINT    = "https://api.anthropic.com/v1/messages"
const ANTHROPIC_API_VERSION = "2023-06-01"

// Spec calls for Sonnet 4.7; latest released ID in May 2026 is sonnet-4-6.
// Update when 4.7 ships.
export const MODEL_SONNET = "claude-sonnet-4-6"
export const MODEL_HAIKU  = "claude-haiku-4-5-20251001"

export type AnthropicMessage = {
    role: "user" | "assistant"
    content: string
}

export type AnthropicRequest = {
    model: string
    max_tokens: number
    system: string
    messages: AnthropicMessage[]
    temperature?: number
}

export type AnthropicResponse = {
    id: string
    type: "message"
    role: "assistant"
    content: Array<{ type: "text"; text: string }>
    stop_reason: string
    usage: {
        input_tokens: number
        output_tokens: number
    }
}

export class AnthropicError extends Error {
    constructor(public status: number, public body: string) {
        super(`Anthropic ${status}: ${body.slice(0, 200)}`)
    }
}

/**
 * Call the Anthropic Messages API with retry on 5xx and 429.
 *
 * Returns the concatenated text from all `text` content blocks. Caller is
 * responsible for parsing that text (e.g. JSON.parse for structured output).
 *
 * Retries: up to 2 attempts after the first, with exponential backoff
 * (500ms → 1500ms). 4xx other than 429 fails immediately — they indicate a
 * bug in the request, not a transient issue.
 */
export async function callAnthropic(req: AnthropicRequest): Promise<{ text: string; usage: AnthropicResponse["usage"] }> {
    if (!ANTHROPIC_API_KEY) {
        throw new Error("ANTHROPIC_API_KEY is not set in the function environment")
    }

    let lastError: Error | null = null
    const delays = [0, 500, 1500]  // immediate, 500ms, 1500ms

    for (const delay of delays) {
        if (delay > 0) await sleep(delay)

        let res: Response
        try {
            res = await fetch(ANTHROPIC_ENDPOINT, {
                method: "POST",
                headers: {
                    "x-api-key":         ANTHROPIC_API_KEY,
                    "anthropic-version": ANTHROPIC_API_VERSION,
                    "content-type":      "application/json",
                },
                body: JSON.stringify(req),
            })
        } catch (e) {
            // Network-level failure (DNS, connection reset). Retry.
            lastError = e instanceof Error ? e : new Error(String(e))
            continue
        }

        if (res.ok) {
            const body = await res.json() as AnthropicResponse
            const text = (body.content ?? [])
                .filter((b) => b.type === "text")
                .map((b) => b.text)
                .join("")
            return { text, usage: body.usage }
        }

        const bodyText = await res.text()
        const error = new AnthropicError(res.status, bodyText)

        // 5xx + 429 are transient. 4xx other than 429 is a request bug —
        // failing fast saves money and surfaces the bug quickly.
        if (res.status >= 500 || res.status === 429) {
            lastError = error
            continue
        }

        throw error
    }

    throw lastError ?? new Error("Anthropic call failed with no error captured")
}

function sleep(ms: number): Promise<void> {
    return new Promise((resolve) => setTimeout(resolve, ms))
}

/**
 * Extract the first JSON object from a string. Sonnet sometimes wraps JSON in
 * a markdown code fence or pads with preamble text; this rips out the actual
 * JSON. Throws if no parseable JSON is present.
 */
export function extractJson<T = unknown>(text: string): T {
    // Strip ```json ... ``` fences first
    const fence = text.match(/```(?:json)?\s*([\s\S]*?)```/i)
    const candidate = fence ? fence[1] : text

    // Find the first { and try to balance to its matching }
    const start = candidate.indexOf("{")
    if (start < 0) {
        throw new Error("No JSON object found in model output")
    }

    let depth = 0
    let inString = false
    let escape = false
    for (let i = start; i < candidate.length; i++) {
        const c = candidate[i]
        if (escape) { escape = false; continue }
        if (c === "\\") { escape = true; continue }
        if (c === '"') { inString = !inString; continue }
        if (inString) continue
        if (c === "{") depth++
        else if (c === "}") {
            depth--
            if (depth === 0) {
                const slice = candidate.slice(start, i + 1)
                return JSON.parse(slice) as T
            }
        }
    }

    throw new Error("Unbalanced braces in model output")
}
