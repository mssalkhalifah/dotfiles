local M = {}

M.setup_lsp = function(attach, capabilities)
   local lspconfig = require "lspconfig"
   capabilities.textDocument.completion.completionItem.snippetSupport = true

   lspconfig.html.setup {
      capabilities = capabilities,
      init_options = {
         provideFormatter = false,
      },
   }

   local runtime_path = vim.split(package.path, ";")
   table.insert(runtime_path, "lua/?.lua")
   table.insert(runtime_path, "lua/?/init.lua")

   require("lspconfig").sumneko_lua.setup {
      cmp = { "lua-language-server" },
      settings = {
         Lua = {
            runtime = {
               version = "LuaJIT",
               path = runtime_path,
            },
            diagnostics = {
               globals = { "vim" },
            },
            workspace = {
               library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
               enable = false,
            },
         },
      },
   }

   lspconfig.tsserver.setup {
      on_attach = function(client)
         client.resolved_capabilities.document_formatting = false
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
