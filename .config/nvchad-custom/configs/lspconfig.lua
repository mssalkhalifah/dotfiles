local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

lspconfig["angularls"].setup(require("custom.configs.lsp.angular"))
lspconfig["tsserver"].setup(require("custom.configs.lsp.typescript"))

local servers = {
	"tailwindcss",
	"html",
	"cssls",
	"jsonls",
	"terraformls",
	"docker_compose_language_service",
	"dockerls",
	"pyright",
	"bashls",
	"lua_ls",
}

for _, lsp in ipairs(servers) do
	local lsp_config = lspconfig[lsp]

	lsp_config.setup({
		on_attach = on_attach,
		capabilities = capabilities,
	})
end
