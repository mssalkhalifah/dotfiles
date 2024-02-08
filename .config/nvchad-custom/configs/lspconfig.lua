local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")
local servers = {
  "tailwindcss",
  "tsserver",
  "html",
  "cssls",
  "jsonls",
  "terraformls",
  "omnisharp",
  "angularls",
  "docker_compose_language_service",
  "dockerls",
}

for _, lsp in ipairs(servers) do
  local lsp_config = lspconfig[lsp]

  if lsp == "omnisharp" then
    local pid = vim.fn.getpid()
    local home = os.getenv("HOME")
    local omnisharp_bin = home .. "/.local/share/nvim/mason/bin/omnisharp"
    lsp_config.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      cmd = {
        omnisharp_bin,
        "--languageserver",
        "--hostPID",
        tostring(pid),
      },
    })
  elseif lsp == "angularls" then
    local project_lib_path = vim.fn.expand("$HOME")
        .. "/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules"
    local project_ts_path = vim.fn.getcwd() .. "/node_modules"
    local cmd =
    { "ngserver", "--stdio", "--tsProbeLocations", project_ts_path, "--ngProbeLocations", project_lib_path }

    lsp_config.setup({
      cmd = cmd,
      on_attach = on_attach,
      capabilities = capabilities,
      on_new_config = function(new_config, new_root_dir)
        new_config.cmd = cmd
      end,
    })
  elseif lsp == "tsserver" then
    lsp_config.setup({
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    })
  else
    lsp_config.setup({
      on_attach = on_attach,
      capabilities = capabilities,
    })
  end
end
