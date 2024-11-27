return {
	"xiyaowong/transparent.nvim",
	event = "VeryLazy",
	opts = {
		extra_groups = {
			"NormalFloat", -- plugins which have float panel such as Lazy, Mason, LspInfo
			"NvimTreeNormal", -- NvimTree
			"NeoTreeNormal", -- NeoTree
			"Telescope",
		},
		exclude_groups = {
			"TelescopeSelection",
		},
	},
}
