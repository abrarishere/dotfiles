return {
	{
		"rcarriga/nvim-notify",
		-- lazy = true,
		config = function()
			local notify = require("notify")

			-- Setup for nvim-notify
			notify.setup({
				stages = "fade_in_slide_out", -- Animation stages for notifications
				timeout = 3000, -- Time in milliseconds before notifications disappear
				max_width = 60, -- Maximum width of notifications
				max_height = 10, -- Maximum height of notifications
				background_colour = "#1e1e1e44", -- Background color
				-- Custom icons
				icons = {
					ERROR = "",
					WARN = "",
					INFO = "",
					DEBUG = "",
					TRACE = "✎",
				},
				render = "minimal", -- Use a minimal render style
			})

			-- Override default vim.notify to use nvim-notify
			vim.notify = notify

			-- Set key mappings for managing notifications
			local keymap = vim.keymap -- For conciseness

			-- Clear all notifications
			keymap.set("n", "<leader>nc", function()
				notify.dismiss() -- Clear all notifications
			end, { desc = "Clear all notifications" })
		end,
	},
}
