-- Only the edge function may consume/refund authoritative allowances.
revoke all on function public.consume_ask_quota(uuid, int) from public, anon, authenticated;
revoke all on function public.consume_ask_quota_v2(uuid) from public, anon, authenticated;
revoke all on function public.refund_ask_quota(uuid) from public, anon, authenticated;
grant execute on function public.consume_ask_quota(uuid, int) to service_role;
grant execute on function public.consume_ask_quota_v2(uuid) to service_role;
grant execute on function public.refund_ask_quota(uuid) to service_role;

-- Failed requests can refund question allowance, but cannot fund unlimited retries.
create table public.ai_request_attempts (
    user_id uuid not null references auth.users(id) on delete cascade,
    usage_date date not null default current_date,
    count integer not null default 0 check (count >= 0),
    primary key (user_id, usage_date)
);
alter table public.ai_request_attempts enable row level security;
revoke all on public.ai_request_attempts from anon, authenticated;

create or replace function public.reserve_ai_request(p_user_id uuid)
returns table (remaining integer, tier text, cap integer)
language plpgsql security definer set search_path = public
as $$
declare
    v_tier text;
    v_cap integer;
    v_attempts integer;
begin
    select coalesce(p.subscription_tier, 'free') into v_tier from public.profiles p where p.id = p_user_id;
    v_tier := coalesce(v_tier, 'free');
    v_cap := case when v_tier in ('proMonthly', 'proYearly') then 50 else 3 end;
    insert into public.ai_request_attempts as attempts (user_id, usage_date, count)
    values (p_user_id, current_date, 1)
    on conflict (user_id, usage_date) do update set count = attempts.count + 1
      where attempts.count < greatest(12, v_cap * 3)
    returning count into v_attempts;
    if v_attempts is null then
        return query select -1, v_tier, v_cap;
        return;
    end if;
    return query select public.consume_ask_quota(p_user_id, v_cap), v_tier, v_cap;
end;
$$;
revoke all on function public.reserve_ai_request(uuid) from public, anon, authenticated;
grant execute on function public.reserve_ai_request(uuid) to service_role;
