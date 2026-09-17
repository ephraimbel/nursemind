import fingerprints from "./evidence_sha256.json" with { type: "json" }

const approved = new Set(fingerprints)

export async function verifyEvidence(context: string, allowed: ReadonlySet<string> = approved): Promise<boolean> {
  const lines = context.split("\n")
  if (!lines.length || lines.length > 24) return false
  const digests = await Promise.all(lines.map(async (line) => {
    const prefix = line.match(/^(?:\[c[0-9]{3}\] ?)+(?=\(entry:)/)?.[0]
    if (!prefix) return ""
    const bytes = new TextEncoder().encode(line.slice(prefix.length))
    const hash = await crypto.subtle.digest("SHA-256", bytes)
    return Array.from(new Uint8Array(hash), (byte) => byte.toString(16).padStart(2, "0")).join("")
  }))
  return digests.every((hash) => allowed.has(hash))
}
