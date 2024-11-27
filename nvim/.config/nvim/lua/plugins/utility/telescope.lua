return {
	"nvim-telescope/telescope.nvim",
	-- lazy = true,
	event = "VeryLazy",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		{
			"junegunn/fzf.vim",
			run = function()
				require("transparent").clear_prefix("Fzf")
				vim.fn["fzf#install"]()
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		require("transparent").clear_prefix("Telescope")

		-- Basic Telescope setup
		telescope.setup({
			defaults = {
				prompt_prefix = "🔭 ",
				selection_caret = " ",
				entry_prefix = "  ",
				multi_icon = " ",
				file_ignore_patterns = { ".git/", "node_modules/", "env/", "venv/" },
				path_display = { "smart" },
				sorting_strategy = "ascending",
				layout_strategy = "flex",
				layout_config = {
					horizontal = { prompt_position = "top", preview_width = 0.5 },
					vertical = { prompt_position = "top", preview_height = 0.5 },
					flex = { horizontal = { preview_width = 0.5 } },
				},
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
					n = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-h>"] = actions.close,
					},
				},
				preview = {
					timeout = 500,
				},
			},
		})

		-- Load the fzf extension
		telescope.load_extension("fzf")

		-- Key mappings
		local keymap = vim.keymap

		keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").find_files({
				no_ignore = false,
				hidden = false,
			})
		end, { desc = "Fuzzy find files in cwd" })

		keymap.set("n", "<leader>fr", function()
			require("telescope.builtin").oldfiles({
				only_cwd = true,
			})
		end, { desc = "Fuzzy find recent files" })

		keymap.set("n", "<leader>fs", function()
			require("telescope.builtin").live_grep({
				additional_args = function()
					return { "--hidden" }
				end,
			})
		end, { desc = "Find string in cwd" })

		keymap.set("n", "<leader>fc", function()
			require("telescope.builtin").grep_string({
				search = vim.fn.expand("<cword>"),
			})
		end, { desc = "Find string under cursor in cwd" })

		keymap.set("n", "<leader>fT", function()
			require("telescope.builtin").builtin()
		end, { desc = "Open Telescope menu" })

		keymap.set("n", "<leader>fh", function()
			require("telescope.builtin").help_tags()
		end, { desc = "Find help tags" })

		keymap.set("n", "<leader>fg", function()
			require("telescope.builtin").git_commits()
		end, { desc = "Find git commits" })

		keymap.set("n", "<leader>fb", function()
			require("telescope.builtin").git_branches()
		end, { desc = "Find git branches" })

		keymap.set("n", "<leader>fd", function()
			require("telescope.builtin").git_status()
		end, { desc = "Find git status" })
	end,
}
