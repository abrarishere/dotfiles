local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Awesome keymaps
keymap("i", "jk", "<ESC>", vim.tbl_extend("force", opts, { desc = "jk to escape" })) -- jk to escape
keymap("n", "J", "mzJ`z", vim.tbl_extend("force", opts, { desc = "Join lines without moving cursor" })) -- join lines without moving cursor
keymap("n", "Y", "y$", vim.tbl_extend("force", opts, { desc = "Yank to end of line" })) -- yank to end of line
keymap(
  "x",
  "<leader>p",
  [["_dP]],
  vim.tbl_extend("force", opts, { desc = "Paste over selected text without copying it" })
) -- paste over selected text

keymap("x", "<leader>d", "_d", vim.tbl_extend("force", opts, { desc = "Delete without copying to clipboard" })) -- delete without copying to clipboard
keymap("n", "<leader>nh", ":nohl<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlights" }))
keymap("n", "<C-a>", "ggVG", vim.tbl_extend("force", opts, { desc = "Select all" }))
keymap("n", "x", '"_x', vim.tbl_extend("force", opts, { desc = "Delete character without yanking" }))

-- Window Management
keymap("n", "<leader>sv", "<C-w>v", vim.tbl_extend("force", opts, { desc = "Split window vertically" })) -- split window vertically
keymap("n", "<leader>sh", "<C-w>s", vim.tbl_extend("force", opts, { desc = "Split window horizontally" })) -- split window horizontally
keymap("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Make splits equal size" })) -- make split windows equal width & height
keymap("n", "<leader>sx", "<cmd>close<CR>", vim.tbl_extend("force", opts, { desc = "Close current split" })) -- close current split window

keymap("n", "<leader>to", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "Open new tab" })) -- open new tab
keymap("n", "<leader>tx", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close current tab" })) -- close current tab
keymap("n", "<leader>tn", "<cmd>tabn<CR>", vim.tbl_extend("force", opts, { desc = "Go to next tab" })) --  go to next tab
keymap("n", "<leader>tp", "<cmd>tabp<CR>", vim.tbl_extend("force", opts, { desc = "Go to previous tab" })) --  go to previous tab
keymap(
  "n",
  "<leader>tf",
  "<cmd>tabnew %<CR>",
  vim.tbl_extend("force", opts, { desc = "Open current buffer in new tab" })
) --  move current buffer to new tab

-- Window Navigation
keymap("n", "n", "nzzzv", vim.tbl_extend("force", opts, { desc = "Move to next search result and center" })) -- move to next search result and center
keymap("n", "N", "Nzzzv", vim.tbl_extend("force", opts, { desc = "Move to previous search result and center" })) -- move to previous search result and center
keymap("n", "<C-d>", "<C-d>zz", vim.tbl_extend("force", opts, { desc = "Scroll down half page and center" })) -- scroll down half page and center
keymap("n", "<C-u>", "<C-u>zz", vim.tbl_extend("force", opts, { desc = "Scroll up half page and center" })) -- scroll up half page and center

-- Increment and Decrement
keymap("n", "<leader>+", "<C-a>", vim.tbl_extend("force", opts, { desc = "Increment number under cursor" })) -- increment number under cursor
keymap("n", "<leader>-", "<C-x>", vim.tbl_extend("force", opts, { desc = "Decrement number under cursor" })) -- decrement number under cursor
