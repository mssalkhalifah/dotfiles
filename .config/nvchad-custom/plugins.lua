local plugins = {
	{
		"mfussenegger/nvim-jdtls",
		dependencies = "neovim/nvim-lspconfig",
		-- event = "BufRead",
		ft = "java",
		config = function()
			require("custom.configs.lsp.java")
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		ft = "python",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap.python")
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		event = "VeryLazy",
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dapui")
		end,
	},
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("custom.configs.dap")
			require("core.utils").load_mappings("dap")
		end,
	},
	{
		"alexghergh/nvim-tmux-navigation",
		config = function()
			require("nvim-tmux-navigation").setup({})
		end,
		lazy = false,
	},
	{
		"nvim-lua/plenary.nvim",
	},
	{
		"jose-elias-alvarez/null-ls.nvim",
		event = "VeryLazy",
		opts = function()
			return require("custom.configs.null-ls")
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.configs.lspconfig")
			require("custom.configs.lspconfig")
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter",
		opts = {
			ensure_installed = {
				"angular",
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
				"java",
			},
		},
	},
	{
		"williamboman/mason.nvim",
		opts = {
			ensure_installed = {
				"jdtls",
				"css-lsp",
				"html-lsp",
				"json-lsp",
				"eslint-lsp",
				"js-debug-adapter",
				"lua-language-server",
				"bash-language-server",
				"tailwindcss-language-server",
				"typescript-language-server",
				"prettier",
				"stylua",
				"shellcheck",
				"docker-compose-language-service",
				"dockerfile-language-server",
				"csharp-language-server",
				"angular-language-server",
				"pyright",
				"shellharden",
				"ruff",
				"mypy",
				"black",
				"debugpy",
			},
		},
	},
	{
		"max397574/better-escape.nvim",
	},
}

return plugins
