local M = {}

M.escape = {
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
	},
}

M.navigations = {
	n = {
		["<C-h>"] = { "<Cmd>NvimTmuxNavigateLeft<CR>", "Navigate to left pane", opts = { silent = true } },
		["<C-j>"] = { "<Cmd>NvimTmuxNavigateDown<CR>", "Navigate to down pane", opts = { silent = true } },
		["<C-k>"] = { "<Cmd>NvimTmuxNavigateUp<CR>", "Navigate to up pane", opts = { silent = true } },
		["<C-l>"] = { "<Cmd>NvimTmuxNavigateRight<CR>", "Navigate to right pane", opts = { silent = true } },
	},
}

M.moveline = {
	n = {
		["<A-j>"] = { ":m .+1<CR>==", "move line down", {} },
		["<A-k>"] = { ":m .-2<CR>==", "move line up", {} },
	},

	i = {
		["<A-j>"] = { "<ESC>:m .+1<CR>==gi", "move line down", {} },
		["<A-k>"] = { "<ESC>:m .-2<CR>==gi", "move line up", {} },
	},

	v = {
		["<A-j>"] = { ":m '>+1<CR>gv=gv", "move line down", {} },
		["<A-k>"] = { ":m '>-2<CR>gv=gv", "move line up", {} },
	},
}

M.delete = {
	n = {
		["<leader>d"] = { '"_d', "delete line without yank", {} },
		["x"] = { '"_x', "delete char without yank", {} },
	},

	v = {
		["<leader>d"] = { '"_d', "delete without yank", {} },
	},
}

M.clipboard = {
	n = {
		["<leader>y"] = { '"+y', "copy to clipboard", {} },
		["<leader>Y"] = { '"+y', "copy to clipboard", {} },
	},

	v = {
		["<leader>y"] = { '"+y', "copy to clipboard", {} },
		["<leader>Y"] = { '"+y', "copy to clipboard", {} },
		["<leader>p"] = { '"_dP', "replace without yank", {} },
	},
}

M.dap = {
	n = {
		["<leader>db"] = { ":DapToggleBreakpoint<CR>", "toggle breakpoint", {} },
		["<leader>dr"] = { ":DapContinue<CR>", "Run or continue the debugger", {} },
	},
}

M.java = {
	-- n = {
	-- 	["<C-o>"] = { require("jdtls").organize_imports, "Organize imports", {} },
	-- 	["<space>ev"] = { require("jdtls").extract_variable, "Extract variable", {} },
	-- 	["<space>ec"] = { require("jdtls").extract_constant, "Extract constant", {} },
	-- },
	-- v = {
	-- 	["<space>em"] = { "<ESC><CMD>lua require('jdtls').extract_method(true)<CR>", "Extract method", {} },
	-- },
}

return M
