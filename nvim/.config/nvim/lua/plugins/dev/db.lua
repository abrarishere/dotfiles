return {
	"kristijanhusak/vim-dadbod-ui",
	lazy = true,
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
	},
	cmd = {
		"DBUI",
		"DBUIToggle",
		"DBUIAddConnection",
		"DBUIFindBuffer",
	},
	init = function()
		-- Global configuration for vim-dadbod-ui
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_use_tabline = 1 -- Display database connections in a tabline
		vim.g.db_ui_table_helpers = { "sql", "mysql", "plsql" } -- Enable helpers for specific SQL types
	end,
	config = function() end,
}
