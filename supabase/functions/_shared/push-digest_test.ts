import { assert, assertEquals, assertThrows } from "jsr:@std/assert@1"
import { assertLockScreenSafe, decideDigest, digestBody, digestDeepLink, isCaseStale, isShiftHour, localHour, shiftStartHour, unreadCount, urgentRecipients, watchlistHits, WeekItem } from "./push-digest.ts"
import { apnsHost, mintProviderJWT } from "./apns.ts"

const items: WeekItem[] = [
    { id: "a", related_entry_ids: ["drug:heparin"], priority: "urgent", published_at: "2026-09-18T10:00:00Z" },
    { id: "b", related_entry_ids: ["drug:insulin", "lab:glucose"], priority: "standard", published_at: "2026-09-17T10:00:00Z" },
    { id: "c", related_entry_ids: [], priority: "standard", published_at: "2026-09-16T10:00:00Z" },
]

Deno.test("local hour respects the user's zone", () => {
    const now = new Date("2026-09-18T11:30:00Z")
    assertEquals(localHour(now, "America/Chicago"), 6)
    assertEquals(localHour(now, "America/Los_Angeles"), 4)
    assertEquals(localHour(now, "Not/AZone"), 11)
    assertEquals(shiftStartHour("06:45:00"), 6)
    assertEquals(shiftStartHour("18:45"), 18)
    assertEquals(shiftStartHour("garbage"), 6)
})

Deno.test("digest fires only in the shift-start hour", () => {
    const user = { shift_start_local: "06:45", tz: "America/Chicago" }
    assert(isShiftHour(user, new Date("2026-09-18T11:05:00Z")))
    assert(!isShiftHour(user, new Date("2026-09-18T12:05:00Z")))
})

Deno.test("watchlist hits and unread counts", () => {
    assertEquals(watchlistHits(items, ["drug:heparin", "lab:glucose"]).map((i) => i.id), ["a", "b"])
    assertEquals(watchlistHits(items, []), [])
    assertEquals(unreadCount(items, new Set(["a"])), 2)
})

Deno.test("digest copy is counts only and absent when there is nothing to say", () => {
    assertEquals(digestBody(0, 0), null)
    assertEquals(digestBody(1, 0), "1 alert for your unit")
    assertEquals(digestBody(2, 6), "2 alerts for your unit · 6 new this week")
    assertEquals(digestBody(0, 3), "3 new this week")
})

Deno.test("decideDigest skips the wrong hour and empty weeks", () => {
    const user = { user_id: "u1", shift_start_local: "06:45", tz: "America/Chicago", pinned_entry_ids: ["drug:heparin"] }
    const inHour = new Date("2026-09-18T11:05:00Z")
    const d = decideDigest(user, items, new Set(), inHour)
    assert(d.send)
    assertEquals(d.hits, 1)
    assertEquals(d.unread, 3)
    assert(!decideDigest(user, items, new Set(), new Date("2026-09-18T15:05:00Z")).send)
    assert(!decideDigest({ ...user, pinned_entry_ids: [] }, items, new Set(["a", "b", "c"]), inHour).send)
})

Deno.test("urgent alerts reach only users with a saved entry the story touches", () => {
    const users = [
        { user_id: "u1", pinned_entry_ids: ["drug:heparin"] },
        { user_id: "u2", pinned_entry_ids: ["drug:insulin"] },
        { user_id: "u3", pinned_entry_ids: [] },
    ]
    assertEquals(urgentRecipients(items[0], users), ["u1"])
    assertEquals(urgentRecipients(items[2], users), [])
})

Deno.test("lock-screen guard rejects dose-like copy", () => {
    assertLockScreenSafe("2 alerts for your unit · 6 new this week")
    assertThrows(() => assertLockScreenSafe("Give 5 mg now"))
    assertThrows(() => assertLockScreenSafe("titrate to 10 units"))
})

Deno.test("provider JWT is a signed ES256 token with the key id", async () => {
    const pair = await crypto.subtle.generateKey({ name: "ECDSA", namedCurve: "P-256" }, true, ["sign", "verify"])
    const pkcs8 = new Uint8Array(await crypto.subtle.exportKey("pkcs8", pair.privateKey))
    const pem = `-----BEGIN PRIVATE KEY-----\n${btoa(String.fromCharCode(...pkcs8))}\n-----END PRIVATE KEY-----`
    const jwt = await mintProviderJWT({ keyPEM: pem, keyID: "ABC123", teamID: "LRDHWBMA87" }, 1_800_000_000_000)
    const [h, c, s] = jwt.split(".")
    const decode = (part: string) => JSON.parse(atob(part.replace(/-/g, "+").replace(/_/g, "/")))
    assertEquals(decode(h), { alg: "ES256", kid: "ABC123" })
    assertEquals(decode(c), { iss: "LRDHWBMA87", iat: 1_800_000_000 })
    const sig = Uint8Array.from(atob(s.replace(/-/g, "+").replace(/_/g, "/")), (ch) => ch.charCodeAt(0))
    const valid = await crypto.subtle.verify({ name: "ECDSA", hash: "SHA-256" }, pair.publicKey, sig, new TextEncoder().encode(`${h}.${c}`))
    assert(valid)
    assertEquals(apnsHost("sandbox"), "https://api.sandbox.push.apple.com")
})

Deno.test("daily case hook: stale after seven days, mentioned in the digest, alone when nothing else", () => {
    const now = new Date("2026-09-19T11:05:00Z")
    assert(isCaseStale(null, now))
    assert(isCaseStale("2026-09-11", now))
    assert(!isCaseStale("2026-09-12", now))
    assert(!isCaseStale("2026-09-19", now))
    assertEquals(digestBody(0, 0, true), "Today's case is up")
    assertEquals(digestBody(2, 0, true), "2 alerts for your unit · Today's case is up")
    assertEquals(digestBody(0, 0, false), null)
    assertEquals(digestDeepLink(0, 0, true), "nursemind://case/today")
    assertEquals(digestDeepLink(1, 4, true), "nursemind://feed?filter=watchlist")
    assertEquals(digestDeepLink(0, 4, true), "nursemind://feed")

    const user = { user_id: "u1", shift_start_local: "06:45", tz: "America/Chicago", pinned_entry_ids: [] as string[] }
    const quiet = decideDigest(user, [], new Set(), now, true)
    assert(quiet.send)
    assertEquals(quiet.body, "Today's case is up")
    assertEquals(quiet.deep_link, "nursemind://case/today")
    assert(!decideDigest(user, [], new Set(), now, false).send)
    assert(!decideDigest(user, [], new Set(), new Date("2026-09-19T15:05:00Z"), true).send)
    assertLockScreenSafe(quiet.body!)
})
