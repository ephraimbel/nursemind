import { PGlite } from "npm:@electric-sql/pglite@0.3.14"
import { assertEquals } from "jsr:@std/assert@1"

const db = new PGlite()
try {
  await db.exec(`
    create role anon;
    create role authenticated;
    create role service_role;
    create schema auth;
    create table auth.users (id uuid primary key);
    create table public.profiles (id uuid primary key references auth.users(id), subscription_tier text);
    insert into auth.users values ('00000000-0000-0000-0000-000000000001'), ('00000000-0000-0000-0000-000000000002');
    insert into public.profiles values ('00000000-0000-0000-0000-000000000001', 'free'), ('00000000-0000-0000-0000-000000000002', 'proYearly');
  `)
  for (const file of ["20260507_0005_daily_usage.sql", "20260702_0010_ask_quota_v2.sql", "20260917_0013_ai_request_limits.sql"]) {
    await db.exec(await Deno.readTextFile(new URL(`../supabase/migrations/${file}`, import.meta.url)))
  }
  for (const role of ["anon", "authenticated"]) {
    for (const fn of ["consume_ask_quota(uuid,integer)", "consume_ask_quota_v2(uuid)", "refund_ask_quota(uuid)", "reserve_ai_request(uuid)"]) {
      const result = await db.query<{ allowed: boolean }>("select has_function_privilege($1, $2, 'EXECUTE') as allowed", [role, `public.${fn}`])
      assertEquals(result.rows[0].allowed, false, `${role} must not execute ${fn}`)
    }
  }
  const free = "00000000-0000-0000-0000-000000000001"
  const pro = "00000000-0000-0000-0000-000000000002"
  const reserve = async (id: string) => (await db.query<{ remaining: number; tier: string; cap: number }>("select * from public.reserve_ai_request($1)", [id])).rows[0]
  await db.exec("set role service_role")
  assertEquals(await reserve(free), { remaining: 2, tier: "free", cap: 3 })
  assertEquals((await reserve(free)).remaining, 1)
  assertEquals((await reserve(free)).remaining, 0)
  assertEquals((await reserve(free)).remaining, -1)
  await db.query("select public.refund_ask_quota($1)", [free])
  assertEquals((await reserve(free)).remaining, 0)
  for (let count = 5; count < 12; count++) {
    await db.query("select public.refund_ask_quota($1)", [free])
    assertEquals((await reserve(free)).remaining, 0)
  }
  await db.query("select public.refund_ask_quota($1)", [free])
  assertEquals((await reserve(free)).remaining, -1, "refunded requests cannot evade the attempt limit")
  for (let count = 0; count < 50; count++) assertEquals((await reserve(pro)).remaining, 49 - count)
  assertEquals((await reserve(pro)).remaining, -1)
  await db.exec("reset role")
  console.log("SQL migration passed: role restrictions, free/pro caps, refunds, and bounded retries")
} finally {
  await db.close()
}
