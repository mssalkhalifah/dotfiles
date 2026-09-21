---
name: wezterm-config
description: Use when creating, editing, or debugging WezTerm terminal configuration in this dotfiles repo — wezterm.lua, color schemes, fonts, keybindings, tabs, panes, window opacity, default shell — or when WezTerm behaves differently from what wezterm.org documents.
---

# WezTerm Config

The config is `.config/wezterm/wezterm.lua` in this repo, stow-linked to
`~/.config/wezterm/wezterm.lua`. Editing the tracked file edits the live config.

WezTerm's stable channel has been frozen since Feb 2024, so this machine runs
`wezterm@nightly`. Nightly renames and retires config keys between builds while
wezterm.org documents only the current one — which is why every change starts
with the version gate.

## Step 1: Version gate (always first)

```bash
.claude/skills/wezterm-config/check-version.sh
```

| Exit | Meaning | Do |
|------|---------|-----|
| 0 | Installed build matches the stamp | Proceed |
| 1 | **Drift** — build moved since the stamp | Re-read wezterm.org for every key you touch, then proceed |
| 2 | Not on PATH | `brew install --cask wezterm@nightly`; stop |

After a drifted change is confirmed working, re-stamp:
`.claude/skills/wezterm-config/check-version.sh --stamp`

## Step 2: Edit

- **Always build through `wezterm.config_builder()`.** It is what validates
  field names. A bare `return { ... }` table silently accepts typo'd keys.
- **No side effects.** The file is evaluated several times per process — never
  spawn anything or write files from it.
- Look the key up at <https://wezterm.org/config/lua/config/index.html> before
  using it. Do not write config keys from memory; nightly moves.

## Step 3: Validate

```bash
wezterm --config-file "$PWD/.config/wezterm/wezterm.lua" ls-fonts 2>&1 >/dev/null | grep -i error
```

No output means it loads. **The exit code is always 0 and `show-keys` swallows
config errors entirely** — grepping stderr from `ls-fonts` is the only reliable
check. Saving the file reloads any running WezTerm; `CTRL+SHIFT+R` forces it.

Try a value without committing to it first: `wezterm --config enable_scroll_bar=true`

## Where to look things up

| Topic | URL |
|-------|-----|
| Every config option | <https://wezterm.org/config/lua/config/index.html> |
| File locations, reload, `config_builder` | <https://wezterm.org/config/files.html> |
| Appearance, opacity, background | <https://wezterm.org/config/appearance.html> |
| Fonts | <https://wezterm.org/config/fonts.html> |
| Keybindings | <https://wezterm.org/config/keys.html> |
| Key assignment actions | <https://wezterm.org/config/lua/keyassignment/index.html> |
| Color scheme names (1001 builtins) | <https://wezterm.org/colorschemes/index.html> |
| Shell / `default_prog` | <https://wezterm.org/config/launch.html> |
| What changed in nightly | <https://wezterm.org/changelog.html> |

## Common mistakes

- Editing `~/.config/wezterm/wezterm.lua` directly — that is the stow symlink's
  target; edit the repo file.
- Guessing a scheme name. They are exact strings and near-duplicates exist:
  `tokyonight_night`, `Tokyo Night`, `Tokyo Night Moon`, `Tokyo Night (Gogh)`
  are four different schemes.
- Trusting exit codes from `wezterm --config-file ...`. See Step 3.
- Re-stamping before the change is confirmed working. The stamp means "config
  verified against this build".
