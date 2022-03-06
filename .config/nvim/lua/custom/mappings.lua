local map = require("core.utils").map

-- General --
-- Paste without yank
map("v", "p", '"_dP')
-- Resize with arrows 
map("n", "<C-Up>", ":resize -2<CR>")
map("n", "<C-Down>", ":resize +2<CR>")
map("n", "<C-Left>", ":vertical resize -2<CR>")
map("n", "<C-Right>", ":vertical resize +2<CR>")
-- Move text up and down
map("n", "<A-j>", "<Esc>:m .+1<CR>==gi")
map("n", "<A-k>", "<Esc>:m .-2<CR>==gi")
map("v", "<A-j>", ":m .+1<CR>==")
map("v", "<A-k>", ":m .-2<CR>==")
map("x", "<A-j>", ":move '>+1<CR>gv-gv")
map("x", "<A-k>", ":move '<-2<CR>gv-gv")
-- Mac options alt
map("n", "∆", "<Esc>:m .+1<CR>==gi")
map("n", "˚", "<Esc>:m .-2<CR>==gi")
map("v", "∆", ":m .+1<CR>==")
map("v", "˚", ":m .-2<CR>==")
map("x", "∆", ":move '>+1<CR>gv-gv")
map("x", "˚", ":move '<-2<CR>gv-gv")

-- Indent --
-- Stay in indent mode
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Close buffer
map("n", "<leader>cc", ":bd<CR>")

-- LSP --
map("n", "<leader>la", ":lua vim.lsp.buf.code_action()<CR>") -- Code action
map("n", "<leader>ld", ":Telescope lsp_document_diagnostics<CR>") -- Document Diagnostics
