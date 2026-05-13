# v1.1 — Feed

**Status:** scoped 2026-05-13, rev 2 · pending v1 launch · target ship ~4 weeks post-launch
**Replaces / accelerates:** the v1.5 "dynamic feed" item in `project_v1_5_features.md`. Pulled forward to v1.1 because (a) it's the strongest single retention lever for a content app, (b) OpenEvidence is publicly targeting nurses next and a 6-month delay invites direct competition, (c) NurseMind's editorial design language is already the right shape for a feed, and (d) the entire pipeline can run fully automated with multi-layer AI quality defenses, so the operational cost is ~$20/month not ~$1,260/month.

---

## TL;DR

A native iOS feed slotted **between Ask and Library** in the tab bar that surfaces nursing-relevant updates daily — drug safety communications, CDC alerts, NIH guideline changes, NCSBN/licensure news, peer-reviewed research with permissive licenses. Each story is a 3-paragraph editorial summary with a single italic "why nurses care" line. Fully automated: no human in the loop after deploy.

Multi-layer AI defense pipeline catches the vast majority of errors before they hit the user. Honest disclaimer + visible citations + fast user-report retraction loop handles the residual risk. Estimated error rate: <0.1% of items have meaningful errors; user reports retract within hours.

**Cost:** ~$20/month in LLM API calls, $0 in reviewer pay. Fully automated.
**Engineering:** ~4 weeks of focused work post-v1-launch.
**Reuses:** Supabase, Anthropic Sonnet + Haiku, the existing cite-or-refuse pipeline, the existing flag-reports table for user retractions, the existing typography and spacing system.

---

## 1. The user experience — step by step

Designing a perfect feed page means thinking about every moment the user spends with it. Five moments:

### Moment 1 — First time the user opens the Feed tab

User taps the Feed tab. App fetches latest items (cached locally, refreshes silently in background).

