#!/usr/bin/env bash
#
# Build, archive, export, and upload NurseMind to TestFlight.
# One command from the repo root: scripts/upload-to-testflight.sh
#
# Prerequisites (one-time setup):
#
#   1. Apple Developer Program membership active.
#
#   2. Xcode signed into your Apple ID:
#        Xcode → Settings → Accounts → "+" → Apple ID
#      This installs your distribution certificate and downloads/refreshes
#      the App Store provisioning profile for app.nursemind.ios.
#
#   3. project.yml has signing turned ON. Currently it's set up for sim
#      work only (CODE_SIGNING_ALLOWED: NO). Edit project.yml so the
#      Nursemind target's settings.base reads:
#
#        DEVELOPMENT_TEAM: <YOUR_10_CHAR_TEAM_ID>
#        CODE_SIGN_STYLE: Automatic
#        CODE_SIGNING_ALLOWED: YES
#        CODE_SIGNING_REQUIRED: YES
#
#      Then: xcodegen generate
#
#   4. ASC API key: download a .p8 from App Store Connect → Users and
#      Access → Integrations → App Store Connect API. Drop the file at:
#
#        ~/.appstoreconnect/private_keys/AuthKey_<KEYID>.p8
#
#      and export the Issuer ID + Key ID below (or pass them as flags).
#
# Usage:
#   scripts/upload-to-testflight.sh                          # auto-bumps build number
#   scripts/upload-to-testflight.sh --build 7                # explicit build number
#   scripts/upload-to-testflight.sh --skip-upload            # archive + export only
#   scripts/upload-to-testflight.sh --skip-archive           # re-export an existing archive
#
# What this does:
#   1. Bumps CURRENT_PROJECT_VERSION (build number)
#   2. xcodegen → regenerate Nursemind.xcodeproj
#   3. xcodebuild archive (Release, Generic iOS Device)
#   4. xcodebuild -exportArchive → Nursemind.ipa
#   5. xcrun altool --upload-app → App Store Connect (TestFlight)
#
# After upload, Apple processes the build (~5–15 min). You'll get an
# email when processing is complete. The build then appears under
# TestFlight → Builds in App Store Connect, ready to add to a tester
# group or submit for review.

set -euo pipefail

# ─── Config ────────────────────────────────────────────────────────────

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$REPO_ROOT"

SCHEME="Nursemind"
PROJECT="Nursemind.xcodeproj"
BUNDLE_ID="app.nursemind.ios"
ARCHIVE_PATH="${REPO_ROOT}/build/Nursemind.xcarchive"
EXPORT_PATH="${REPO_ROOT}/build/export"
IPA_PATH="${EXPORT_PATH}/Nursemind.ipa"
EXPORT_OPTIONS_PLIST="${REPO_ROOT}/build/ExportOptions.plist"

# ASC API auth — set these in your shell environment before running:
#   export ASC_KEY_ID="W3FC2TQS3C"          # the Key ID you generated
#   export ASC_ISSUER_ID="<your-issuer-id>" # one per team
# .p8 file expected at ~/.appstoreconnect/private_keys/AuthKey_<KEY_ID>.p8
ASC_KEY_ID="${ASC_KEY_ID:-W3FC2TQS3C}"
ASC_ISSUER_ID="${ASC_ISSUER_ID:-}"

# ─── Args ──────────────────────────────────────────────────────────────

BUILD_NUMBER=""
SKIP_ARCHIVE=false
SKIP_UPLOAD=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    --build)
      BUILD_NUMBER="$2"
      shift 2
      ;;
    --skip-archive)
      SKIP_ARCHIVE=true
      shift
      ;;
    --skip-upload)
      SKIP_UPLOAD=true
      shift
      ;;
    -h|--help)
      sed -n '2,40p' "$0"
      exit 0
      ;;
    *)
      echo "Unknown arg: $1"
      exit 1
      ;;
  esac
done

# ─── Helpers ───────────────────────────────────────────────────────────

log() { printf "\n\033[1;32m▸\033[0m %s\n" "$*"; }
warn() { printf "\n\033[1;33m!\033[0m %s\n" "$*" >&2; }
die() { printf "\n\033[1;31m✗\033[0m %s\n" "$*" >&2; exit 1; }

require() {
  command -v "$1" >/dev/null 2>&1 || die "Missing required tool: $1"
}

# ─── Preflight ─────────────────────────────────────────────────────────

require xcodebuild
require xcodegen
require xcrun

