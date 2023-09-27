local M = {}

M.escape = {
	i = {
		["jk"] = { "<ESC>", "escape insert mode", opts = { nowait = true } },
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

return M
