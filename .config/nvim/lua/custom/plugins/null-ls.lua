local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
   formatting.eslint_d.with {
      filetypes = {
         "javascript",
         "javascriptreact",
         "typescript",
         "typescriptreact",
         "vue",
      },
   },
   formatting.prettierd.with {
      filetypes = {
         "css",
         "scss",
         "less",
         "html",
         "json",
         "jsonc",
         "yaml",
         "markdown",
         "graphql",
         "handlebars",
      },
   },
   formatting.black.with { extra_args = { "--fast" } },
   formatting.stylua,
   diagnostics.luacheck.with { extra_args = { "--global vim" } },
   diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
}

-- Format on save
local format_save = function(client, bufnr)
   vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
   if client.resolved_capabilities.document_formatting then
      vim.cmd [[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]]
   end
end

local M = {}

M.setup = function()
   null_ls.setup {
      debug = false,
      sources = sources,
      on_attach = format_save,
   }
end

return M
