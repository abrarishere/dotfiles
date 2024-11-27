return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	lazy = true,
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
		"nvim-treesitter/nvim-treesitter", -- Ensure Treesitter is available
	},
	config = function()
		-- Import the Comment plugin
		local comment = require("Comment")

		-- Import Treesitter context commentstring integration
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- Setup the Comment plugin
		comment.setup({
			--- Add any additional configurations here if needed
			pre_hook = ts_context_commentstring.create_pre_hook(), -- Context-aware commentstring for Treesitter
			post_hook = nil, -- You can define post_hook if needed
			mappings = {
				basic = true, -- Enable basic mappings
				extra = true, -- Enable extra mappings
				extended = false, -- Enable extended mappings
			},
			ignore = "^$", -- Ignore empty lines
			-- Other configurations can be added here
		})
	end,
}
