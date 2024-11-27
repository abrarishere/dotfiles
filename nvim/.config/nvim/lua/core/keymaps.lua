vim.g.mapleader = " "

local keymap = vim.keymap.set

-- Awesome keykeymaps
keymap("i", "jk", "<ESC>", { desc = "jk to exit insert mode" })
keymap("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" }) -- join lines without moving cursor
keymap("n", "Y", "y$", { desc = "Yank to end of line" }) -- yank to end of line
keymap("x", "<leader>p", [["_dP]], { desc = "Paste over selected text without copying it" }) -- paste over selected text
keymap("x", "<leader>d", "_d", { desc = "Delete without copying to clipboard" }) -- delete without copying to clipboard
keymap("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- Window Management
keymap("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Window Navigation
keymap("n", "n", "nzzzv", { desc = "Move to next search result and center" }) -- move to next search result and center
keymap("n", "N", "Nzzzv", { desc = "Move to previous search result and center" }) -- move to previous search result and center
keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down half page and center" }) -- scroll down half page and center
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up half page and center" }) -- scroll up half page and center

-- Increment and Decrement
keymap("n", "<leader>+", "<C-a>", { desc = "Increment number under cursor" }) -- increment number under cursor
keymap("n", "<leader>-", "<C-x>", { desc = "Decrement number under cursor" }) -- decrement number under cursor
