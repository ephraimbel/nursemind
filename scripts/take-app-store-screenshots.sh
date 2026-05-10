#!/usr/bin/env bash
#
# Capture App Store-spec screenshots from an iPhone 17 Pro Max
# simulator (current largest, produces 1320×2868 native — App Store
# accepts as the 6.9" / 6.7" iPhone slot).
#
# What the script does for you:
#   1. Boots an iPhone 17 Pro Max sim (shuts down others if needed)
#   2. Sets light appearance and overrides the status bar to Apple's
#      standard demo state (9:41, full battery, full WiFi/cellular)
#   3. Builds + installs NurseMind for that sim
#   4. Launches the app
#   5. Enters an interactive loop: you navigate to each screen,
#      press a number, the script captures + saves the screenshot
#      directly into marketing/public/screenshots/ — overwriting the
#      existing files, so the website picks them up on the next push.
#
# What you do during the interactive loop:
#   - For "ask": the app launches into the Ask home screen — just
#     hit 1 to capture immediately
#   - For "library": tap the Library tab in the bottom nav, then 2
#   - For "tools": tap the Tools tab, then 3
#   - For "answer": tap a suggested question (or type one), wait for
#     the AI response to fully render, then 4
#
# Usage:
#   scripts/take-app-store-screenshots.sh
#   scripts/take-app-store-screenshots.sh --skip-build   # reuse existing install
#   scripts/take-app-store-screenshots.sh --device "iPhone 16 Pro Max"  # different sim

set -euo pipefail

# ─── Config ────────────────────────────────────────────────────────────

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

SCHEME="Nursemind"
PROJECT="Nursemind.xcodeproj"
BUNDLE_ID="app.nursemind.ios"
DEVICE_NAME="iPhone 17 Pro Max"
DERIVED_DATA="/tmp/nm-screenshot-build"
OUT_DIR="${REPO_ROOT}/marketing/public/screenshots"

SKIP_BUILD=false
while [[ $# -gt 0 ]]; do
  case "$1" in
    --skip-build) SKIP_BUILD=true; shift ;;
    --device) DEVICE_NAME="$2"; shift 2 ;;
    -h|--help) sed -n '2,30p' "$0"; exit 0 ;;
    *) echo "Unknown arg: $1"; exit 1 ;;
  esac
done

# ─── Helpers ───────────────────────────────────────────────────────────

log() { printf "\n\033[1;32m▸\033[0m %s\n" "$*"; }
warn() { printf "\n\033[1;33m!\033[0m %s\n" "$*" >&2; }
die() { printf "\n\033[1;31m✗\033[0m %s\n" "$*" >&2; exit 1; }

# ─── 1. Resolve and boot the target simulator ────────────────────────

log "Resolving '$DEVICE_NAME' simulator"
DEVICE_ID=$(xcrun simctl list devices available 2>&1 \
  | grep -E "^[[:space:]]*${DEVICE_NAME} \(" \
  | head -1 \
  | sed -E 's/.*\(([A-F0-9-]{36})\).*/\1/')

[[ -n "$DEVICE_ID" ]] || die "No available simulator named '$DEVICE_NAME'. Run: xcrun simctl list devices available"
log "Device ID: $DEVICE_ID"

# Shut down anything else booted (so the new sim has full resources)
OTHER_BOOTED=$(xcrun simctl list devices booted 2>&1 \
  | grep -oE '\([A-F0-9-]{36}\)' \
  | tr -d '()' \
  | grep -v "^$DEVICE_ID$" || true)
if [[ -n "$OTHER_BOOTED" ]]; then
  log "Shutting down other booted sims to free resources"
  for id in $OTHER_BOOTED; do
    xcrun simctl shutdown "$id" 2>/dev/null || true
  done
fi

# Boot the target if not already booted
STATE=$(xcrun simctl list devices 2>&1 | grep "$DEVICE_ID" | grep -oE '\((Booted|Shutdown)\)')
if [[ "$STATE" != "(Booted)" ]]; then
  log "Booting $DEVICE_NAME"
  xcrun simctl boot "$DEVICE_ID"
fi

# Bring Simulator.app to front
open -a Simulator

# Wait for Springboard to be ready
log "Waiting for Springboard"
xcrun simctl bootstatus "$DEVICE_ID" -b > /dev/null 2>&1 || true
sleep 2

# ─── 2. Apple's standard demo status bar state ───────────────────────

