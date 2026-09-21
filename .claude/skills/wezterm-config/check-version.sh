#!/usr/bin/env bash
# Compare the installed WezTerm against the version stamped in VERSION.
#
#   ./check-version.sh           report drift (exit 0 ok, 1 drift, 2 not installed)
#   ./check-version.sh --stamp   record the installed version as the new baseline
#
# WezTerm versions look like YYYYMMDD-HHMMSS-githash and sort lexicographically,
# so the date prefix is what tells you how far the docs may have moved.

set -uo pipefail

here="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
stamp_file="$here/VERSION"
mode="${1:-check}"

read_field() { sed -n "s/^$1=//p" "$stamp_file" | head -1; }

epoch_of() { # YYYYMMDD -> seconds, GNU date or BSD date
  date -d "$1" +%s 2>/dev/null || date -j -f "%Y%m%d" "$1" +%s 2>/dev/null
}

write_stamp() {
  local version="$1" channel="$2" today
  today="$(date +%F)"
  cat > "$stamp_file" <<EOF
# WezTerm version stamp for the wezterm-config skill.
# Written by check-version.sh --stamp. Do not hand-edit the version line.
channel=$channel
version=$version
stamped=$today
docs_checked=$today
EOF
}

if ! command -v wezterm >/dev/null 2>&1; then
  cat >&2 <<'EOF'
WezTerm is not on PATH — cannot verify the config against a real build.

  brew install --cask wezterm@nightly

If it is installed but not linked, the CLI lives at
/Applications/WezTerm.app/Contents/MacOS/wezterm
EOF
  exit 2
fi

live="$(wezterm --version | awk '{print $2}')"
stamped="$(read_field version)"
channel="$(read_field channel)"
stamped_on="$(read_field docs_checked)"

if [ "$mode" = "--stamp" ]; then
  write_stamp "$live" "${channel:-nightly}"
  echo "Stamped WezTerm $live (${channel:-nightly})."
  exit 0
fi

if [ "$live" = "$stamped" ]; then
  echo "WezTerm $live matches the stamp (${channel:-nightly}, docs checked $stamped_on)."
  exit 0
fi

live_day="${live%%-*}"
stamped_day="${stamped%%-*}"
delta=""
live_epoch="$(epoch_of "$live_day")"
stamped_epoch="$(epoch_of "$stamped_day")"
if [ -n "$live_epoch" ] && [ -n "$stamped_epoch" ]; then
  delta=$(( (live_epoch - stamped_epoch) / 86400 ))
fi

{
  echo "WARNING: WezTerm version drift."
  echo "  installed: $live"
  echo "  stamped:   $stamped  (${channel:-nightly}, docs checked $stamped_on)"
  [ -n "$delta" ] && echo "  drift:     $delta day(s)"
  echo
  echo "Re-verify every option you are about to touch against wezterm.org before"
  echo "editing — nightly renames and retires config keys without notice."
  echo "Once the config is confirmed working, re-run: ./check-version.sh --stamp"
} >&2
exit 1
