#!/bin/bash
#
# macOS system defaults. Idempotent: safe to re-run.
# Apply with: ./.scripts/setup-macos-defaults.sh

set -euo pipefail

if [[ "$(uname)" != "Darwin" ]]; then
    echo "Not macOS — skipping."
    exit 0
fi

# Keyboard: faster key repeat and shorter delay before repeat.
# InitialKeyRepeat: delay until repeat starts (lower = shorter). 15 ≈ 225ms.
# KeyRepeat: interval between repeats (lower = faster). 2 ≈ 30ms.
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

echo "macOS defaults applied. Log out and back in for all changes to take effect."
