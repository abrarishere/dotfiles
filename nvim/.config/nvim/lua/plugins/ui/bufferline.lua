return {
	"akinsho/bufferline.nvim",
	lazy = true,
	event = "VeryLazy",
	-- event = "BufWinEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		options = {
			mode = "tabs", -- Switch to tabpages mode
			numbers = "none", -- Ensure buffer numbers are not shown
			indicator = {
				icon = "▎", -- Icon shown before the buffer name
				style = "icon",
			},
			modified_icon = "✎", -- Icon for modified buffers
			close_icon = "✘", -- Icon for closing the tabline
			left_trunc_marker = "◁", -- Icon for truncating left side
			right_trunc_marker = "▷", -- Icon for truncating right side
			max_name_length = 18, -- Maximum buffer name length
			max_prefix_length = 15, -- Maximum length of buffer prefix
			tab_size = 20, -- Tab size
			diagnostics = "nvim_lsp", -- Show diagnostics in bufferline
			diagnostics_update_in_insert = false,
			offsets = { -- Offset for file explorer
				{
					filetype = "NvimTree",
					text = "File Explorer",
					highlight = "Directory",
					text_align = "left",
				},
			},
			show_buffer_icons = true, -- Show file type icons
			show_buffer_close_icons = true, -- Show close icon for buffers
			show_close_icon = false, -- Don't show close icon for tabs
			show_tab_indicators = true, -- Show tab indicators
			persist_buffer_sort = true, -- Persist buffer sorting
			separator_style = "thin", -- Use thin separators (not slanted)
			enforce_regular_tabs = true, -- Enforce regular tab sizes
			always_show_bufferline = true, -- Always show bufferline
			sort_by = "id", -- Sort buffers by ID
		},
	},
}
