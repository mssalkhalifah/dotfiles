local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
  formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
  formatting.black.with({ extra_args = { "--fast" } }),
  formatting.stylua,
  diagnostics.luacheck.with({ extra_args = { "--global vim" } }),
  diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
}

-- Format on save
local format_save = function(client)
  if client.resolved_capabilities.document_formatting then
    vim.cmd([[
      augroup LspFormatting
        autocmd! * <buffer>
        autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
      augroup END
    ]])
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
