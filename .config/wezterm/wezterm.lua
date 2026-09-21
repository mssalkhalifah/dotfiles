-- WezTerm configuration.
-- Stowed to ~/.config/wezterm/wezterm.lua. Reloads automatically on save
-- (CTRL+SHIFT+R forces it). This file is evaluated more than once per
-- process, so keep it free of side effects.
-- Docs: https://wezterm.org/config/files.html

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Appearance
config.color_scheme = 'Catppuccin Mocha'
config.window_background_opacity = 0.92
config.macos_window_background_blur = 20

-- Log in through bash so the login environment is set up, then hand off to
-- fish -- same shape as ghostty's `command = bash -lc fish`.
config.default_prog = { '/bin/bash', '-lc', 'fish' }

return config
