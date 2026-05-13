#!/usr/bin/env bash
# =============================================================================
# deploy-feed-pipeline.sh — One-shot deployment of the v1.1 Feed backend.
#
# Prerequisites:
#   - SUPABASE_ACCESS_TOKEN env var set to a Supabase Personal Access Token.
#     Generate at https://supabase.com/dashboard/account/tokens
#   - ANTHROPIC_API_KEY env var set to the project's Anthropic key.
#     (If unset, the script attempts to read it from Nursemind/Secrets.swift.)
#
# What this does (in order):
#   1. supabase link to project rxyzlzcovhfxjmfgeila
#   2. supabase db push — applies feed migrations 0007 + 0008
#   3. supabase secrets set ANTHROPIC_API_KEY
#   4. supabase functions deploy — all six feed-* functions
#   5. Invoke feed-ingest manually to seed the queue
#   6. Invoke feed-author + feed-verify + feed-classify + feed-publish in sequence
#   7. Report final feed_items count
# =============================================================================

set -euo pipefail
cd "$(dirname "$0")/.."

PROJECT_REF="rxyzlzcovhfxjmfgeila"
PROJECT_URL="https://${PROJECT_REF}.supabase.co"
FUNCTIONS=(feed-ingest feed-author feed-verify feed-classify feed-publish feed-notify)

# -----------------------------------------------------------------------------
# Pre-flight
# -----------------------------------------------------------------------------

if [[ -z "${SUPABASE_ACCESS_TOKEN:-}" ]]; then
    echo "ERROR: SUPABASE_ACCESS_TOKEN must be set." >&2
    echo "Generate one at https://supabase.com/dashboard/account/tokens" >&2
    exit 1
fi

# Anthropic key — argv > env > Secrets.swift
if [[ -n "${1:-}" ]]; then
    ANTHROPIC_API_KEY="$1"
elif [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
    ANTHROPIC_API_KEY=$(grep -oE 'sk-ant-api03-[A-Za-z0-9_-]+' Nursemind/Secrets.swift | head -1 || true)
fi
if [[ -z "${ANTHROPIC_API_KEY:-}" ]]; then
    echo "ERROR: ANTHROPIC_API_KEY not set and not found in Nursemind/Secrets.swift" >&2
    exit 1
fi

echo "==> Linking project $PROJECT_REF"
supabase link --project-ref "$PROJECT_REF" > /dev/null

# -----------------------------------------------------------------------------
# Migrations
# -----------------------------------------------------------------------------
echo "==> Applying database migrations (feed 0007 + 0008)"
supabase db push

# -----------------------------------------------------------------------------
# Secrets
# -----------------------------------------------------------------------------
echo "==> Setting ANTHROPIC_API_KEY secret"
supabase secrets set "ANTHROPIC_API_KEY=$ANTHROPIC_API_KEY" > /dev/null

# -----------------------------------------------------------------------------
# Deploy functions
# -----------------------------------------------------------------------------
for fn in "${FUNCTIONS[@]}"; do
    echo "==> Deploying $fn"
    supabase functions deploy "$fn" --no-verify-jwt > /dev/null
done

# -----------------------------------------------------------------------------
# Look up service role key for end-to-end invocation
# -----------------------------------------------------------------------------
echo "==> Reading service_role key for pipeline invocation"
SERVICE_ROLE=$(curl -sS \
    -H "Authorization: Bearer $SUPABASE_ACCESS_TOKEN" \
    "https://api.supabase.com/v1/projects/$PROJECT_REF/api-keys" \
    | python3 -c "import sys,json; print([k['api_key'] for k in json.load(sys.stdin) if k['name']=='service_role'][0])")

if [[ -z "$SERVICE_ROLE" ]]; then
    echo "ERROR: could not retrieve service_role key" >&2
    exit 1
fi

# Helper to invoke an edge function
invoke() {
    local fn=$1
    echo "==> Invoking $fn"
    local response
    response=$(curl -sS -X POST \
        -H "Authorization: Bearer $SERVICE_ROLE" \
        -H "Content-Type: application/json" \
        -d '{}' \
        "$PROJECT_URL/functions/v1/$fn")
    echo "$response" | python3 -m json.tool 2>/dev/null | head -20 || echo "$response" | head -200
    echo "----"
}

# -----------------------------------------------------------------------------
# Run pipeline
# -----------------------------------------------------------------------------
invoke feed-ingest
invoke feed-author
invoke feed-verify
invoke feed-classify
invoke feed-publish

# -----------------------------------------------------------------------------
# Report
# -----------------------------------------------------------------------------
echo "==> Checking final feed_items count"
ITEM_COUNT=$(curl -sS \
    -H "apikey: $SERVICE_ROLE" \
    -H "Authorization: Bearer $SERVICE_ROLE" \
    "$PROJECT_URL/rest/v1/feed_items?select=id,review_state&review_state=in.(auto_published,approved)" \
    | python3 -c "import sys,json; print(len(json.load(sys.stdin)))")

echo ""
echo "================================================================"
echo "  Pipeline deployed. Visible feed_items: $ITEM_COUNT"
echo "================================================================"
echo ""
echo "Next: open the NurseMind app on the simulator. Pull to refresh"
echo "on the Feed tab. Items should appear within a few seconds."
