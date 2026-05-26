#!/bin/bash
# Symlink the latest installed nvm.fish node version into ~/.local/bin so
# GNOME-launched apps (JetBrains IDEs, etc.) can find node/npm/npx on PATH.
# Idempotent — safe to re-run. The fish hook at
# .config/fish/conf.d/nvm-symlinks.fish keeps these links in sync after
# subsequent `nvm use` invocations.

set -euo pipefail

NVM_ROOT="$HOME/.local/share/nvm"
TARGET_BIN="$HOME/.local/bin"

if [ ! -d "$NVM_ROOT" ]; then
    echo "nvm.fish not installed at $NVM_ROOT — install fisher + jorgebucaran/nvm.fish first, then run 'nvm install lts'."
    exit 0
fi

latest=$(ls -1 "$NVM_ROOT" 2>/dev/null | grep -E '^v[0-9]' | sort -V | tail -n 1 || true)
if [ -z "$latest" ]; then
    echo "No node versions installed under $NVM_ROOT — run 'nvm install lts' first."
    exit 0
fi

mkdir -p "$TARGET_BIN"
for bin in node npm npx corepack; do
    src="$NVM_ROOT/$latest/bin/$bin"
    [ -e "$src" ] || continue
    ln -sfn "$src" "$TARGET_BIN/$bin"
    echo "Linked $TARGET_BIN/$bin -> $src"
done
