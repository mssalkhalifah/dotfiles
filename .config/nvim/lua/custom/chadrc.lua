local userPlugins = require "custom.plugins"
local plugin_conf = require "custom.plugins.configs"

local M = {}

M.plugins = {
   status = {
      colorizer = true, -- color RGB, HEX, CSS, NAME color codes
      alpha = true, -- dashboard
   },

   options = {
      lspconfig = {
         setup_lspconf = "custom.plugins.lspconfig",
      },
      statusline = {
         style = "arrow", -- default, round , slant , block , arrow
      },
   },

   default_plugin_config_replace = {
      nvim_treesitter = plugin_conf.treesitter,
      nvim_tree = plugin_conf.nvimtree,
   },

   install = userPlugins,
}

M.ui = {
   theme = "gruvbox",
   transparency = true,
}

M.mappings = {}

M.mappings.plugins = {
   bufferline = {
      next_buffer = "<S-l>",
      prev_buffer = "<S-h>",
   },
}

return M
