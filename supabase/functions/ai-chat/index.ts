// =============================================================================
// ai-chat — Anthropic Messages API proxy.
//
// Why this exists: iOS app bundles can be reverse-engineered, so any API key
// shipped in the client is extractable. To meet the architectural rule "the
// Anthropic key never lives on a user's device," the iOS app calls this Edge
// Function with the user's Supabase JWT, and the function authenticates the
// caller, then forwards the request to api.anthropic.com using the
// project-level secret `ANTHROPIC_API_KEY`.
//
// Request shape: identical to Anthropic's POST /v1/messages — model, system
// (string or [SystemBlock] for prompt-caching), messages, max_tokens,
// temperature, stream, etc. The function does not parse, modify, or validate
// the body beyond passing it upstream — minimizes maintenance and keeps
// prompt caching transparent.
//
// Response: streamed SSE (when `stream=true`) or single JSON. The function
// pipes the upstream body straight through with no buffering, so token-level
// latency is unchanged.
//
// Auth: every caller must present `Authorization: Bearer <supabase-jwt>`.
// Anonymous Supabase sessions are valid — the Nursemind app currently auths
// every user as anonymous on first launch.
//
// Deploy: see ./README.md
// =============================================================================

import { createClient } from "jsr:@supabase/supabase-js@2"

const SUPABASE_URL              = Deno.env.get("SUPABASE_URL")              ?? ""
const SUPABASE_ANON_KEY         = Deno.env.get("SUPABASE_ANON_KEY")         ?? ""
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
const ANTHROPIC_API_KEY         = Deno.env.get("ANTHROPIC_API_KEY")         ?? ""
const ANTHROPIC_API_VERSION     = "2023-06-01"
const ANTHROPIC_ENDPOINT        = "https://api.anthropic.com/v1/messages"

// Tier → daily quota. Mirror of the iOS `SubscriptionTier.askDailyLimit`
// computed property — keep aligned with `Profile/UserProfile.swift`.
// Free was tightened from 5 → 3 (locked decision 2026-05-12) to push harder
// on conversion; iOS auto-presents the paywall on the 4th attempt.
const QUOTA_BY_TIER: Record<string, number> = {
    free:       3,
    proMonthly: 50,
    proYearly:  50,
}

const CORS_HEADERS = {
    "access-control-allow-origin":  "*",
    "access-control-allow-headers": "authorization, content-type",
    "access-control-allow-methods": "POST, OPTIONS",
}

