-- LazyVim's lang.markdown extra lints via markdownlint-cli2, piping the buffer
-- over stdin. markdownlint-cli2 only discovers config files from its cwd
-- downward, so it never finds a config for project files opened elsewhere.
-- nvim is the only consumer, so the config lives next to this config dir and we
-- force it with an absolute --config so the rules apply in every project.
return {
  "mfussenegger/nvim-lint",
  opts = function()
    local cfg = vim.fn.stdpath("config") .. "/.markdownlint-cli2.jsonc"
    require("lint").linters["markdownlint-cli2"].args = { "--config", cfg, "-" }
  end,
}
