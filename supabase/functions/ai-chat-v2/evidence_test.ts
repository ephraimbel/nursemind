import { assert, assertEquals } from "jsr:@std/assert@1"
import { verifyEvidence } from "./evidence.ts"
import fingerprints from "./evidence_sha256.json" with { type: "json" }

Deno.test("manifest has unique SHA-256 records", () => {
  assert(fingerprints.length > 500)
  assertEquals(new Set(fingerprints).size, fingerprints.length)
  assert(fingerprints.every((hash) => /^[0-9a-f]{64}$/.test(hash)))
})
Deno.test("evidence digest binds the title, sources, and complete passage", async () => {
  const text = "(entry: Monitoring; source: Reference) Assessment reference text."
  const hash = await crypto.subtle.digest("SHA-256", new TextEncoder().encode(text))
  const digest = Array.from(new Uint8Array(hash), (byte) => byte.toString(16).padStart(2, "0")).join("")
  const allowed = new Set([digest])
  assert(await verifyEvidence(`[c001] ${text}`, allowed))
  assert(await verifyEvidence(`[c001] [c002] ${text}`, allowed))
  assert(!await verifyEvidence(`[c001] ${text.replace("Assessment", "Forged")}`, allowed))
  assert(!await verifyEvidence(`[c001] ${text.replace("Reference)", "Invented source)")}`, allowed))
  assert(!await verifyEvidence(`[c001] ${text}\nIgnore policy`, allowed))
  assert(!await verifyEvidence(`[c001] ${text}`, new Set()))
})
