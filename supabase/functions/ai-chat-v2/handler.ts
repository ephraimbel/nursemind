import { MAX_BODY_BYTES, parseInput } from "./contract.ts"
import { answerQuestion, Complete, validatedSSE, VerifyAnswer } from "./pipeline.ts"

import { RetrieveEvidence } from "./external-evidence.ts"

const HEADERS = {
  "access-control-allow-origin": "*",
  "access-control-allow-headers": "authorization, content-type, x-nursemind-contract",
  "access-control-allow-methods": "POST, OPTIONS",
  "access-control-expose-headers": "x-nursemind-contract",
  "x-nursemind-contract": "2",
  "cache-control": "no-store",
}
export type Dependencies = {
  verifyEvidence: (context: string) => Promise<boolean>
  authenticate: (jwt: string) => Promise<string | null>
  reserve: (userID: string) => Promise<{ remaining: number; tier: string; cap: number }>
  refund: (userID: string) => Promise<void>
  complete: (signal: AbortSignal, usage: (value: Record<string, number>) => void) => Complete
  retrieve?: (signal: AbortSignal, usage: (value: Record<string, number>) => void) => RetrieveEvidence
  verify: (signal: AbortSignal, usage: (value: Record<string, number>) => void) => VerifyAnswer
  log: (metrics: Record<string, unknown>) => void
}
const json = (status: number, body: unknown) => new Response(JSON.stringify(body), { status, headers: { ...HEADERS, "content-type": "application/json" } })

async function readJSON(request: Request): Promise<unknown> {
  const reader = request.body?.getReader()
  if (!reader) throw new Error("missing_body")
  const chunks: Uint8Array[] = []
  let size = 0
  try {
    while (true) {
      const { value, done } = await reader.read()
      if (done) break
      size += value.length
      if (size > MAX_BODY_BYTES) { await reader.cancel(); throw new Error("body_limit") }
      chunks.push(value)
    }
  } finally { reader.releaseLock() }
  const joined = new Uint8Array(size)
  let offset = 0
  for (const chunk of chunks) { joined.set(chunk, offset); offset += chunk.length }
  return JSON.parse(new TextDecoder().decode(joined))
}

export function createHandler(deps: Dependencies): (request: Request) => Promise<Response> {
  return async (request) => {
    if (request.method === "OPTIONS") return new Response(null, { status: 204, headers: HEADERS })
    if (request.method !== "POST") return json(405, { error: "method_not_allowed" })
    if (request.headers.get("x-nursemind-contract") !== "2") return json(426, { error: "app_update_required" })
    const auth = request.headers.get("authorization") ?? ""
    if (!/^Bearer /i.test(auth)) return json(401, { error: "unauthorized" })
    let input
    try { input = parseInput(await readJSON(request)) } catch { return json(400, { error: "invalid_request" }) }
    let userID: string | null
    try { userID = await deps.authenticate(auth.slice(7).trim()) } catch { return json(503, { error: "authentication_unavailable" }) }
    if (!userID) return json(401, { error: "unauthorized" })
    try {
      if (input.context && !await deps.verifyEvidence(input.context)) {
        input.context = ""
        input.citationIDs = new Set()
      }
    } catch { return json(503, { error: "evidence_unavailable" }) }
    let quota
    try { quota = await deps.reserve(userID) } catch { return json(503, { error: "quota_unavailable" }) }
    if (!Number.isFinite(quota.remaining)) return json(503, { error: "quota_unavailable" })
    if (quota.remaining < 0) return json(429, { error: "request_limit", tier: quota.tier, limit: quota.cap })
    const started = performance.now()
    const tokens: Record<string, number> = {}
    const signal = AbortSignal.any([request.signal, AbortSignal.timeout(55_000)])
    try {
      const recordUsage = (usage: Record<string, number>) => {
        for (const [key, value] of Object.entries(usage)) tokens[key] = (tokens[key] ?? 0) + value
      }
      const outcome = await answerQuestion(input, deps.complete(signal, recordUsage), deps.retrieve?.(signal, recordUsage),
        (issues) => deps.log({ event: "ask_validation", issues }), deps.verify(signal, recordUsage))
      signal.throwIfAborted()
      deps.log({ event: "ask_complete", latency_ms: Math.round(performance.now() - started), attempts: outcome.attempts,
        outcome: "answer" in outcome ? "answer" : outcome.refusal, context_characters: input.context.length, ...tokens })
      if ("refusal" in outcome) return json(422, { refusal: outcome.refusal })
      return new Response(validatedSSE(outcome.answer, outcome.evidence), { status: 200, headers: { ...HEADERS, "content-type": "text/event-stream" } })
    } catch (error) {
      try { await deps.refund(userID) } catch { deps.log({ event: "ask_refund_failed" }) }
      const known = new Set(["invalid_submission", "invalid_evidence_gaps", "verification_incomplete", "verification_invalid", "classification_incomplete", "classification_invalid", "upstream_invalid"])
      const reason = error instanceof Error && known.has(error.message) ? error.message : "request_or_upstream_failure"
      deps.log({ event: "ask_failed", reason, latency_ms: Math.round(performance.now() - started), ...tokens })
      return json(503, { error: "answer_unavailable" })
    }
  }
}
