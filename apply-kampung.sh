#!/data/data/com.termux/files/usr/bin/bash
# Run this inside the Kampung-Retro-Chat folder.
set -e

F=lib/config/app_config.dart
[ -f "$F" ] || { echo "Run this inside the Kampung-Retro-Chat folder"; exit 1; }

# 1) Links: point source, issues and release URLs to your fork
# 2) IDs: replace FluffyChat's app id and URL schemes with your own
sed -i \
  -e "s#krille-chan/fluffychat#Erriezzans/Kampung-Retro-Chat#g" \
  -e "s#'im.fluffychat.app'#'com.erriezzans.kampungretro'#" \
  -e "s#'im.fluffychat.auth'#'kampungretro.auth'#" \
  -e "s#'im.fluffychat'#'kampungretro'#" \
  -e "s#im.fluffychat://#kampungretro://#" \
  "$F"

echo "=== Changes made ==="
git --no-pager diff --stat
git --no-pager diff -U0 "$F"

echo
echo "=== Other places that still use the old IDs (send me this) ==="
grep -rn "im.fluffychat\|defaultHomeserver" lib android \
  --include=*.dart --include=*.gradle --include=*.kts \
  --include=*.xml --include=*.kt || true
