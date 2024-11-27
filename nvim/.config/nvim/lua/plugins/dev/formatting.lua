return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				javascript = { "prettier" },
				typescript = { "prettier", "ts-standard" },
				javascriptreact = { "prettier", "biome" },
				typescriptreact = { "prettier" },
				svelte = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				yaml = { "prettier" },
				markdown = { "prettier", "mdformat", "markdownlint" },
				graphql = { "prettier" },
				liquid = { "prettier" },
				sql = { "sqlfluff", "sqlformatter" },
				python = {
					"isort",
					"black",
					-- To fix auto-fixable lint errors.
					"ruff_fix",
					-- To run the Ruff formatter.
					"ruff_format",
					-- To organize the imports.
					"ruff_organize_imports",
				},
				java = { "google-java-formatter", "trivy" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_fallback = true,
				-- Remove async option since it is not supported here
			},
			format_after_save = {
				lsp_fallback = true,
				async = true, -- Enable asynchronous formatting for after-save
				timeout_ms = 1500, -- Set a timeout for formatting operations
			},
		})

		-- Keybinding for formatting the current file
		vim.keymap.set("n", "<leader>mf", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1500, -- Use the same timeout as configured
			})
		end, { desc = "Format the current file" })

		-- Keybinding for formatting a selected range in visual mode
		vim.keymap.set("v", "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = true,
				timeout_ms = 1500, -- Use the same timeout as configured
			})
		end, { desc = "Format selected range" })
	end,
}
