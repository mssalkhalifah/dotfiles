return {
  {
    "folke/tokyonight.nvim",
    opts = { style = "night" },
  },

  {
    "LazyVim/LazyVim",
    opts = { colorscheme = "tokyonight-night" },
  },

  {
    "coder/claudecode.nvim",
    opts = {
      diff_opts = {
        layout = "horizontal",
        open_in_new_tab = true,
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
          },
          files = {
            hidden = true,
            ignored = true,
          },
        },
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        file_ignore_patterns = { "^.git/" },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    },
  },
}
