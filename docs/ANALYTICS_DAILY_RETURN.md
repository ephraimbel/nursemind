# Daily-return analytics (R1)

Event contract and dashboard definition for the Daily-return roadmap in `docs/PLAN.md`. Client events go to PostHog through `AnalyticsSinks.postHog` (`Packages/NursemindCore/Sources/NursemindCore/Analytics/`). Every event is mirrored to the unified log under category `Analytics` so a simulator run can be checked without a PostHog token.

**Privacy contract.** Properties carry identifiers, enum raw values, counts and durations only. No headline, dek, body, entry text, search query or question text. `FeedAnalyticsTests.noEventCarriesStoryText` pins this.

## Event dictionary

### Session

| Event | Fires | Properties |
|---|---|---|
| `session_started` | Cold launch and every return from background. Not on inactive → active. | `origin_tab` (`ask` / `feed` / `library` / `profile`), `cold_launch` bool, `from_notification` bool, `notification_kind` (only when true; set by R3) |

Retention denominator: a user is active on a day if they have ≥1 `session_started`. PostHog's autocaptured `Application Opened` stays on as a cross-check.

### Feed funnel

| Event | Fires | Properties |
|---|---|---|
| `feed_opened` | Feed tab becomes visible (NavigationStack appear). Not on pop back from a story. | `item_count`, `unread_this_week`, `load_state` (`idle` / `loading` / `loaded` / `failed`) |
| `feed_filter_changed` | A filter chip is selected. | `from`, `to` (`this_week` / `all` / `saved` / `category:<raw>`) |
| `feed_item_opened` | A card is tapped. | item props + `filter`, `position` (0 = lead), `is_lead` |
| `feed_item_read_end` | Reading view disappears (back, tab switch, library link). | item props + `dwell_s` (whole seconds, capped 1800) |
| `feed_item_saved` / `feed_item_unsaved` | Bookmark toggled and the server write succeeded. | item props |
| `feed_ask_handoff` | An Ask quick action chosen from a story. | item props + `action` (`quick_summary` / `nursing_takeaways` / `suggested_question` / `ask_your_own`) |
| `feed_library_link_opened` | An "In your library" row tapped. | item props + `entry_id` (prefixed, e.g. `drug:heparin`), `position` |

Item props on every feed item event: `item_id` (lowercase uuid), `category` (raw), `priority` (`urgent` / `standard`), `source` (publisher label), `age_days` (from `source_published_at`, else `published_at`, floored at 0).

### Already emitted elsewhere (used by the dashboard, unchanged)

`tab_switched`, `library_entry_viewed`, `question_asked`, `question_completed`, `search_performed`, `paywall_viewed`, `purchase_*`, `onboarding_completed`.

## Example: one session

A nurse opens the app from the home screen on the Feed tab, reads the lead story for 38 seconds, saves it, opens the heparin monograph from it, and backgrounds the app.

```
session_started            origin_tab=feed cold_launch=true from_notification=false
feed_opened                item_count=0 unread_this_week=0 load_state=idle
feed_item_opened           item_id=a34f… category=drug_safety priority=urgent source=FDA MedWatch age_days=1 filter=this_week position=0 is_lead=true
feed_item_saved            item_id=a34f… category=drug_safety priority=urgent source=FDA MedWatch age_days=1
feed_library_link_opened   item_id=a34f… … entry_id=drug:heparin position=0
feed_item_read_end         item_id=a34f… … dwell_s=38
tab_switched               from=feed to=library
library_entry_viewed       slug=heparin duration_sec=71
```

The first `feed_opened` of a launch reports `load_state=idle` with zero items because the tab appears before the list hydrates. That is expected; filter on `load_state=loaded` for content-availability questions.

## Dashboard: "Daily return"

Build in PostHog → Dashboards → New. One dashboard, four rows. All insights use the last 30 days unless stated.

**Row 1: Are people coming back?**
1. Trends: DAU / WAU / MAU as unique users of `session_started`. Breakdown by person property `tier` (set from `question_asked.tier`; add an `identify` call with tier in a follow-up if the breakdown is empty).
2. Retention: `session_started` → `session_started`, daily, 30-day window. Read D1, D7, D30 from the table.
3. Retention (cohort): same, filtered to users whose first `session_started` is in the last 14 days, to see whether the current build changes anything.

**Row 2: What do they open the app to do?**
4. Trends: `session_started` count, breakdown by `origin_tab`, stacked bar, weekly.
5. Trends: `session_started` where `cold_launch=false` versus `true`, to separate shift-time reopens from installs.

**Row 3: Does Feed earn its tab?**
6. Funnel, per user, 1-day conversion window: `feed_opened` (where `load_state=loaded`) → `feed_item_opened` → `feed_item_read_end` (where `dwell_s ≥ 10`) → any of `feed_item_saved`, `feed_ask_handoff`, `feed_library_link_opened`.
7. Trends: median `dwell_s` of `feed_item_read_end`, weekly.
8. Trends: `feed_item_opened` count, breakdown by `category`.
9. Trends: `feed_item_opened` count, breakdown by `age_days` bucketed (0, 1–7, 8+). If most opens sit at 8+, the pipeline is starving the week, not the ranking.
10. Trends: `feed_ask_handoff` breakdown by `action`.

**Row 4: Bundle health (unchanged events)**
11. Trends: unique users with both `question_asked` and `library_entry_viewed` on the same day. This is the North Star from PLAN.md §8.
12. Trends: `feed_library_link_opened` count. Feed → Library is the bundle expressing itself.

### R2 to R4 hooks already in the schema
- R2 watchlist: `feed_item_opened` gains `matched_pinned`; the funnel splits on it.
- R3 push: `session_started.from_notification` and `notification_kind` are wired; open rate = sessions with `from_notification=true` ÷ sends logged server-side.
- R4 micro-case: new `micro_case_*` events; the retention insight gets a cohort split on answered-in-first-session.

## Verifying on a simulator

```bash
xcrun simctl spawn booted log stream --level debug --predicate 'subsystem == "app.nursemind.ios" AND category == "Analytics"'
```

Then open Feed, tap a card, save it, tap an "In your library" row, and background the app. Each line above should appear once.
