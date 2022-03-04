local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   local capabilities = vim.lsp.protocol.make_client_capabilities()
   capabilities.textDocument.completion.completionItem.snippetSupport = true

   lspconfig.html.setup {
     capabilities = capabilities,
     init_options = {
       provideFormatter = false,
     },
   }

   local sumneko_binary = "$HOME/tools/lua-language-server/bin/lua-language-server"
   local sumneko_main = "$HOME/tools/lua-language-server/bin/main.lua"
   lspconfig.sumneko_lua.setup {
     cmd = { sumneko_binary, "-E", sumneko_main },
     on_attach = on_attach,
     capabilities = capabilities,
     settings = {
       Lua = {
         diagnostics = {
           globals = { "vim" },
         },
         workspace = { 
           library = { 
             [vim.fn.expand "$VIMRUNTIME/lua"] = true, 
             [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true, 
           }, 
           maxPreload = 100000, 
           preloadFileSize = 10000, 
         },
       },
     },
   }

   lspconfig.tsserver.setup {
      on_attach = function(client, bufnr)
         client.resolved_capabilities.document_formatting = false
         vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>fm", "<cmd>lua vim.lsp.buf.formatting()<CR>", {})
      end,
   }

   -- lspservers with default config
   local servers = { "cssls", "eslint", "tailwindcss", "pyright" }

   for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup {
         on_attach = attach,
         capabilities = capabilities,
         flags = {
            debounce_text_changes = 150,
         },
      }
   end
end

return M
