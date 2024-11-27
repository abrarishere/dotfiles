vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt --for ease

--Splits
opt.splitright = true
opt.splitbelow = true

-- Line numbers
opt.number = true
opt.relativenumber = true

opt.termguicolors = true -- for true color support
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.wrap = true -- for mobile version

-- Searching
opt.smartcase = true
opt.ignorecase = true
opt.cursorline = true

-- Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- Backup
opt.backup = false
opt.writebackup = false

-- Clipboard
opt.clipboard = "unnamedplus"

-- vim.opt.spell = true
-- vim.opt.spelllang = { "en_us" }

vim.g.autoformat = true
vim.opt.fillchars = {
	fold = " ",
	foldopen = "▸",
	foldclose = "▾",
	foldsep = " ",
	diff = "╱",
	eob = " ",
}
-- vim.opt.listchars = {
-- 	tab = ">>>",
-- 	trail = "·",
-- 	precedes = "←",
-- 	extends = "→",
-- 	eol = "↲",
-- 	nbsp = "␣",
-- }
-- vim.opt.list = true
opt.autowrite = true -- Enable auto write
opt.foldnestmax = 4
opt.foldlevel = 1
opt.foldcolumn = "1"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldmethod = "expr"
opt.foldlevelstart = 99
opt.foldenable = true
opt.sidescrolloff = 8 -- Columns of context
opt.scrolloff = 8 -- Lines of context
opt.showmatch = true -- Show matching brackets
opt.incsearch = true -- Incremental search
opt.hlsearch = true -- Highlight search results
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Override ignorecase if pattern has uppercase

opt.showcmd = true
opt.cmdheight = 0
opt.laststatus = 0
opt.scrolloff = 10
