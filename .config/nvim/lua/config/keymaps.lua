-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("t", "<C-q>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Clipboard vs. registers
-- Plain y/d use Vim's registers only (clipboard is unset in options.lua).
-- <leader>y yanks to the system clipboard, <leader>d deletes into the void.
local map = vim.keymap.set

map({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>Y", '"+y$', { desc = "Yank to end of line to system clipboard" })
map("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
map("n", "<leader>P", '"+P', { desc = "Paste before from system clipboard" })
map("x", "<leader>p", '"+P', { desc = "Paste from system clipboard (keep register)" })

map({ "n", "x" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
map("n", "<leader>D", '"_D', { desc = "Delete to end of line without yanking" })

-- Pasting over a visual selection keeps the register intact (v_P semantics)
map("x", "p", "P", { desc = "Paste (keep register)" })