log "Setting light appearance + 9:41 demo status bar"
xcrun simctl ui "$DEVICE_ID" appearance light 2>/dev/null || true

xcrun simctl status_bar "$DEVICE_ID" override \
  --time "9:41" \
  --dataNetwork wifi \
  --wifiMode active \
  --wifiBars 3 \
  --cellularMode active \
  --cellularBars 4 \
  --batteryState charged \
  --batteryLevel 100 \
  || warn "Status bar override failed (probably an iOS sim version mismatch). Screenshots will use the live time/battery instead."

# ─── 3. Build + install ───────────────────────────────────────────────

if [[ "$SKIP_BUILD" != "true" ]]; then
  log "Building NurseMind for $DEVICE_NAME"
  xcodebuild build \
    -scheme "$SCHEME" \
    -project "$PROJECT" \
    -destination "platform=iOS Simulator,id=$DEVICE_ID" \
    -derivedDataPath "$DERIVED_DATA" \
    2>&1 | grep -E '^(\*\* BUILD|error:|/.+:[0-9]+:[0-9]+: error:)' | head -10

  APP_PATH="$DERIVED_DATA/Build/Products/Debug-iphonesimulator/Nursemind.app"
  [[ -d "$APP_PATH" ]] || die "Build succeeded but no .app found at $APP_PATH"

  log "Uninstalling previous + installing fresh build"
  xcrun simctl uninstall "$DEVICE_ID" "$BUNDLE_ID" 2>/dev/null || true
  xcrun simctl install "$DEVICE_ID" "$APP_PATH"
fi

# ─── 4. Launch ────────────────────────────────────────────────────────

log "Launching $BUNDLE_ID"
xcrun simctl launch "$DEVICE_ID" "$BUNDLE_ID" > /dev/null
sleep 3

# ─── 5. Capture loop ─────────────────────────────────────────────────

mkdir -p "$OUT_DIR"

capture() {
  local key="$1"
  local file="$OUT_DIR/${key}.png"
  log "Capturing → $file"
  xcrun simctl io "$DEVICE_ID" screenshot "$file" >/dev/null 2>&1
  if [[ -f "$file" ]]; then
    local dims
    dims=$(file "$file" | grep -oE '[0-9]+ x [0-9]+' | head -1)
    printf "  saved · %s\n" "$dims"
  else
    warn "Capture failed"
  fi
}

cat <<'EOF'

──────────────────────────────────────────────────────────────────────
  App Store screenshot capture — interactive

  In the simulator:
    1) Wait for the app to settle on the Ask home screen, then press 1
    2) Tap the Library tab in the bottom nav, then press 2
    3) Tap the Tools tab, then press 3
    4) Tap a suggested question or type one, wait for the AI response
       to fully render, then press 4
    q) Quit when done
──────────────────────────────────────────────────────────────────────

EOF

while true; do
  read -p "Capture which screen? (1=ask, 2=library, 3=tools, 4=answer, q=quit) " -n 1 -r choice
  echo ""
  case "$choice" in
    1) capture "ask" ;;
    2) capture "library" ;;
    3) capture "tools" ;;
    4) capture "answer" ;;
    q|Q) break ;;
    *) echo "  unrecognized — pick 1, 2, 3, 4, or q" ;;
  esac
done

# ─── 6. Restore status bar so the sim is normal again ───────────────

log "Clearing status bar override"
xcrun simctl status_bar "$DEVICE_ID" clear 2>/dev/null || true

# ─── 7. Summary ──────────────────────────────────────────────────────

log "Done. Screenshots in $OUT_DIR:"
ls -lh "$OUT_DIR"/*.png 2>/dev/null

cat <<EOF

Next steps:
  1. Inspect each screenshot — open them in Preview to confirm they
     look right. If a tab shows the wrong specialty / state, re-run
     the script and capture that one again (the others will be
     overwritten only if you re-capture them).

  2. Verify dimensions match Apple's spec (1320×2868 from iPhone 17
     Pro Max — App Store accepts this for the 6.9" / 6.7" slot).

  3. Marketing site already references these by name from
     marketing/app/components/Screenshots.tsx. Next git push will
     auto-deploy them to nursemind.app.

  4. For App Store Connect, upload the same files to the 6.7" iPhone
     screenshots slot. Optionally also capture a 5.5" iPhone version
     by re-running with --device "iPhone 8 Plus".
EOF
