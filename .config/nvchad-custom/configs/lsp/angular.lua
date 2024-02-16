local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local M = {}

local project_lib_path = vim.fn.expand("$HOME")
	.. "/.local/share/nvim/mason/packages/angular-language-server/node_modules/@angular/language-server/node_modules"
local project_ts_path = vim.fn.getcwd() .. "/node_modules"
local cmd = { "ngserver", "--stdio", "--tsProbeLocations", project_ts_path, "--ngProbeLocations", project_lib_path }

M.cmd = cmd
M.on_attach = on_attach
M.capabilities = capabilities
M.on_new_config = function(new_config, _)
	new_config.cmd = cmd
end

return M
