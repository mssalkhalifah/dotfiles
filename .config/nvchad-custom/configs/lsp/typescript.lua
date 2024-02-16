local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local M = {}

M.on_attach = on_attach
M.capabilities = capabilities
M.init_options = {
	preferences = {
		disableSuggestions = true,
	},
}

return M