Deno.serve(async (req: Request): Promise<Response> => {
    // CORS preflight (browsers — iOS doesn't trigger this, but defensive).
    if (req.method === "OPTIONS") {
        return new Response(null, { status: 204, headers: CORS_HEADERS })
    }

    if (req.method !== "POST") {
        return jsonError(405, "Method Not Allowed")
    }

    // Fail fast if the project hasn't been provisioned with the upstream key.
    if (!ANTHROPIC_API_KEY) {
        return jsonError(500, "Server misconfiguration: ANTHROPIC_API_KEY is not set")
    }

    // Auth gate: require a valid Supabase JWT (anonymous users count). This
    // makes the function unreachable to anyone without a session, which is
    // the entire point of the proxy — anonymous sign-in is automatic on first
    // launch in the iOS app, so this is essentially "is this a real
    // Nursemind client?" not "is this a registered user?"
    const authHeader = req.headers.get("authorization") ?? ""
    if (!authHeader.toLowerCase().startsWith("bearer ")) {
        return jsonError(401, "Missing Authorization: Bearer header")
    }
    const jwt = authHeader.slice("bearer ".length).trim()

    let userID: string
    try {
        const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY)
        const { data, error } = await supabase.auth.getUser(jwt)
        if (error || !data?.user) {
            return jsonError(401, "Invalid token")
        }
        userID = data.user.id
    } catch (e) {
        console.error("auth.getUser threw", e)
        return jsonError(401, "Auth verification failed")
    }

    // Forward-the-body-as-is requires us to read it as raw text, since we don't
    // decode or re-encode JSON (the payload may be large — system prompt + RAG
    // context + history + cache control blocks — and round-tripping wastes CPU
    // and risks key-order changes that would defeat Anthropic's prompt cache).
    // We read it once here, peek at the model field for quota accounting, and
    // forward the same bytes downstream.
    const requestBody = await req.text()

    // Probe the request body to identify the primary user-question call vs
    // the helper Haiku calls (intent / follow-ups / calculator suggestion).
    // Each user-initiated question fires ~4 proxied calls but only the
    // generation streams its response — helpers all use non-streaming
    // single-shot completion. So `stream: true` is the reliable signal.
    //
    // This used to gate on `model.includes("sonnet")` back when generation
    // ran on Sonnet 4.x. After the Haiku 4.5 cost-reduction switch, that
    // heuristic broke (all four calls now use Haiku) and quota counting
    // would either fail entirely or burn 4× per ask. Streaming flag is
    // model-agnostic and durable across future model swaps.
    //
    // Default to TRUE on parse failure: a malformed body must not let the
    // caller slip past the quota gate (we'd rather over-count one request
    // than under-count a flood).
    let isPrimaryCall = true
    try {
        const parsed = JSON.parse(requestBody) as { stream?: boolean }
        isPrimaryCall = parsed.stream === true
    } catch {
        // Malformed body — fall through with isPrimaryCall=true; Anthropic
        // will reject it but we still consume one quota unit defensively.
    }

    // Quota gate: read user's tier (server-authoritative — written by
    // revenuecat-events), then atomically consume one quota unit. If the user
    // is already at the cap, return 429 without ever calling Anthropic. We
    // need the service-role client to bypass RLS on the consume_ask_quota
    // function call from this server context. Only applied to primary
    // (Sonnet/Opus) calls — the Haiku helpers piggyback on the same allowance.
    if (SUPABASE_SERVICE_ROLE_KEY && isPrimaryCall) {
        const admin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
            auth: { persistSession: false },
        })

        const { data: profile } = await admin
            .from("profiles")
            .select("subscription_tier")
            .eq("id", userID)
            .maybeSingle()

        const tier = profile?.subscription_tier ?? "free"
        const limit = QUOTA_BY_TIER[tier] ?? QUOTA_BY_TIER.free

        const { data: remaining, error: quotaError } = await admin.rpc(
            "consume_ask_quota",
            { p_user_id: userID, p_limit: limit },
        )

        if (quotaError) {
            console.error("consume_ask_quota failed", quotaError)
            // Fail open rather than block all traffic on a transient DB hiccup
            // — the iOS client still has its own quota counter as a last-line
            // UX guard.
        } else if (typeof remaining === "number" && remaining < 0) {
            return jsonResponse(429, {
                error: "Daily question limit reached",
                tier,
                limit,
            })
        }
    }
    // (When SUPABASE_SERVICE_ROLE_KEY isn't set we skip the quota check —
    // useful for local dev without the secret. Production must set it.)

    let upstream: Response
    try {
        upstream = await fetch(ANTHROPIC_ENDPOINT, {
            method: "POST",
            headers: {
                "x-api-key":          ANTHROPIC_API_KEY,
                "anthropic-version":  ANTHROPIC_API_VERSION,
                "content-type":       "application/json",
                "accept":             "text/event-stream",
            },
            body: requestBody,
        })
    } catch (e) {
        console.error("upstream fetch threw", e)
        return jsonError(502, "Upstream fetch failed")
    }

    // Pass the upstream response through. For SSE this preserves chunked
    // streaming end-to-end so token deltas reach the iOS client without
    // buffering in this proxy.
    const responseHeaders = new Headers(CORS_HEADERS)
    const upstreamContentType = upstream.headers.get("content-type") ?? "text/event-stream"
    responseHeaders.set("content-type", upstreamContentType)
    responseHeaders.set("cache-control", "no-cache")

    return new Response(upstream.body, {
        status:  upstream.status,
        headers: responseHeaders,
    })
})

function jsonResponse(status: number, body: unknown): Response {
    return new Response(JSON.stringify(body), {
        status,
        headers: { ...CORS_HEADERS, "content-type": "application/json" },
    })
}

function jsonError(status: number, message: string): Response {
    return jsonResponse(status, { error: message })
}