**What they see in the first 200ms:** four ghost-skeleton cards (hairline-bordered, content-shaped placeholders, no animated shimmer — that's iOS-standard, not premium-feel). After cached items load, the skeletons replace with real cards.

**What's visible without scrolling on iPhone 17 Pro Max:** the day's eyebrow, two or three full cards, and a peek of the third's bottom. Generous spacing — every card has 32pt vertical breathing room, hairline dividers, no clipped headlines.

**Animation:** subtle 7px translateY + opacity fade-in on each card, staggered by 40ms, cubic-bezier(0.2, 0.6, 0.2, 1) over 350ms. Once. After that, no animation on the feed list — it's a quiet space.

### Moment 2 — Daily ritual (the morning open)

User has been using NurseMind for a week. They open the app at 6:47 AM on the train.

**What they expect:** new content since yesterday. Not infinite scroll. Just *what's new*.

**The tab icon shows a small accent-green dot** if there are new items since the user's last visit. The dot disappears the moment they enter the tab. (Same convention Apple Mail uses.)

**At the top of the feed:** a quiet date eyebrow — `MAY 13 · TUESDAY`. Below it, today's items appear first; yesterday's are separated by a `MAY 12` divider; the day before by `MAY 11`. Editorial date-grouping, not infinite scroll.

**A user can pull-to-refresh.** Light haptic on pull threshold, accent-green refresh indicator (one-color, no spinner), feed re-fetches. If new items exist, they slide in from the top with the same 350ms fade. If no new items, a one-time italic line at top: *"Last refreshed just now. No new items since 4:02 AM."* — fades after 2 seconds.

### Moment 3 — Reading an item

User taps a card. The card animates *up and forward* into a full-screen reading view — a true hero animation, not just a navigation push. The eyebrow + headline + why-nurses-care from the card stay anchored; the body content slides in below.

**Reading view layout:**

```
[X close · top-left, 44pt tap target, subtle hairline below]

CATEGORY · SOURCE · DATE          (mono caps, 11pt)

Headline in Instrument Serif      (44-56pt depending on length)
display, two or three lines max.

Why nurses care:                  (mono caps 10pt label)
This affects how to monitor      (italic serif, 17pt, slight tracking)
PRN antibiotic ordering on
med-surg and ED units.

─────────────────────────────────  (hairline divider)

Three paragraphs of body content,  (Inter regular, 17pt, line-height 1.55)
clean editorial prose. Numbers in
mono [c001]. Sources are inline
citations as superscript footnote
chips.

Inline numbers like 25 mg are     (mono numerics, accent-tinted)
mono. Drug names in italic serif
where stylistically appropriate.

─────────────────────────────────

SOURCES                            (mono caps 10pt label)
[1] FDA Drug Safety Communication  (hairline-bordered row, tap → in-app Safari)
    March 24, 2026
    fda.gov/drugs/drug-safety...

[2] DailyMed Structured Product
    Label, last updated 2026-03-01
    dailymed.nlm.nih.gov/...

─────────────────────────────────

RELATED IN LIBRARY                 (mono caps 10pt label)
Three quiet rows — entries from   (hairline-divided, tap → library detail)
the cited library this item draws
on. Restrained — no thumbnails.

─────────────────────────────────

[ Ask NurseMind about this ]      (primary accent button, full-width, 56pt)

Saved · Share                     (two quiet text links, hairline-divided)

AI-generated summary · verify     (italic mono caps 10pt, tertiary)
against source for clinical
decisions.
```

The "Ask NurseMind about this" button, when tapped, dismisses the reading view and slides into the Ask tab with the input field pre-filled with a contextual question. The contextual question is generated server-side as part of the feed pipeline — something like *"Help me understand what the FDA's fluoroquinolone safety update means for med-surg practice"* — using the user's specialty.

**Save** uses the same bookmark glyph as library entries. Optimistic UI: tap → immediate accent-green check fade, server sync in background.

**Share** opens the iOS share sheet with a custom thumbnail card + the source URL. Sharing to Messages embeds a beautiful preview.

### Moment 4 — Back to the feed

User taps close (or swipes from left edge — iOS standard). Reverse hero animation, lands them back on the feed with **the card they read scroll-anchored to the top of the visible area**. No re-fetching. No lost place.

The card they just read has a quiet "Read" mono-caps eyebrow added in place of the date eyebrow — they can tell at a glance what they've already seen.

### Moment 5 — A push notification arrives

It's 4:18 PM. User's phone buzzes once with a notification:

> **Drug safety update**
> FDA · MAY 13
> FDA strengthens warning on fluoroquinolones in patients with mental health history.

User taps. App opens directly into the reading view for that item. No "loading…", no Ask-tab detour. The notification's payload includes the item ID and the app deep-links straight to the reading view.

After the user reads, swiping closes returns them to the Feed tab — not to where they were before the notification. This is intentional: the notification declared a context, so the app respects it.

---

## 2. Visual specification

Exact values. These are the kind of details that make the difference between "another nursing app feed" and "the feed that nurses tell their friends about."

### Typography on a Feed card

| Element | Font | Size | Line-height | Tracking | Color |
|---|---|---|---|---|---|
| Date divider | JetBrains Mono | 11pt | 1.0 | 0.16em | `textTertiary` |
| Category eyebrow | JetBrains Mono | 10.5pt | 1.0 | 0.18em | `textFaint` (above category), `textMuted` (category) |
| Headline | Instrument Serif | 24pt | 1.08 | -0.018em | `textPrimary` |
| Why-nurses-care label | JetBrains Mono | 9.5pt | 1.0 | 0.18em | `textFaint` |
| Why-nurses-care body | Instrument Serif Italic | 16pt | 1.42 | -0.005em | `textSecondary` |
| Action row label | Inter | 14pt | 1.0 | 0 | `textMuted` |

### Spacing on a Feed card

```
┌─────────────────────────────────────────────────┐
│ 32pt top padding                                │
│ ─ Category eyebrow                              │
│ 10pt                                            │
│ ─ Headline (24pt, 2-3 lines)                    │
│ 14pt                                            │
│ ─ Why-nurses-care label                         │
│ 4pt                                             │
│ ─ Why-nurses-care body (3-4 lines)              │
│ 22pt                                            │
│ ─ Action row (Read · Ask · Save)                │
│ 32pt bottom padding                             │
│ ─────────────────────────────────────────  ← 1px hairline
└─────────────────────────────────────────────────┘
```

Horizontal padding: 20pt either side.

### Color usage

Same palette as the rest of the app — no new colors. The accent green appears only on:
- The primary "Ask NurseMind about this" button in the reading view
- Inline citation chips `[c001]` (subtle, accent-tinted)
- The unread-dot on the tab icon
- The save-state checkmark
- The pull-to-refresh indicator

Everything else uses textPrimary / textSecondary / textTertiary / textFaint / hairline.

### Card interaction states

| State | Treatment |
|---|---|
| Resting | As above |
| Pressed (touch down) | 95% opacity, 1.5pt vertical translation, 80ms ease |
| Released | Reverse animation, 180ms cubic-bezier(0.2, 0.6, 0.2, 1) |
| Visited (read) | Eyebrow shows "READ · {category}" instead of date; otherwise identical |
| Saved | Save action turns into accent-green check, 200ms fade between states |

### Tab bar

```
[ Ask ] [ Feed ] [ Library ] [ Tools ] [ Profile ]
            ↑
        new tab at position 2
```

Feed icon: `newspaper.fill` (SF Symbol). Selected color: textPrimary. Unselected color: textTertiary. Unread dot: 6pt circle, accent-green, top-right of the icon, with a 200ms scale-in animation when it first appears.

---

## 3. AI quality defenses — the layered authoring pipeline

Since we're shipping without paid reviewers, the pipeline does the work. The authoring step is itself **a three-pass layered AI check-off** (author → critic → revise) that makes every summary contextually correct before any downstream regex / faithfulness verifier ever sees it. After authoring, six more independent defense layers catch any remaining error class.

### Layer 1 — Multi-pass authoring (author → critic → revise)

The single summary you read on a Feed card is actually the product of **three sequential AI passes**, each with a different job.

#### Pass 1a — Author (Sonnet)

The source-restricted system prompt makes the ground rules explicit:

> *"You may use ONLY the SOURCE TEXT provided below. Do not use external knowledge from your training data. If the source doesn't state something, neither does your summary. Preserve all qualifiers ('in adults', 'after Phase 2', 'n=42') exactly as in the source. Use 'studies suggest' not 'studies prove' unless the source uses 'prove' or 'confirm' explicitly. Use the source's drug names — generic and brand — exactly as they appear. Output a JSON object with: headline (≤ 80 chars), why_nurses_care (≤ 180 chars, must be specific and actionable for the target specialty), body (3 paragraphs, each 60–90 words), citations (array of {id, source_name, snippet, url})."*

This dramatically cuts training-data hallucination. Output is a draft summary.

#### Pass 1b — Critic (Sonnet, separate call)

The same model, given **both the source AND the draft**, in a separate API call with a *critique-only* system prompt:

> *"You are a senior nurse editor reviewing an AI-generated summary against the source. Return JSON: { "contextually_correct": bool, "issues": [list of specific issues] }. Look for: (1) any claim in the summary that doesn't appear in the source, (2) population over-extrapolation (e.g., adult-only data presented as general), (3) drug-class over-generalization (e.g., specific drug findings presented as class-wide), (4) timeframe distortion ('immediate' when source said 'after weeks'), (5) certainty inflation ('proves' when source said 'suggests'), (6) headline overstating body, (7) why_nurses_care being too generic ('important for care' rather than specific). Be strict. A nurse reading this will rely on it."*

Output: JSON critique. If `contextually_correct: true` and `issues` is empty, the draft is sent forward. If issues exist, we fall through to Pass 1c.

#### Pass 1c — Revise (Sonnet, with critic feedback in context)

Only triggered when the critic flagged issues. The author is given **the original source, the draft, and the critic's list of issues**, with the prompt:

> *"Revise the draft summary to address the issues from the critic. Use only the source content. Output the same JSON shape as before."*

Output: revised draft. We do not run another critic pass on the revision — one revise cycle is the limit (otherwise infinite loops on edge cases). If the post-revision summary still fails downstream layers (3, 4, 9), the item is marked `pending_review` and held off auto-publish.

**Why three passes and not one:** generating + critiquing + revising in separate calls dramatically outperforms a single mega-prompt with all the rules. The critic's mental model can be more aggressive than the author's. The revise step preserves the source-grounding while fixing the critic's specific complaints. Total cost per item: ~$0.08–0.12 (vs ~$0.04 single-pass) — still trivial at 15 items/day.

### Layer 2 — Cite-or-refuse regex enforcement

Every numerical claim — doses, ranges, percentages, sample sizes, mortality rates — must include a `[c001]`-style citation tag that resolves to a citation in the `citations` array. If the regex finds a number without a tag, the response is rejected and the author function retries (max 2 retries, then `pending_review`).

Pattern: `\b\d+(\.\d+)?\s?(mg|mcg|mL|units?|mEq|g|%|kg|mmHg|bpm|cm|years?|days?|weeks?|months?|n=|x[0-9]+|×[0-9]+)\b` triggers the requirement.

### Layer 3 — Automated faithfulness verification

After the summary is generated, a **second AI pass** (Haiku) is given both the source text and the generated summary with this instruction:

> *"You are verifying that the SUMMARY contains only claims that appear in the SOURCE. For each factual claim in the summary, decide whether it is supported by the source. Return JSON: { "supported": true/false, "violations": [{ "claim": "...", "reason": "..." }] }. Be strict — paraphrases that change meaning count as violations."*

If `violations` is non-empty, the item is held back as `'pending_review'`. You'd see these on a quiet internal dashboard. Either ignore them (they expire from the queue after 7 days), fix the prompt, or manually publish after correction.

**Cost:** ~$0.003 per item via Haiku. At 15 items/day = ~$1.30/month.

### Layer 4 — Clinical-safety verbatim check

A regex catches every clinical numerical value (`\b\d+(\.\d+)?\s?(mg|mcg|mL|units|mEq|kg|mmHg|bpm)\b`). Each match must appear *verbatim* in the source text — not paraphrased, not reformatted, not rounded.

This is the layer that catches *"0.3% became 30%"* — the most dangerous type of summary error. If a number doesn't appear verbatim in the source, it's not in the summary, period.

### Layer 5 — Conservative-tone style rules

Hard rules in the prompt:
- "Studies suggest" / "data indicate" — not "studies prove" / "data confirm" — unless the source uses prove/confirm
- Preserve all dose qualifiers verbatim ("in patients with hepatic impairment" can't shrink to "in patients")
- Preserve all sample-size caveats ("Phase 2, n=42, retrospective, single-center")
- Preserve all population qualifiers ("in adults", "in pediatric patients ≥6 years")
- Use the source's drug names (both generic and brand) verbatim

### Layer 6 — Source provenance always visible

Every Feed card and reading view shows citations prominently. Reading view has a dedicated **Sources** section. Every citation is a real outbound link to the primary source. The AI summary is framed as the *editor's* take; the source is the *publisher of record*. This matches the FDA CDS safe-harbor requirement that HCPs can independently verify recommendations.

### Layer 7 — User report → fast retraction

Every Feed card has a "Report inaccuracy" affordance (long-press → contextual menu, or three-dot icon in the reading view). Reports route into the existing `public.flag_reports` table with `target_type = 'feed_item'`.

Reports surface in your existing daily dashboard. Workflow:
1. Report arrives, you see it within the day.
2. If valid: edit the item server-side and the change propagates to all devices on next sync (within minutes).
3. If invalid: dismiss; reporter sees nothing change.
4. If structural: pull the item entirely (set `archived_at`).

A pulled item disappears from the feed and from saved-for-later. Already-cached devices stop showing it on next pull-to-refresh.

### Layer 8 — Honest disclaimer

A small italic mono-caps line at the bottom of every reading view:

> *AI-generated summary · verify against source for clinical decisions*

Sets user expectations correctly. Matches FDA CDS safe-harbor framing. Same disclaimer pattern used on AI co-pilot responses, so users learn the rule once and it applies everywhere.

### Expected error rate with all 8 layers

| Error class | Layer that catches | Residual after layer |
|---|---|---|
| Training-data hallucination | 1 (source-restricted prompt) | ~5% of pre-layer rate |
| Missing citation on numeric claim | 2 (regex) | ~0% (hard-blocked) |
| Paraphrased fact that changes meaning | 3 (Haiku faithfulness) | ~10% of pre-layer rate |
| Decimal-place / unit error on dose | 4 (verbatim check) | ~0% (hard-blocked) |
| Overstated certainty | 5 (tone rules) | reduced ~80% |
| User can't verify | 6 (sources visible) | mitigated |
| Slipped error | 7 (retraction) | mitigated within hours |
| Misuse | 8 (disclaimer) | mitigated |

**Honest estimate:** ~99.5% of items will be substantively correct. ~0.4% will have minor stylistic awkwardness that's still factually accurate. **<0.1% will have meaningful errors** — roughly 5 items per year out of ~5,500 published. With the user-report loop pulling each error within hours, the user-facing exposure to bad content is minimal.

---

## 4. Data model

Three new tables in `public` schema, plus indexes and RLS policies.

```sql
-- One row per published feed item
create table public.feed_items (
    id                    uuid primary key default gen_random_uuid(),
    source                text not null,
    source_url            text not null,
    source_published_at   timestamptz,
    ingested_at           timestamptz not null default now(),

    -- Generated editorial content
    headline              text not null check (length(headline) between 10 and 100),
    why_nurses_care       text not null check (length(why_nurses_care) between 20 and 180),
    body                  text not null,

    -- Pre-built question for "Ask NurseMind about this"
    ask_followup_prompt   text not null,

    -- Classification
    category              text not null check (category in (
        'drug_safety', 'clinical_guideline', 'public_health',
        'medication_safety', 'licensure', 'research'
    )),
    specialties           text[] not null default '{}',
    nclex_areas           text[] not null default '{}',
    priority              text not null default 'standard' check (priority in ('urgent', 'standard')),

    -- Quality-pipeline metadata
    citations             jsonb not null,
    faithfulness_passed   boolean not null default false,
    safety_regex_passed   boolean not null default false,

    -- Review state (mostly automated)
    review_state          text not null default 'auto_published' check (review_state in (
        'auto_published', 'pending_review', 'approved', 'rejected', 'archived'
    )),
    reviewed_by           text,
    reviewed_at           timestamptz,
    rejection_reason      text,

    -- Lifecycle
    published_at          timestamptz not null default now(),
    archived_at           timestamptz,

    -- Full-text search
    search_vector tsvector generated always as (
        setweight(to_tsvector('english', coalesce(headline, '')), 'A') ||
        setweight(to_tsvector('english', coalesce(why_nurses_care, '')), 'B') ||
        setweight(to_tsvector('english', coalesce(body, '')), 'C')
    ) stored
);

create index feed_items_published_idx on public.feed_items (published_at desc) where archived_at is null;
create index feed_items_specialty_idx on public.feed_items using gin (specialties);
create index feed_items_search_idx    on public.feed_items using gin (search_vector);
create index feed_items_source_url_idx on public.feed_items (source, source_url);

alter table public.feed_items enable row level security;

-- Anyone authenticated reads auto_published or approved, non-archived
create policy "feed_items_select_published" on public.feed_items
    for select using (
        review_state in ('auto_published', 'approved')
        and archived_at is null
    );

-- Only service_role writes


-- Per-user read/save state
create table public.feed_user_state (
    user_id     uuid not null references auth.users(id) on delete cascade,
    item_id     uuid not null references public.feed_items(id) on delete cascade,
    read_at     timestamptz,
    saved_at    timestamptz,
    primary key (user_id, item_id)
);

create index feed_user_state_user_saved_idx on public.feed_user_state (user_id, saved_at desc nulls last);
create index feed_user_state_user_read_idx  on public.feed_user_state (user_id, read_at desc nulls last);

alter table public.feed_user_state enable row level security;
create policy "feed_user_state_own" on public.feed_user_state
    for all using (auth.uid() = user_id) with check (auth.uid() = user_id);


-- Per-item engagement (aggregate, no PII)
create table public.feed_engagement_daily (
    item_id      uuid not null references public.feed_items(id) on delete cascade,
    bucket_date  date not null,
    views        int  not null default 0,
    reads        int  not null default 0,
    saves        int  not null default 0,
    asks         int  not null default 0,
    primary key (item_id, bucket_date)
);

alter table public.feed_engagement_daily enable row level security;
create policy "feed_engagement_select" on public.feed_engagement_daily for select using (auth.role() = 'authenticated');
```

---

## 5. Pipeline architecture

Six edge functions on a daily cron at 04:00 UTC.

```
04:00 UTC daily ──► feed-ingest      (pulls each source's RSS / API; dedupe by source_url;
                    │                  insert raw rows with review_state='pending')
                    ▼
                    feed-author      (Sonnet generates summary per pending row, with source-restricted
                    │                  prompt + style guide + cite-or-refuse regex)
                    ▼
                    feed-verify      (Haiku faithfulness check + clinical-safety verbatim regex;
                    │                  fail → mark 'pending_review')
                    ▼
                    feed-classify    (Haiku tags category, specialties, NCLEX areas, priority)
                    ▼
                    feed-publish     (route to 'auto_published' for clean items; 'pending_review'
                    │                  for items that failed any quality layer)
                    ▼
                    feed-notify      (for newly published urgent items: APNs push to opted-in users
                                       in matching specialties, respecting quiet hours and frequency
                                       caps)
```

**Why edge functions and not Vercel:** Supabase Edge Functions already have the database + service_role envelope, the connection-pool, the secrets management. Stay inside Supabase.

**Failure modes:**

| Failure | Recovery |
|---|---|
| Source RSS down | Skip source for the day; alert Sentry |
| Sonnet returns uncited number | Retry once with stricter prompt prefix; then `pending_review` |
| Haiku faithfulness check fails | `pending_review` |
| Clinical-safety regex fails | `pending_review` |
| Source content paywalled / login-gated | Reject at ingest |
| Duplicate across sources | Pick by source priority (FDA > CDC > AHRQ > research) |
| All sources empty for the day | Editorial empty state in app: *"No new items today. Catch up on this week →"* |

---

## 6. Sources — license-correct corpus

**Tier 1 (ingest week 1):**

| Source | License | Method | Volume |
|---|---|---|---|
| FDA Drug Safety Communications | Public domain | RSS | ~3-5/week |
| FDA Drugs@FDA New Approvals | Public domain | RSS / openFDA API | ~10/week |
| CDC HAN (Health Alert Network) | Public domain | RSS | ~2-4/month |
| CDC MMWR Weekly | Public domain | RSS | ~1 weekly issue |

**Tier 2 (ingest week 2):**

| Source | License | Method | Volume |
|---|---|---|---|
| AHRQ Patient Safety Network | Public domain | RSS | ~1/week |
| NIH Treatment Guidelines (COVID, HIV, etc.) | Public domain | Manual + watch script | irregular |
| VA PBM monographs | Public domain | Web scrape | ~1-2/month |
| ISMP Medication Safety Alerts | Free with attribution | RSS | ~bi-weekly |

**Tier 3 (ingest week 3+):**

| Source | License | Method | Volume |
|---|---|---|---|
| NCSBN News (licensure / NCLEX) | Free with attribution | RSS | irregular |
| PMC Open Access (CC BY / CC0 only) | CC BY / CC0 | E-utilities API + strict license filter | ~5/week |

**Explicitly excluded** (same allowlist as `docs/CONTENT_SOURCING.md` §2): NEJM, JAMA, Lancet, BMJ, StatPearls, AHFS PMI, proprietary newsletters.

---

## 7. iOS UI components

### `FeedTab` (root SwiftUI view)

Routes via a sub-`NavigationStack` for the reading view push. Tab badge state driven by `UserPreferences.feedLastVisitedAt` vs server's `latestPublishedAt`.

### `FeedListView`

Vertical `ScrollView` (not `List` — we need exact control over spacing and hairlines). Items grouped by date with sticky `DateDivider` rows. Pull-to-refresh via `.refreshable { await feedStore.refresh() }`.

```swift
ScrollView {
    LazyVStack(spacing: 0, pinnedViews: [.sectionHeaders]) {
        ForEach(feedStore.itemsByDate, id: \.date) { day in
            Section(header: DateDivider(date: day.date)) {
                ForEach(day.items) { item in
                    FeedCard(item: item)
                        .padding(.horizontal, NMSpace.lg)
                        .background(
                            NavigationLink("", value: FeedDestination.item(item.id))
                                .opacity(0)
                        )
                    Hairline(color: NMColor.borderSubtle)
                }
            }
        }
    }
}
.refreshable { await feedStore.refresh() }
```

### `FeedCard`

The card I detailed in §2. Note: tap region is the whole card via the invisible `NavigationLink`. Long-press → contextual menu with Save, Share, Report inaccuracy.

### `FeedReadingView`

Full-screen push from the list. Layout per §1 Moment 3. Uses `ScrollView` with a sticky top "close" button and a fixed bottom action bar (the "Ask NurseMind about this" CTA always visible).

### `FeedFilterChip` row

Optional horizontal scroll of category chips at the top of the list. *All · Drug safety · Guidelines · Public health · Med safety · Research*. Single-select. Default: *All*. Persisted to `UserPreferences.feedFilter`. Selecting a filter does an immediate in-memory filter (no network re-fetch).

### `FeedStore` (observable state)

```swift
@MainActor @Observable final class FeedStore {
    var itemsByDate: [(date: Date, items: [FeedItem])] = []
    var status: Status = .idle
    var unreadCount: Int = 0

    func refresh() async { ... }
    func markRead(_ itemID: UUID) async { ... }
    func toggleSave(_ itemID: UUID) async { ... }
    func report(_ itemID: UUID, reason: String) async { ... }
}
```

Backed by a Supabase fetch of feed items + a join against `feed_user_state` for the current user. Cached locally with `SwiftData` for offline access.

---

## 8. Notifications

**Trigger:** any item published with `priority = 'urgent'` and `review_state in ('auto_published', 'approved')`.

**Targeting:** users where `notificationsEnabled = true` AND (item's specialties is empty OR includes user's specialty) AND user's quiet-hours window doesn't apply now.

**Frequency cap:** max **1 urgent push per user per 24 hours**, deduped by category. Second urgent item in the same category appears in-app silently.

**APNs payload:**

```json
{
    "aps": {
        "alert": {
            "title": "Drug safety update",
            "subtitle": "FDA · MAY 13",
            "body": "FDA strengthens warning on fluoroquinolones in patients with mental health history."
        },
        "thread-id": "feed.drug_safety",
        "sound": "default",
        "interruption-level": "time-sensitive"
    },
    "feed_item_id": "<uuid>",
    "deep_link": "nursemind://feed/<uuid>"
}
```

Tap → deep links into the Feed reading view for that item.

**Opt-in UX:** the first time an urgent item is generated for a user, prompt them in-app:

> **Drug safety alerts**
> *FDA recalls, CDC advisories, and ISMP safety updates that affect your specialty. Up to one push per day, never during your quiet hours.*
>
> [ Allow ] [ Not now ]

Don't ask on first launch — wait for the first actual urgent item so the value is concrete.

**Quiet hours:** default 22:00 → 07:00 local time. Configurable in Profile → Notifications.

---

## 9. Pro vs Free differentiation

| Feature | Free | Pro |
|---|---|---|
| Read today's items | ✓ | ✓ |
| 7-day archive | ✓ | ✓ |
| 90-day archive | — | ✓ |
| Save for later | ✓ | ✓ |
| "Ask NurseMind about this" | counts against 3/day quota | counts against 50/day quota |
| Specialty filter | implicit (your unit only) | multi-select, save filter combinations |
| Push notifications for urgent items | ✓ (1/day max) | ✓ (configurable cadence, per-category) |
| Search across full archive | last 7 days | full archive |
| "Related entries from Library" panel | ✓ | ✓ |
| Export saved items to email digest | — | ✓ (weekly) |

Free is genuinely useful: daily fresh content, save to bookmarks, ask one or two clarifying AI questions. Pro unlocks depth (archive, search, multi-specialty).

---

## 10. Engineering plan — 4 weeks

### Week 1: Backend foundation

- Supabase migration `20260601_0007_feed.sql` — three new tables, indexes, RLS policies
- `feed-ingest` edge function for Tier 1 sources (FDA DSC, FDA Approvals, CDC HAN, MMWR)
- `feed-author` edge function with source-restricted prompt + style guide
- Sentry alerts on each pipeline stage failure
- Manual smoke test: ingest one day of items, verify dedupe works on second run, verify summaries look right

### Week 2: Quality defenses + classification + UI scaffold

- `feed-verify` edge function (Haiku faithfulness check + clinical-safety regex)
- `feed-classify` edge function (Haiku-based category, specialty, NCLEX, priority tagging)
- `feed-publish` edge function (review-state routing)
- iOS: `FeedTab`, `FeedListView`, `FeedCard`, `FeedReadingView` scaffold (visual spec from §2)
- Filter chips
- Read/save state via `FeedStore`

### Week 3: Polish + push notifications + retraction loop

- APNs setup (device token registration on first launch; tested via Pusher.app first)
- `feed-notify` edge function (quiet-hours + frequency caps + specialty targeting)
- Reading view polish: hero animation, citations panel, related-entries panel
- Long-press contextual menu (Save, Share, Report)
- Tier C reporting integration via existing `flag_reports` table

### Week 4: Dogfood + ship

- Internal TestFlight with 5 nurse beta testers
- Iterate on summary quality based on actual generated items (tune prompts if patterns emerge)
- Tune classification accuracy
- Public TestFlight 7-day soak
- App Store submission for v1.1

---

## 11. Risks + mitigations

| Risk | Mitigation |
|---|---|
| AI hallucinates a dose or fact | Layers 1–4 (source-restricted prompt, cite-or-refuse, faithfulness verify, verbatim regex) catch ~99.9% pre-publish; Layer 7 (user reports) catches the rest within hours |
| Editorial voice drifts | Single style-guide prompt prefix; spot-check by reading 5 items per week; iterate prompt as needed |
| Source goes dark | Sentry alerts; skip for the day; quarterly source-health review |
| Notification fatigue | Hard cap 1 urgent push per day per user; quiet hours default 22:00–07:00; opt-in deferred to first urgent item; track opt-out rate weekly |
| Source duplication (FDA + CDC same recall) | Dedupe by canonical-URL family + headline-similarity threshold during ingest |
| License compliance creep | Per-source ingest scripts hard-code allowed source domains; reject at fetch time for any URL not in allowlist |
| Apple App Review flags as "medical advice" | Every item is sourced and cited; clearly framed as "Why nurses care" (educational, not directive); citation visibility; honest disclaimer; same FDA CDS safe-harbor posture as the rest of the app |
| Slow source (FDA RSS sometimes hangs) | 30s per-source timeout; partial ingest is fine; skip source and retry next day |

---

## 12. Success metrics

Measured six weeks after v1.1 ship:

| Metric | Target |
|---|---|
| DAU on Feed tab / total DAU | > 60% |
| Median session time on Feed | > 90 sec |
| % of Feed sessions that tap "Ask NurseMind" | > 8% |
| Push notification opt-in rate (among users who saw the prompt) | > 35% |
| 30-day retention — Feed cohort vs pre-Feed control | +12 pp |
| Pro conversion among DAUs who use Feed daily | +50% vs non-Feed users |
| Faithfulness-verify rejection rate | < 8% (above 8% means prompt needs tuning) |
| User-reported feed-item errors per 1000 views | < 0.5 |

---

## 13. Known caveats / deferred items

These came out of a self-critique pass on rev 2 of this scope. Each is intentional — flagged here so the v1.1 implementation doesn't get blindsided.

### A. "Related in Library" panel in the reading view → defer to v1.2

§1 Moment 3 sketches a *Related in Library* section in the reading view. The pipeline doesn't have a step to populate it: item-to-library similarity matching needs its own design (semantic embeddings via OpenAI text-embedding-3-small over the existing library, then `match_count(feed_item.body, k=3)`). It's a real feature but adds a week of work and a separate evaluation phase. **Reading view ships in v1.1 without this section.** Citations + the "Ask NurseMind about this" CTA carry the cross-sell load.

### B. Quiet hours storage → separate small migration

Server-side `feed-notify` needs to read the user's quiet-hours window to suppress pushes during sleep. The current `profiles` table doesn't have columns for this. Add in a focused follow-on migration `20260603_0009_profile_quiet_hours.sql`:

```sql
alter table public.profiles
    add column if not exists quiet_hours_start time not null default '22:00:00',
    add column if not exists quiet_hours_end   time not null default '07:00:00';
```

Plus an iOS Profile → Notifications settings row with two time pickers. ~1 day of work, fits into v1.1's Week 3 (push notifications + retraction loop).

### C. 7-day free-tier archive cutoff → query-time filter, not schema-level

RLS can't easily filter by user tier without joining `profiles`, which complicates policy semantics and slows hot-path queries. Instead, the iOS app applies a date filter at query time based on the user's tier from `UserPreferences`:

```swift
let cutoff = prefs.subscriptionTier.isPro
    ? Calendar.current.date(byAdding: .day, value: -90, to: .now)!
    : Calendar.current.date(byAdding: .day, value: -7,  to: .now)!
```

Schema stays simple. The free archive cap is enforceable client-side and trivially adjustable later (extend to 14 days as a "delight" upgrade, say).

### D. Push notification permission — manual opt-in toggle as a fallback path

The "deferred until first urgent item" prompt is one-shot. On iOS you can only request push permission once per install; if the user denies, you can't programmatically re-ask. A user who uses the app for months without seeing an urgent item never gets prompted, then *can't* opt in even if they later want to.

**Mitigation:** also expose a manual *"Enable push notifications"* row in Profile → Notifications. The deferred prompt is the default-on path (most users); the manual toggle is the secondary path (users who want push *now*, or who initially denied and changed their mind).

### E. Time-sensitive notification entitlement

The APNs payload in §8 uses `interruption-level: time-sensitive`, which requires the Time-Sensitive Notifications capability. Add to `Nursemind.entitlements`:

```xml
<key>com.apple.developer.usernotifications.time-sensitive</key>
<true/>
```

And declare in App Store Connect when submitting v1.1 that NurseMind uses time-sensitive notifications for urgent drug-safety alerts. Apple reviewers will scrutinize — the justification is clean (drug safety alerts have time-bounded clinical relevance).

### F. `flag_reports.target_type` extension

The original draft of the migration tried to dynamically extend the CHECK constraint on `flag_reports.target_type` to accept `'feed_item'`. Removed because the constraint name varies across environments and the dynamic block is fragile. Add in a focused follow-on `20260602_0008_flag_reports_feed.sql` once we've verified the constraint name in the deployed schema.

---

## 14. Path to genuinely perfect — what's missing from rev 2

A self-critique pass on rev 2 surfaced three categories of gap. Each gets a concrete addition or a deliberate deferral so the v1.1 build doesn't get stuck filling in the missing pieces ad-hoc.

### 14.A — Reliability & smoothness gaps

**Offline cache** (P0, ~1 day). The feed gets opened on commutes. Without a local cache, no signal = empty feed = product feels broken. Implementation: SwiftData store of last 50 items + `feed_user_state`. Cache-then-network pattern. Subtle *"Showing cached · last updated 2h ago"* footer when offline.

**Pipeline-failure visibility** (P0, ~3 hours). Sentry alert if `feed_items` had < 2 new auto-published rows in the trailing 24h window. Daily 06:00 UTC email digest summarizing what published, what's pending review, what errored. Prevents silent multi-day outages.

**Hero animation polish** (P1, defer to v1.2). The card → reading-view `matchedGeometryEffect` is aspirational. SwiftUI inside NavigationStack has known sharp edges. v1.1 ships with a tasteful standard navigation push transition; v1.2 invests in proper hero animation when there's time to iterate on edge cases.

### 14.B — UI/UX polish vectors

Eight specific touches the rev-2 spec is missing. None individually large; together they're the difference between *another feed* and *NurseMind's feed*.

**1. Reading-time estimates on cards.** Mono-numeric `2 MIN READ` appended to the eyebrow row. Computed at author-time from body word count ÷ 220 wpm.

**2. Specialty-match badge in the eyebrow.** When `feed_item.specialties` includes the user's unit, append `· FOR ICU` (or whatever the unit is) to the eyebrow row. Same mono-caps treatment, no colorful chrome.

**3. Urgent vertical accent line.** 2pt-wide accent-green line on the left edge of urgent cards, full card height. Quiet differentiation, instantly readable.

**4. Save micro-interaction.** Tap save → 200ms cross-fade from *"Save"* to accent-check + *"Saved"*, plus `Haptic.success()`, plus a 600ms vertical accent line on the card's left edge that fades. Three coordinated touches.

**5. Reading-view scroll-progress bar.** 1.5pt accent-green line at top of reading view, expanding left-to-right with scroll. Same pattern as Substack and Medium.

**6. "Next item" affordance at the bottom of the reading view.** After the disclaimer, a hairline-divided card-preview of the next item in the feed. Substack does this exceptionally — single highest-leverage retention pattern in modern reading apps.

**7. Saved-filter chip alongside category chips.** Tap to view only saved items, sorted by `saved_at desc`.

**8. Explicit empty / error states (sketches required before build):**
   - First-launch zero items: *"NurseMind is just getting started. Check back tomorrow morning."* (with subtle calendar glyph or accent dot animation)
   - No items matching active filter: *"No "{category}" items this week."* + a tap-target to clear the filter
   - Network failure / offline: *"You're offline. Showing cached items from {time}."*
   - No saved items in the saved view: *"Tap save on any item to keep it here."*

Each state needs a hand-drawn sketch before the developer starts — otherwise the empty states get filled in with whatever instinct produces, which is generic.

### 14.C — Content density gaps

Realistic source cadence gives **~2 published items/day**, not 15. To get to a content density that justifies a daily open, three supplementations:

**A. Editorial original channel.** Founder-written longer pieces. Schema: existing `feed_items` table, with `source = 'nursemind_editorial'`, `citations` referencing the founder + (optionally) external sources, and `review_state = 'auto_published'`. These pieces don't go through the AI pipeline at all — they're written and posted directly. Cadence: 1–2/week. Cost: founder time. Value: gives NurseMind a voice; doubles weekly content density.

**B. Library-update items.** When the curated library publishes a new drug/lab/procedure/scenario, the publish process also creates a feed item with `source = 'nursemind_library_update'`, a one-line summary of the new entry, and `citations` pointing to the library entry itself. Cross-promotes the library and surfaces fresh reference content. ~1–2/week passive.

**C. Weekly Q&A digest.** A pipeline addition: once a week (Sunday 06:00 UTC), an edge function aggregates the top-N AI co-pilot questions across all users in the last 7 days (anonymized via the existing PHI scrubber), picks the highest-engagement question, generates a longer editorial response, and publishes as a feed item with `source = 'nursemind_q_and_a'`. Editorial framing: *"This week, hundreds of you asked about magnesium for torsades. Here's the consolidated answer."* Creates a meta-loop: AI co-pilot data → Feed → drives users back to AI co-pilot. ~1/week.

Net: content density goes from **~2/day to ~4–5/day**, plus the brand develops a recognizable editorial voice instead of feeling like a generic aggregator.

### 14.D — Engineering plan addendum

The original 4-week plan stays. Adding work to each week:

- **Week 1:** Also implement the offline SwiftData cache scaffold.
- **Week 2:** Also implement the editorial-original channel (`source = 'nursemind_editorial'`) — gives the founder a way to publish during the v1.1 dogfood phase.
- **Week 3:** Also implement the polish vectors (§14.B 1–7). The empty/error state sketches (§14.B 8) come from you, not me — they need design intuition that lives in your head.
- **Week 4:** Also implement the weekly Q&A digest function. Internal monitoring (Sentry alerts + daily email digest).

Total added work: ~1 week distributed across the existing 4. The 4-week target slips to ~5 weeks if all of §14 is in-scope. Recommend cutting §14.A "Hero animation polish" and §14.B "Saved-filter chip" if 4 weeks is hard.

---

## 15. Decisions you need to make now (before v1 ships)

So the schema and entitlement work doesn't slow v1.1.

1. **Tab placement:** between Ask and Library, position 2. *Confirmed.*
2. **Default daily ingest time:** 04:00 UTC (content lands ~6 AM US Eastern, in time for the morning shift). *Recommendation: confirm.*
3. **Free archive depth:** 7 days. *Recommendation: confirm.*
4. **Review model:** fully automated, no paid reviewers, multi-layer AI defenses + user-report retraction. *Confirmed.*
5. **Push notification opt-in timing:** deferred to first urgent item, not on first launch. *Recommendation: confirm.*
6. **Quiet hours default:** 22:00–07:00 local. *Recommendation: confirm; can be changed per-user in Profile → Notifications.*
7. **Reading view "Ask NurseMind about this" button:** counts against AI daily quota same as a direct Ask. *Recommendation: confirm.*
8. **Bottom-of-reading-view AI disclaimer wording:** *"AI-generated summary · verify against source for clinical decisions"*. *Recommendation: confirm.*

---

## Where this fits in the bigger roadmap

- **v1 launch (~late May):** library + calculators + AI + paywall + auth + onboarding. Already scoped, building now.
- **v1.1 (~mid-late June):** Feed (this doc) + bug fixes from v1 beta.
- **v1.2 (~July):** Growth Map (the personal layer, now informed by both Library and Feed activity).
- **v1.5 (Month 4–5):** NGN question bank, Apple Watch glance for Feed headlines, weekly editorial recap.
- **v2 (Month 6+):** Android, web, EHR integrations.

The Feed becomes the daily-driver retention surface. The Growth Map becomes the personalization layer on top. The AI co-pilot remains the depth tool. The library is the floor.
