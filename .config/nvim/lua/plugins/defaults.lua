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
            actions = {
              -- pre-fill the "Copy to" prompt with the source filename
              explorer_copy = function(picker, item)
                if not item then
                  return
                end
                local Tree = require("snacks.explorer.tree")
                local Actions = require("snacks.explorer.actions")
                local paths = vim.tbl_map(Snacks.picker.util.path, picker:selected())
                -- multi-selection: fall back to built-in clipboard copy into cwd
                if #paths > 0 then
                  local dir = picker:dir()
                  Snacks.picker.util.copy(paths, dir)
                  picker.list:set_selected()
                  Tree:refresh(dir)
                  Tree:open(dir)
                  Actions.update(picker, { target = dir })
                  return
                end
                Snacks.input({
                  prompt = "Copy to",
                  default = vim.fn.fnamemodify(item.file, ":t"),
                }, function(value)
                  if not value or value:find("^%s*$") then
                    return
                  end
                  local dir = vim.fs.dirname(item.file)
                  local to = vim.fs.normalize(dir .. "/" .. value)
                  if (vim.uv or vim.loop).fs_stat(to) then
                    Snacks.notify.warn("File already exists:\n- `" .. to .. "`")
                    return
                  end
                  Snacks.picker.util.copy_path(item.file, to)
                  Tree:refresh(vim.fs.dirname(to))
                  Actions.update(picker, { target = to })
                end)
              end,
            },
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