if [[ "$SKIP_UPLOAD" != "true" ]]; then
  [[ -n "$ASC_ISSUER_ID" ]] || die \
    "ASC_ISSUER_ID is not set. Export it (export ASC_ISSUER_ID=...) or pass --skip-upload."

  KEY_FILE="${HOME}/.appstoreconnect/private_keys/AuthKey_${ASC_KEY_ID}.p8"
  [[ -f "$KEY_FILE" ]] || die \
    "ASC API key not found at ${KEY_FILE}. Download AuthKey_${ASC_KEY_ID}.p8 from App Store Connect and place it there."
fi

# Confirm signing is actually enabled in the regenerated project.
SIGNING_OFF=$(grep -E 'CODE_SIGNING_ALLOWED:[[:space:]]*NO' project.yml || true)
if [[ -n "$SIGNING_OFF" ]]; then
  die "project.yml has CODE_SIGNING_ALLOWED: NO. Change it to YES (and CODE_SIGNING_REQUIRED: YES, set DEVELOPMENT_TEAM) before uploading. See the header of this script."
fi

mkdir -p "${REPO_ROOT}/build"

# ─── 1. Bump build number ─────────────────────────────────────────────

if [[ -z "$BUILD_NUMBER" ]]; then
  CURRENT=$(grep 'CURRENT_PROJECT_VERSION:' project.yml | head -1 | sed -E 's/.*"([0-9]+)".*/\1/')
  BUILD_NUMBER=$((CURRENT + 1))
  log "Auto-bumping build number: ${CURRENT} → ${BUILD_NUMBER}"
fi

# Edit project.yml in place. Mac sed needs '' after -i.
sed -i '' -E "s/(CURRENT_PROJECT_VERSION:[[:space:]]*)\"[0-9]+\"/\1\"${BUILD_NUMBER}\"/" project.yml

# ─── 2. Regenerate Xcode project ──────────────────────────────────────

log "xcodegen generate"
xcodegen generate

# ─── 3. Archive ───────────────────────────────────────────────────────

if [[ "$SKIP_ARCHIVE" != "true" ]]; then
  rm -rf "$ARCHIVE_PATH"
  log "Archiving (Release, Generic iOS Device, build ${BUILD_NUMBER})"
  xcodebuild archive \
    -project "$PROJECT" \
    -scheme "$SCHEME" \
    -configuration Release \
    -destination "generic/platform=iOS" \
    -archivePath "$ARCHIVE_PATH" \
    -allowProvisioningUpdates \
    | xcbeautify 2>/dev/null || xcodebuild archive \
        -project "$PROJECT" \
        -scheme "$SCHEME" \
        -configuration Release \
        -destination "generic/platform=iOS" \
        -archivePath "$ARCHIVE_PATH" \
        -allowProvisioningUpdates
else
  [[ -d "$ARCHIVE_PATH" ]] || die "--skip-archive but no archive at ${ARCHIVE_PATH}"
  log "Reusing existing archive at ${ARCHIVE_PATH}"
fi

# ─── 4. Export the .ipa ───────────────────────────────────────────────

# Generate ExportOptions.plist on every run so it stays in sync with
# the bundle ID and team. This is App Store distribution with automatic
# signing; Xcode picks the right distribution certificate and the latest
# valid App Store provisioning profile for the bundle ID.

cat > "$EXPORT_OPTIONS_PLIST" <<EOF
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
  <key>method</key>
  <string>app-store-connect</string>
  <key>signingStyle</key>
  <string>automatic</string>
  <key>destination</key>
  <string>export</string>
  <key>uploadSymbols</key>
  <true/>
  <key>uploadBitcode</key>
  <false/>
  <key>generateAppStoreInformation</key>
  <true/>
</dict>
</plist>
EOF

rm -rf "$EXPORT_PATH"
log "Exporting .ipa"
xcodebuild -exportArchive \
  -archivePath "$ARCHIVE_PATH" \
  -exportPath "$EXPORT_PATH" \
  -exportOptionsPlist "$EXPORT_OPTIONS_PLIST" \
  -allowProvisioningUpdates

[[ -f "$IPA_PATH" ]] || die "Export finished but no IPA at ${IPA_PATH}. Check xcodebuild output."

log "IPA built: ${IPA_PATH} ($(du -h "$IPA_PATH" | cut -f1))"

# ─── 5. Upload to App Store Connect ───────────────────────────────────

if [[ "$SKIP_UPLOAD" == "true" ]]; then
  warn "--skip-upload set. IPA ready at ${IPA_PATH} but not uploaded."
  exit 0
fi

log "Uploading to App Store Connect (TestFlight)"
xcrun altool --upload-app \
  --type ios \
  --file "$IPA_PATH" \
  --apiKey "$ASC_KEY_ID" \
  --apiIssuer "$ASC_ISSUER_ID"

log "Uploaded. Apple will process the build for ~5–15 min."
log "Check: App Store Connect → ${BUNDLE_ID} → TestFlight → Builds"
log "Build number: ${BUILD_NUMBER}"
