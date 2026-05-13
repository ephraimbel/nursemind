// =============================================================================
// _shared/supabase.ts — Admin client + ingest-queue helpers.
//
// All Feed-pipeline writes happen with the service_role key. RLS is on for
// every Feed table; the pipeline bypasses RLS deliberately because the data
// is curated/system content, not user-owned.
// =============================================================================

import { createClient, SupabaseClient } from "jsr:@supabase/supabase-js@2"

const SUPABASE_URL              = Deno.env.get("SUPABASE_URL")              ?? ""
const SUPABASE_SERVICE_ROLE_KEY = Deno.env.get("SUPABASE_SERVICE_ROLE_KEY") ?? ""

let cachedAdmin: SupabaseClient | null = null

export function adminClient(): SupabaseClient {
    if (!SUPABASE_URL || !SUPABASE_SERVICE_ROLE_KEY) {
        throw new Error("SUPABASE_URL or SUPABASE_SERVICE_ROLE_KEY is not set")
    }
    if (!cachedAdmin) {
        cachedAdmin = createClient(SUPABASE_URL, SUPABASE_SERVICE_ROLE_KEY, {
            auth: { persistSession: false },
        })
    }
    return cachedAdmin
}

// -----------------------------------------------------------------------------
// Ingest queue
// -----------------------------------------------------------------------------

export type IngestRow = {
    source: string
    source_url: string
    source_title: string
    source_excerpt: string | null
    source_published_at: string | null  // ISO timestamp or null
    raw_payload: Record<string, unknown>
}

export type IngestInsertResult = {
    inserted: number
    duplicates: number
    errors: number
}

/**
 * Insert a batch of raw RSS items into feed_ingest_queue. Relies on the
 * unique (source, source_url) constraint to dedupe — duplicate inserts are
 * counted as `duplicates`, not failures.
 *
 * Returns counts only. The caller is responsible for logging individual
 * errors via the Supabase client error field.
 */
export async function insertIngestRows(rows: IngestRow[]): Promise<IngestInsertResult> {
    if (rows.length === 0) return { inserted: 0, duplicates: 0, errors: 0 }

    const admin = adminClient()
    let inserted = 0
    let duplicates = 0
    let errors = 0

    // Insert one row at a time so a single bad row doesn't fail the whole
    // batch and so duplicate-key errors per-row are counted accurately. Tier 1
    // sources rarely exceed 10 items/run, so the N+1 hit is irrelevant.
    for (const row of rows) {
        const { error } = await admin
            .from("feed_ingest_queue")
            .insert(row)

        if (!error) {
            inserted++
            continue
        }

        // Postgres unique-violation code is 23505. Supabase surfaces this as
        // PGRST code "23505" or message containing "duplicate key".
        const code = (error as { code?: string }).code ?? ""
        const msg = error.message ?? ""
        if (code === "23505" || msg.includes("duplicate key")) {
            duplicates++
            continue
        }

        errors++
        console.error("feed_ingest_queue insert failed", {
            source: row.source,
            source_url: row.source_url,
            code,
            message: msg,
        })
    }

    return { inserted, duplicates, errors }
}
