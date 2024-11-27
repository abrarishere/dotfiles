return {
	-- {
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({
	-- 			suggestion = {
	-- 				enabled = false,
	-- 				auto_trigger = true,
	-- 				hide_during_completion = true,
	-- 				debounce = 75,
	-- 				keymap = {
	-- 					accept = "<Tab>",
	-- 					accept_word = "<leader>cw",
	-- 					accept_line = "<leader>cl",
	-- 					next = "<leader>cn",
	-- 					prev = "<leader>cp",
	-- 					dismiss = "<C-]>",
	-- 				},
	-- 			},
	-- 			panel = {
	-- 				enabled = false,
	-- 			},
	-- 		})
	-- 	end,
	-- },
	"github/copilot.vim",
	event = "InsertEnter",
}
