// =============================================================================
// _shared/push-digest.ts — the decisions behind every push, as pure functions.
//
// Nothing here touches the network or the database, so the rules that keep
// notifications rare and personal are unit-tested:
//   - a digest goes out only in the hour of the user's shift start, in their
//     zone, and only when there is something to say;
//   - an urgent alert goes out only to users with a saved entry the story
//     touches;
//   - no headline or other clinical text ever reaches the lock screen.
// =============================================================================

export type DigestUser = {
    user_id: string
    shift_start_local: string   // "06:45" or "06:45:00"
    tz: string                   // IANA
    pinned_entry_ids: string[]
}

export type WeekItem = {
    id: string
    related_entry_ids: string[]
    priority: "urgent" | "standard"
    published_at: string
}

/// Local wall-clock hour (0–23) for `now` in `tz`. Falls back to UTC for an
/// unknown zone so a bad profile value cannot crash the whole run.
export function localHour(now: Date, tz: string): number {
    try {
        const parts = new Intl.DateTimeFormat("en-US", { timeZone: tz, hour: "numeric", hour12: false }).formatToParts(now)
        const hour = Number(parts.find((p) => p.type === "hour")?.value ?? "0")
        return hour === 24 ? 0 : hour
    } catch {
        return now.getUTCHours()
    }
}

export function shiftStartHour(shiftStartLocal: string): number {
    const hour = Number(shiftStartLocal.split(":")[0])
    return Number.isFinite(hour) ? Math.min(23, Math.max(0, hour)) : 6
}

/// True when this hourly run is the user's shift-start hour.
export function isShiftHour(user: Pick<DigestUser, "shift_start_local" | "tz">, now: Date): boolean {
    return localHour(now, user.tz) === shiftStartHour(user.shift_start_local)
}

/// Stories from the week that touch one of the user's saved entries.
export function watchlistHits(items: WeekItem[], pinned: string[]): WeekItem[] {
    if (pinned.length === 0) return []
    const saved = new Set(pinned)
    return items.filter((item) => item.related_entry_ids.some((id) => saved.has(id)))
}

export function unreadCount(items: WeekItem[], readIDs: Set<string>): number {
    return items.filter((item) => !readIDs.has(item.id)).length
}

export const CASE_STALE_DAYS = 7
export const CASE_LINE = "Today's case is up"

/// Lock-screen copy. Counts only; never a headline. When the user has not
/// engaged with a daily case in `CASE_STALE_DAYS`, the digest mentions it,
/// and carries only that line when there is nothing else to say.
export function digestBody(hits: number, unread: number, caseStale = false): string | null {
    const parts: string[] = []
    if (hits > 0)   parts.push(`${hits} ${hits === 1 ? "alert" : "alerts"} for your unit`)
    if (unread > 0) parts.push(`${unread} new this week`)
    if (caseStale)  parts.push(CASE_LINE)
    return parts.length === 0 ? null : parts.join(" · ")
}

/// Where a tap should land: alerts first, then the week, then the case.
export function digestDeepLink(hits: number, unread: number, caseStale: boolean): string {
    if (hits > 0)   return "nursemind://feed?filter=watchlist"
    if (unread > 0) return "nursemind://feed"
    return caseStale ? "nursemind://case/today" : "nursemind://feed"
}

export function urgentBody(): string {
    return "An urgent safety alert touches an entry you saved."
}

export type DigestDecision = {
    user_id: string
    send: boolean
    hits: number
    unread: number
    case_stale: boolean
    body: string | null
    deep_link: string
}

export function decideDigest(
    user: DigestUser,
    weekItems: WeekItem[],
    readIDs: Set<string>,
    now: Date,
    caseStale = false,
): DigestDecision {
    const base = { user_id: user.user_id, send: false, hits: 0, unread: 0, case_stale: caseStale, body: null as string | null, deep_link: "nursemind://feed" }
    if (!isShiftHour(user, now)) return base
    const hits = watchlistHits(weekItems, user.pinned_entry_ids).length
    const unread = unreadCount(weekItems, readIDs)
    const body = digestBody(hits, unread, caseStale)
    return { ...base, send: body !== null, hits, unread, body, deep_link: digestDeepLink(hits, unread, caseStale) }
}

/// True when the user has no daily-case answer on or after the cutoff.
/// `lastAnsweredOn` is a `yyyy-MM-dd` date or null when nothing is logged.
export function isCaseStale(lastAnsweredOn: string | null, now: Date): boolean {
    if (!lastAnsweredOn) return true
    const cutoff = new Date(now.getTime() - CASE_STALE_DAYS * 86_400_000)
    return lastAnsweredOn < cutoff.toISOString().slice(0, 10)
}

/// Users who should hear about an urgent item: saved-entry overlap only,
/// never everyone.
export function urgentRecipients(item: WeekItem, users: Pick<DigestUser, "user_id" | "pinned_entry_ids">[]): string[] {
    const related = new Set(item.related_entry_ids)
    if (related.size === 0) return []
    return users.filter((u) => u.pinned_entry_ids.some((id) => related.has(id))).map((u) => u.user_id)
}

const CLINICAL_TEXT_GUARD = /\b\d+(\.\d+)?\s?(mg|mcg|units?|ml|mEq|g)\b/i

/// Belt and braces: the payload builder refuses copy that looks clinical.
export function assertLockScreenSafe(text: string): void {
    if (CLINICAL_TEXT_GUARD.test(text)) throw new Error(`push copy contains clinical text: ${text}`)
}
