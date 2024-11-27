return {
	"windwp/nvim-autopairs",
	event = { "InsertEnter" },
	dependencies = {
		"hrsh7th/nvim-cmp", -- Dependency for completion integration
	},
	config = function()
		local autopairs = require("nvim-autopairs")
		local cmp = require("cmp")

		-- Configure autopairs
		autopairs.setup({
			check_ts = true, -- Enable Treesitter integration
			ts_config = {
				lua = { "string" }, -- Exclude pairs in Lua string nodes
				javascript = { "template_string" }, -- Exclude pairs in JavaScript template strings
				java = false, -- Disable Treesitter checking for Java
			},
			fast_wrap = {
				map = "<leader>fw", -- Map for fast wrap
				chars = { "{", "[", "(", '"', "'" },
				pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				offset = 0, -- Offset from the cursor position for wrapping
				end_key = "$", -- Key to end fast wrap (customizable)
				keys = "qwertyuiopasdfghjklzxcvbnm", -- Keys to use for fast wrap (customizable)
				check_comma = true, -- Check for comma (optional)
				highlight = "Search", -- Highlight for fast wrap (customizable)
			},
		})

		-- Integrate nvim-autopairs with nvim-cmp
		local cmp_autopairs = require("nvim-autopairs.completion.cmp")
		cmp.event:on(
			"confirm_done",
			cmp_autopairs.on_confirm_done({
				map_char = {
					tex = "", -- Disable auto-pairing in TeX files (customizable)
				},
			})
		)
	end,
}
