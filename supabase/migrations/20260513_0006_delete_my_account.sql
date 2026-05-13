-- ===========================================================================
-- Slice: in-app account deletion (Apple Guideline 5.1.1(v))
-- ===========================================================================
-- Apple requires apps that let users create an account to also provide an
-- in-app account-deletion path. NurseMind's anonymous Supabase auth counts as
-- an account for this purpose, so a "Delete Account" affordance is mandatory.
--
-- This function is invoked from iOS as:
--     supabase.rpc("delete_my_account")
--
-- It deletes the caller's row from `auth.users`. ON DELETE CASCADE relationships
-- on `profiles`, `saved_answers`, and `daily_usage` will cascade-clean those
-- rows automatically. `flag_reports.user_id` uses ON DELETE SET NULL so the
-- flagged content survives for ongoing review even after the reporter's
-- account is gone — the review queue isn't a personal data record.
--
-- SECURITY DEFINER lets the function delete from `auth.users` (which the
-- authenticated role can't touch directly). The function only ever deletes
-- the row matching `auth.uid()`, so a caller can only delete themselves.
-- ===========================================================================

create or replace function public.delete_my_account()
returns void
language plpgsql
security definer
set search_path = public, auth
as $$
declare
    v_user_id uuid := auth.uid();
begin
    if v_user_id is null then
        raise exception 'Not authenticated';
    end if;

    -- Cascades from auth.users:
    --   public.profiles.id          → ON DELETE CASCADE
    --   public.saved_answers.user_id → ON DELETE CASCADE
    --   public.daily_usage.user_id   → ON DELETE CASCADE
    --   public.flag_reports.user_id  → ON DELETE SET NULL (reports survive)
    -- auth.identities, auth.sessions, auth.refresh_tokens — also cascade.
    delete from auth.users where id = v_user_id;
end;
$$;

grant execute on function public.delete_my_account() to authenticated;
