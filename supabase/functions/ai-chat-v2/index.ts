import { createClient } from "jsr:@supabase/supabase-js@2"
import { jwtVerify } from "npm:jose@5"
import { createHandler } from "./handler.ts"
import { verifyEvidence } from "./evidence.ts"
import { makeAnswerVerifier, makeCompletion } from "./pipeline.ts"

import { makeExternalRetriever } from "./external-evidence.ts"

const url = Deno.env.get("SUPABASE_URL") ?? ""
const anonKey = Deno.env.get("SUPABASE_ANON_KEY") ?? ""
const serviceKey = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""
const anthropicKey = Deno.env.get("ANTHROPIC_API_KEY") ?? ""
const jwtSecret = Deno.env.get("SUPABASE_JWT_SECRET")
const jwtKey = jwtSecret ? new TextEncoder().encode(jwtSecret) : null

const handler = createHandler({
  verifyEvidence,
  async authenticate(jwt) {
    if (!url || !anonKey || !serviceKey || !anthropicKey) throw new Error("configuration_unavailable")
    if (jwtKey) {
      try {
        const { payload } = await jwtVerify(jwt, jwtKey, { algorithms: ["HS256"], issuer: `${url}/auth/v1`, audience: "authenticated" })
        if (typeof payload.sub === "string" && typeof payload.exp === "number" && payload.role === "authenticated") return payload.sub
      } catch { /* Auth service also handles rotated and asymmetric keys. */ }
    }
    const { data, error } = await createClient(url, anonKey).auth.getUser(jwt)
    if (error || !data.user) return null
    return data.user.id
  },
  async reserve(userID) {
    const admin = createClient(url, serviceKey, { auth: { persistSession: false } })
    const { data, error } = await admin.rpc("reserve_ai_request", { p_user_id: userID })
    if (error || !Array.isArray(data) || !data.length) throw new Error("quota_unavailable")
    return data[0]
  },
  async refund(userID) {
    const { error } = await createClient(url, serviceKey, { auth: { persistSession: false } })
      .rpc("refund_ask_quota", { p_user_id: userID })
    if (error) throw new Error("refund_failed")
  },
  retrieve: (signal, usage) => makeExternalRetriever(anthropicKey, signal, usage),
  verify: (signal, usage) => makeAnswerVerifier(makeCompletion(anthropicKey, signal, usage)),
  complete: (signal, usage) => makeCompletion(anthropicKey, signal, usage),
  log: (metrics) => console.log(JSON.stringify(metrics)),
})

Deno.serve(handler)
