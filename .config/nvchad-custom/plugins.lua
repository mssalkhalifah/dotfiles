local plugins = {
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({})
		end,
		lazy = false,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"jose-elias-alvarez/null-ls.nvim",
			config = function()
				require("custom.configs.null-ls")
			end,
		},
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"lua",
				"c_sharp",
				"css",
				"bash",
				"git_config",
				"git_rebase",
				"gitattributes",
				"gitcommit",
				"gitignore",
				"html",
				"javascript",
				"json",
				"markdown",
				"python",
				"tsx",
				"typescript",
				"dockerfile",
				"terraform",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"css-lsp",
				"html-lsp",
				"json-lsp",
				"lua-language-server",
				"sqlls",
				"sqls",
				"tailwindcss-language-server",
				"typescript-language-server",
				"prettier",
				"stylua",
				"shellcheck",
				"docker-compose-language-service",
				"dockerfile-language-server",
			},
		},
	},
	{
		"max397574/better-escape.nvim",
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"mfussenegger/nvim-dap",
			config = function()
				require("custom.configs.nvim-dap")
			end,
		},
		config = function()
			require("dapui")
		end,
	},
}

return plugins
