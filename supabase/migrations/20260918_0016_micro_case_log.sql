-- ===========================================================================
-- R4 — Daily micro-case answer log
-- ===========================================================================
-- Cases ship compiled in the app. The server keeps one row per user per day:
-- which case, which option, whether it was the best step. No free text.
-- Apply via the dashboard SQL editor or `supabase db push`. Idempotent.
-- ===========================================================================

create table if not exists public.micro_case_answers (
    user_id        uuid        not null references auth.users(id) on delete cascade,
    answered_on    date        not null,
    case_id        text        not null,
    chosen_option  smallint    not null check (chosen_option between 0 and 3),
    correct        boolean     not null,
    answered_at    timestamptz not null default now(),
    primary key (user_id, answered_on)
);

comment on table public.micro_case_answers is
    'One row per user per day for the daily clinical-judgment case. '
    'Dashboard aggregate only; never read back into the app.';

create index if not exists micro_case_answers_case_idx
    on public.micro_case_answers (case_id, answered_on);

alter table public.micro_case_answers enable row level security;

drop policy if exists "micro_case_answers_select_own" on public.micro_case_answers;
drop policy if exists "micro_case_answers_insert_own" on public.micro_case_answers;
drop policy if exists "micro_case_answers_update_own" on public.micro_case_answers;

create policy "micro_case_answers_select_own" on public.micro_case_answers
    for select using (auth.uid() = user_id);
create policy "micro_case_answers_insert_own" on public.micro_case_answers
    for insert with check (auth.uid() = user_id);
create policy "micro_case_answers_update_own" on public.micro_case_answers
    for update using (auth.uid() = user_id) with check (auth.uid() = user_id);

grant select, insert, update on public.micro_case_answers to authenticated;

-- Dashboard view (service_role / SQL editor only).
drop view if exists public.micro_case_daily_stats;
create view public.micro_case_daily_stats as
select
    answered_on,
    case_id,
    count(*)                                         as answers,
    round(avg(case when correct then 1 else 0 end), 3) as correct_rate
from public.micro_case_answers
group by answered_on, case_id
order by answered_on desc;

revoke all on public.micro_case_daily_stats from anon, authenticated;
