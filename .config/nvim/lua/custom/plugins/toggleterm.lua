local toggleterm = require "toggleterm"
local terminal = require("toggleterm.terminal").Terminal
local lazygit = terminal:new { cmd = "lazygit", hidden = true }

function Lazygit_toggle()
   lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>g", "<cmd>lua Lazygit_toggle()<CR>", { noremap = true, silent = true })

local M = {}

M.setup = function()
   toggleterm.setup {
      -- size can be a number or function which is passed the current terminal
      size = 20,
      open_mapping = [[<c-\>]],
      hide_numbers = true, -- hide the number column in toggleterm buffers
      shade_filetypes = {},
      shade_terminals = true,
      shading_factor = 2, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
      start_in_insert = true,
      insert_mappings = true, -- whether or not the open mapping applies in insert mode
      terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
      persist_size = true,
      direction = "float",
      close_on_exit = true, -- close the terminal window when the process exits
      shell = vim.o.shell, -- change the default shell
      -- This field is only relevant if direction is set to 'float'
      float_opts = {
         -- The border key is *almost* the same as 'nvim_open_win'
         -- see :h nvim_open_win for details on borders however
         -- the 'curved' border is a custom border type
         -- not natively supported but implemented in this plugin.
         --| 'double' | 'shadow' | 'curved' | ... other options supported by win open
         border = "single",
         winblend = 3,
         highlights = {
            border = "Normal",
            background = "Normal",
         },
      },
   }
end

return M
