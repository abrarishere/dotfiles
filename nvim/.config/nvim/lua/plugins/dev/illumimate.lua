return {
	"RRethy/vim-illuminate",
	-- event = "BufRead",
	event = "VeryLazy",
	config = function()
		require("illuminate")
	end,
}
