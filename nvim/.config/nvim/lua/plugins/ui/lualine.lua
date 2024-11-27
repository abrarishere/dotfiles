-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	event = "VeryLazy",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		local lualine = require("lualine")
-- 		local lazy_status = require("lazy.status")

-- 		-- Custom function to display the visual selection count
-- 		local function selection_count()
-- 			local mode = vim.fn.mode()
-- 			if mode == "v" or mode == "V" or mode == "" then
-- 				local start_pos = vim.fn.line("v")
-- 				local end_pos = vim.fn.line(".")
-- 				local count = math.abs(end_pos - start_pos) + 1
-- 				return count .. " lines"
-- 			elseif mode == "v" then
-- 				local start_pos = vim.fn.col("v")
-- 				local end_pos = vim.fn.col(".")
-- 				local count = math.abs(end_pos - start_pos) + 1
-- 				return count .. " chars"
-- 			end
-- 			return ""
-- 		end

-- 		-- Custom section separators (rectangle-like with slight rounding)
-- 		local rectangle_separators = { left = "", right = "" }

-- 		lualine.setup({
-- 			options = {
-- 				icons_enabled = true,
-- 				-- theme = "powerline_dark",
-- 				component_separators = { left = "|", right = "|" },
-- 				section_separators = rectangle_separators,
-- 				disabled_filetypes = { "NvimTree", "dashboard", "startify" },
-- 				always_divide_middle = true,
-- 				globalstatus = true,
-- 			},
-- 			sections = {
-- 				lualine_a = {
-- 					{
-- 						"mode",
-- 						upper = true,
-- 						color = { bg = "#005f87", fg = "#ffffff" }, -- Blue background with white text
-- 					},
-- 				},
-- 				lualine_b = {
-- 					{ "branch", color = { bg = "#afd700", fg = "#000000" } }, -- Green background with black text
-- 					{ "diff", color = { bg = "#ffaf00", fg = "#000000" } }, -- Yellow background with black text
-- 					{ "diagnostics", color = { bg = "#ff5f5f", fg = "#000000" } }, -- Red background with black text
-- 				},
-- 				lualine_c = {
-- 					{ "filename", path = 1, color = { bg = "#5f87ff", fg = "#ffffff" } }, -- Blue background with white text
-- 					{ selection_count, color = { bg = "#d75f87", fg = "#ffffff" } }, -- Pink background with white text
-- 				},
-- 				lualine_x = {
-- 					{
-- 						lazy_status.updates,
-- 						cond = lazy_status.has_updates,
-- 						color = { bg = "#ff9e64", fg = "#000000" }, -- Orange background with black text
-- 					},
-- 					{ "encoding", color = { bg = "#00afaf", fg = "#000000" } }, -- Cyan background with black text
-- 					{ "filetype", color = { bg = "#87d7af", fg = "#000000" } }, -- Greenish background with black text
-- 				},
-- 				lualine_y = {
-- 					{ "progress", color = { bg = "#5f8787", fg = "#ffffff" } }, -- Greyish background with white text
-- 				},
-- 				lualine_z = {
-- 					{ "location", color = { bg = "#af87d7", fg = "#ffffff" } }, -- Purple background with white text
-- 				},
-- 			},
-- 			inactive_sections = {
-- 				lualine_a = { { "filename", color = { bg = "#5f87ff", fg = "#ffffff" } } },
-- 				lualine_b = {},
-- 				lualine_c = {},
-- 				lualine_x = { { "location", color = { bg = "#5f8787", fg = "#ffffff" } } },
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 			},
-- 			tabline = {},
-- 			extensions = {
-- 				"quickfix",
-- 				"lazy",
-- 				"mason",
-- 				"nvim-tree",
-- 			},
-- 		})
-- 	end,
-- } --
--

return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	enabled = false,
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status")

		lualine.setup({
			options = {
				-- Theme would be set elsewhere or default
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				icons_enabled = true, -- Ensure nvim-web-devicons is installed and configured
				disabled_filetypes = { "NvimTree", "dashboard", "startify" }, -- Disable for specific file types
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode", upper = true }, -- Display mode in uppercase
				},
				lualine_b = { "branch", "diff", "diagnostics" }, -- Git branch, diff, and diagnostics
				lualine_c = {
					{ "filename", path = 1 }, -- Show relative file path
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "filetype" },
				},
				lualine_y = { "progress" }, -- File progress percentage
				lualine_z = { "location" }, -- Cursor location in the file
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = { "location" },
				lualine_y = {},
				lualine_z = {},
			},
			tabline = {},
			extensions = { "quickfix", "fugitive", "nvim-tree" }, -- Add extensions for more functionality
		})
	end,
}
