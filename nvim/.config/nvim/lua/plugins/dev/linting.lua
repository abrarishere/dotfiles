return {
	"mfussenegger/nvim-lint",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		-- Define linters for different file types
		lint.linters_by_ft = {
			javascript = { "eslint_d" },
			typescript = { "eslint_d" },
			javascriptreact = { "eslint_d" },
			typescriptreact = { "eslint_d" },
			svelte = { "eslint_d" },
			python = { "pylint", "ruff" },
			sql = { "sqlfluff" },
			php = { "phpcs" },
		}

		-- Configure specific linters
		lint.linters.pylint.cmd = "python"
		lint.linters.pylint.args = { "-m", "pylint", "-f", "json" }

		-- Create an autocommand group for linting
		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		-- Define autocommands to trigger linting on various events
		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		-- Keymap to manually trigger linting
		vim.keymap.set("n", "<leader>ll", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })

		-- Optional: Configure linters to run only when files are saved
		-- Uncomment the following lines if you prefer to lint only on save
		-- vim.api.nvim_create_autocmd("BufWritePost", {
		--   group = lint_augroup,
		--   callback = function()
		--     lint.try_lint()
		--   end,
		-- })
	end,
}
