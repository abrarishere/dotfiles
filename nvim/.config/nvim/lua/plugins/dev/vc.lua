return {
	-- -- Core Git functionality
	-- {
	-- 	"tpope/vim-fugitive",
	-- 	-- lazy = true,
	-- },

	-- Git signs and hunk actions
	{
		"lewis6991/gitsigns.nvim",
		event = "VeryLazy",
		-- event = { "BufReadPre", "BufNewFile" },
		opts = {
			on_attach = function(bufnr)
				local gs = require("gitsigns")

				local function map(mode, lhs, rhs, opts)
					vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = opts.desc })
				end

				-- Navigation
				map("n", "]h", gs.next_hunk, { desc = "Next Hunk" })
				map("n", "[h", gs.prev_hunk, { desc = "Prev Hunk" })

				-- Actions
				map("n", "<leader>hs", gs.stage_hunk, { desc = "Stage hunk" })
				map("n", "<leader>hr", gs.reset_hunk, { desc = "Reset hunk" })
				map("v", "<leader>hs", function()
					gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Stage hunk" })
				map("v", "<leader>hr", function()
					gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
				end, { desc = "Reset hunk" })

				map("n", "<leader>hS", gs.stage_buffer, { desc = "Stage buffer" })
				map("n", "<leader>hR", gs.reset_buffer, { desc = "Reset buffer" })

				map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
				map("n", "<leader>hp", gs.preview_hunk, { desc = "Preview hunk" })

				map("n", "<leader>hb", function()
					gs.blame_line({ full = true })
				end, { desc = "Blame line" })
				map("n", "<leader>hB", gs.toggle_current_line_blame, { desc = "Toggle line blame" })

				map("n", "<leader>hd", gs.diffthis, { desc = "Diff this" })
				map("n", "<leader>hD", function()
					gs.diffthis("~")
				end, { desc = "Diff this ~" })

				-- Quickfix List
				map("n", "<leader>hq", gs.setqflist, { desc = "Hunks to quickfix list" })

				-- Text object
				map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Gitsigns select hunk" })
			end,
		},
	},

	-- LazyGit integration
	{
		"kdheepak/lazygit.nvim",
		-- lazy = true,
		event = "VeryLazy",
		cmd = "LazyGit",
		keys = {
			{ "<leader>lt", "<cmd>LazyGit<CR>", desc = "Open LazyGit" },
		},
		config = function()
			-- Additional LazyGit configuration if needed
		end,
	},
	-- -- Git conflict markers
	{ "akinsho/git-conflict.nvim", version = "*", config = true, event = "VeryLazy" },
	-- Neogit
	{
		"NeogitOrg/neogit",
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},
}
