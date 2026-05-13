-- ===========================================================================
-- Slice #2: server-backed user profile + library state
-- ===========================================================================
-- Single `profiles` table, one row per auth.users.id. Holds everything that
-- currently lives in `UserPreferences` on the client. RLS ensures each user
-- can only see and mutate their own row. Triggered `updated_at` is used by
-- the iOS sync service to decide which side wins on a bidirectional pull.
--
-- Run this via Supabase Dashboard → SQL Editor (or `supabase db push` once
-- the CLI is wired up). Idempotent: safe to re-run.
-- ===========================================================================

-- Profile + library state. Arrays are native text[]; JSON would also work
-- but text[] gives us native ordering, indexing, and Postgres operators.
create table if not exists public.profiles (
    id                          uuid primary key references auth.users(id) on delete cascade,

    -- Profile (mirrors UserPreferences scalar fields)
    display_name                text         not null default '',
    role                        text         not null default 'rn',
    unit                        text         not null default 'medSurg',
    icu_subspecialty            text,
    years_experience            integer,
    preferred_appearance        text         not null default 'system',
    notifications_enabled       boolean      not null default true,
    weekly_tip_enabled          boolean      not null default true,
    safety_contract_agreed_at   timestamptz,

    -- Library state
    pinned_entry_ids            text[]       not null default '{}',
    recent_entry_ids            text[]       not null default '{}',
    pinned_calculator_ids       text[]       not null default '{}',
    recent_calculator_ids       text[]       not null default '{}',

    created_at                  timestamptz  not null default now(),
    updated_at                  timestamptz  not null default now()
);

-- Lightweight CHECK constraints so the server rejects values that would
-- crash the client's enum decoder. Keep these aligned with the iOS enums:
--   UserRole:         student / rn / lpn / cna / other
--   NursingUnit:      medSurg / icu / er / stepDown / lAndD / pediatrics /
--                     nicu / oncology / orthopedics / operatingRoom /
--                     psychMentalHealth / homeHealth / longTermCare /
--                     clinic / school / other
--   ICUSubspecialty:  mixed / medical / surgical / cardiac / cardiothoracic /
--                     neuro / trauma / burn  (or null when unit != icu)
--   AppearanceTheme:  system / light / dark
do $$ begin
    alter table public.profiles
        add constraint profiles_role_chk
        check (role in ('student','rn','lpn','cna','other'));
exception when duplicate_object then null; end $$;

do $$ begin
    alter table public.profiles
        add constraint profiles_unit_chk
        check (unit in (
            'medSurg','icu','er','stepDown','lAndD','pediatrics','nicu',
            'oncology','orthopedics','operatingRoom','psychMentalHealth',
            'homeHealth','longTermCare','clinic','school','other'
        ));
exception when duplicate_object then null; end $$;

do $$ begin
    alter table public.profiles
        add constraint profiles_icu_subspecialty_chk
        check (icu_subspecialty is null or icu_subspecialty in (
            'mixed','medical','surgical','cardiac','cardiothoracic',
            'neuro','trauma','burn'
        ));
exception when duplicate_object then null; end $$;

do $$ begin
    alter table public.profiles
        add constraint profiles_appearance_chk
        check (preferred_appearance in ('system','light','dark'));
exception when duplicate_object then null; end $$;

do $$ begin
    alter table public.profiles
        add constraint profiles_years_chk
        check (years_experience is null or (years_experience >= 0 and years_experience < 80));
exception when duplicate_object then null; end $$;

-- Auto-bump updated_at on every UPDATE so the client's last-write-wins
-- comparison is reliable without trusting client clocks.
create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
    new.updated_at = now();
    return new;
end;
$$;

drop trigger if exists profiles_set_updated_at on public.profiles;
create trigger profiles_set_updated_at
    before update on public.profiles
    for each row execute function public.set_updated_at();

-- =============================================================================
-- Row Level Security
-- =============================================================================
-- A user can read, insert, and update only their own row. No DELETE policy —
-- ON DELETE CASCADE on auth.users handles cleanup if the account is removed.
-- Anonymous users (Supabase signInAnonymously) get a real UUID and can use
-- this table just like email-authenticated users; the upgrade path in slice #4
-- preserves the same UUID via auth.linkIdentity.
-- =============================================================================

alter table public.profiles enable row level security;

drop policy if exists "profiles_select_own" on public.profiles;
create policy "profiles_select_own"
    on public.profiles
    for select
    using (auth.uid() = id);

drop policy if exists "profiles_insert_own" on public.profiles;
create policy "profiles_insert_own"
    on public.profiles
    for insert
    with check (auth.uid() = id);

drop policy if exists "profiles_update_own" on public.profiles;
create policy "profiles_update_own"
    on public.profiles
    for update
    using (auth.uid() = id)
    with check (auth.uid() = id);
