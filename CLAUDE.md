# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository purpose

This is a personal dotfiles repository deployed via **GNU Stow**. The repo's directory tree mirrors `$HOME`: files under `.config/`, `.ideavimrc`, etc. are symlinked into the home directory by `stow .` from the repo root. There is no build step — editing a tracked file edits the live config.

## Layout conventions

- **Stowed (symlinked into `$HOME`)**: `.config/`, `.ideavimrc` — anything that should land in the user's home directory.
- **Not stowed (local-only helpers)**: `.scripts/`, `.packages`, `README.md`, `LICENSE`, `.claude/` (skills are tracked in git but never symlinked into `$HOME`). Exclusions are enforced by `.stow-global-ignore` — when adding new top-level helpers that shouldn't be symlinked, add them there too.
- **`.gitignore`** additionally ignores `.DS_Store` and everything under `.claude/` except `.claude/skills/`.

When adding a new app config, place it under `.config/<app>/` so stow links it to `~/.config/<app>/`. Don't introduce files at the repo root unless they're meant to live at `$HOME` directly (and then add them to `.stow-global-ignore` if not).

## Neovim config (`.config/nvim/`)

LazyVim-based. Entry point is `init.lua` → `lua/config/lazy.lua` (bootstraps `lazy.nvim` + LazyVim, then imports `lua/plugins/`).

- `lua/config/` — LazyVim's standard slots: `options.lua`, `keymaps.lua`, `autocmds.lua`, `lazy.lua`. Auto-loaded by LazyVim; only edit to override defaults.
- `lua/plugins/` — user plugin specs. Each file returns a lazy.nvim spec table; LazyVim merges them. `example.lua` is the upstream template (untouched reference); active customizations live in `defaults.lua` (neo-tree/telescope to show hidden files) and `terminal.lua` (Snacks terminal keymaps under `<leader>t*`).
- `lazyvim.json` — declares enabled LazyVim "extras" (claudecode, docker, json, yaml). Edit via `:LazyExtras` rather than by hand when possible.
- `lazy-lock.json` — plugin version lockfile, committed. Updates via `:Lazy update`.
- `stylua.toml` — Lua formatting (2-space indent, 120 col).

WSL clipboard integration is handled in `options.lua` (uses `clip.exe`/`powershell.exe`). macOS/Linux fall through to defaults.

**Reference**: when adding or updating LazyVim settings, plugins, keymaps, or extras, consult <https://www.lazyvim.org/> — it's the source of truth for option names, plugin spec conventions, and the `:LazyExtras` catalog. Prefer overriding via the LazyVim-documented hooks (returning a spec from `lua/plugins/`, editing `lazyvim.json` via `:LazyExtras`) over patching internals.

## Fish shell config (`.config/fish/`)

- `config.fish` — interactive shell setup (KUBECONFIG, dotnet tools PATH, Tailscale alias, `nvm use lts`, OrbStack init).
- `fish_plugins` — fisher-managed plugin list.
- `functions/`, `conf.d/` — fisher-installed functions (e.g. `nvm.fish`). Avoid hand-editing these; they're owned by fisher.

## IdeaVim (`.ideavimrc`)

JetBrains IDE Vim config. Uses `<space>` leader. Mirrors many LazyVim-style bindings (`<leader>ff`, `<leader>/`, `gd`, etc.) but maps to IntelliJ `<Action>(...)` calls — keep new bindings consistent with that pattern so muscle memory carries between nvim and JetBrains IDEs.

## Ghostty (`.config/ghostty/`)

**Reference**: when adding or updating Ghostty config, consult <https://ghostty.org/docs> — it's the source of truth for config keys, keybinds, and theme options.

## WezTerm (`.config/wezterm/`)

Lua config (`wezterm.lua`), built through `wezterm.config_builder()`. The machine runs the `wezterm@nightly` cask because the stable channel has been frozen since Feb 2024.

**Use the `wezterm-config` skill** (`.claude/skills/wezterm-config/`) for any change here — it gates edits on a version-drift check against the build the config was last verified on, since nightly retires config keys between builds.

**Reference**: <https://wezterm.org/config/lua/config/index.html> is the source of truth for config keys.

## Setup scripts (`.scripts/`)

Idempotent installers for tools on a fresh machine (Linux-targeted; `setup-neovim.sh` hard-codes `/opt/nvim-linux-x86_64`). Run individually — there is no top-level orchestrator. `.packages` lists distro packages to install via `dnf`/`apt`.

## Common operations

- Apply configs to `$HOME`: `stow .` (run from repo root). Use `stow -D .` to unlink, `stow -R .` to re-link after restructuring.
- Update nvim plugins: open nvim, `:Lazy sync` (commits `lazy-lock.json`).
- Update fish plugins: `fisher update`.
