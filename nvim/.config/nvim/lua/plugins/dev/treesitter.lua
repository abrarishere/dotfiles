return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			-- Enable syntax highlighting
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false, -- Disable Vim's default regex highlighting for better performance
			},
			-- Enable indentation
			indent = {
				enable = true,
			},
			-- Ensure these language parsers are installed
			ensure_installed = {
				"html",
				"htmldjango",
				"css",
				"markdown_inline",
				"javascript",
				"python",
				"lua",
				"bash",
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<C-space>",
					node_incremental = "<C-space>",
					scope_incremental = "<C-s>",
					node_decremental = "<BS>",
				},
			},
		})
	end,
}
