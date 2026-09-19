// =============================================================================
// _shared/apns.ts — token-based APNs transport over fetch.
//
// Deno's fetch negotiates HTTP/2 over TLS, which is all APNs needs. The
// provider token is an ES256 JWT signed with the .p8 key from App Store
// Connect, cached and re-minted after 50 minutes (Apple allows 60).
//
// Secrets (supabase secrets set): APNS_AUTH_KEY_P8 (the PEM contents,
// newlines allowed), APNS_KEY_ID, APNS_TEAM_ID. Bundle id is fixed.
// =============================================================================

export const APNS_TOPIC = "app.nursemind.ios"

export type APNSEnv = "sandbox" | "production"

export type APNSPayload = {
    aps: {
        alert: { title: string; body: string }
        sound?: string
        "thread-id"?: string
        "interruption-level"?: "passive" | "active" | "time-sensitive"
    }
    deep_link: string
    kind: "digest" | "urgent"
    log_id: string
}

export type APNSResult = {
    ok: boolean
    status: number
    reason?: string
    /// True when APNs says the token is dead and the row should be deleted.
    unregistered: boolean
}

type Credentials = { keyPEM: string; keyID: string; teamID: string }

let cachedJWT: { value: string; mintedAt: number; keyID: string } | null = null

export function credentialsFromEnv(): Credentials | null {
    const keyPEM = Deno.env.get("APNS_AUTH_KEY_P8") ?? ""
    const keyID  = Deno.env.get("APNS_KEY_ID") ?? ""
    const teamID = Deno.env.get("APNS_TEAM_ID") ?? ""
    if (!keyPEM || !keyID || !teamID) return null
    return { keyPEM, keyID, teamID }
}

function base64url(bytes: Uint8Array | string): string {
    const bin = typeof bytes === "string" ? bytes : String.fromCharCode(...bytes)
    return btoa(bin).replace(/\+/g, "-").replace(/\//g, "_").replace(/=+$/, "")
}

function pemToDER(pem: string): Uint8Array<ArrayBuffer> {
    const body = pem.replace(/-----BEGIN [^-]+-----/g, "").replace(/-----END [^-]+-----/g, "").replace(/\s+/g, "")
    const bin = atob(body)
    const out = new Uint8Array(new ArrayBuffer(bin.length))
    for (let i = 0; i < bin.length; i++) out[i] = bin.charCodeAt(i)
    return out
}

/// ES256 provider token. Exported for tests; production callers use `providerJWT`.
export async function mintProviderJWT(creds: Credentials, now = Date.now()): Promise<string> {
    const key = await crypto.subtle.importKey(
        "pkcs8", pemToDER(creds.keyPEM), { name: "ECDSA", namedCurve: "P-256" }, false, ["sign"],
    )
    const header  = base64url(JSON.stringify({ alg: "ES256", kid: creds.keyID }))
    const claims  = base64url(JSON.stringify({ iss: creds.teamID, iat: Math.floor(now / 1000) }))
    const signing = `${header}.${claims}`
    const sig = await crypto.subtle.sign(
        { name: "ECDSA", hash: "SHA-256" }, key, new TextEncoder().encode(signing),
    )
    return `${signing}.${base64url(new Uint8Array(sig))}`
}

async function providerJWT(creds: Credentials): Promise<string> {
    const now = Date.now()
    if (cachedJWT && cachedJWT.keyID === creds.keyID && now - cachedJWT.mintedAt < 50 * 60_000) {
        return cachedJWT.value
    }
    const value = await mintProviderJWT(creds, now)
    cachedJWT = { value, mintedAt: now, keyID: creds.keyID }
    return value
}

export function apnsHost(env: APNSEnv): string {
    return env === "production" ? "https://api.push.apple.com" : "https://api.sandbox.push.apple.com"
}

export async function sendPush(
    creds: Credentials,
    deviceToken: string,
    env: APNSEnv,
    payload: APNSPayload,
    collapseID?: string,
): Promise<APNSResult> {
    const jwt = await providerJWT(creds)
    const headers: Record<string, string> = {
        "authorization": `bearer ${jwt}`,
        "apns-topic": APNS_TOPIC,
        "apns-push-type": "alert",
        "apns-priority": "10",
        "content-type": "application/json",
    }
    if (collapseID) headers["apns-collapse-id"] = collapseID.slice(0, 64)

    const res = await fetch(`${apnsHost(env)}/3/device/${deviceToken}`, {
        method: "POST",
        headers,
        body: JSON.stringify(payload),
    })
    if (res.ok) return { ok: true, status: res.status, unregistered: false }

    let reason = ""
    try { reason = ((await res.json()) as { reason?: string }).reason ?? "" } catch { /* empty body */ }
    const unregistered = res.status === 410 || reason === "BadDeviceToken" || reason === "Unregistered" || reason === "DeviceTokenNotForTopic"
    return { ok: false, status: res.status, reason, unregistered }
}
