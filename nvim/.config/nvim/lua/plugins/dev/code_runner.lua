return {
	"CRAG666/code_runner.nvim",
	lazy = true,
	event = "VeryLazy",
	config = function()
		local code_runner = require("code_runner")

		-- Setup code_runner with advanced configurations
		code_runner.setup({
			filetype = {
				python = "python3 -u",
				c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
				sh = "bash",
				go = "go run",
				lua = "lua",
				julia = "julia",
				typescript = "ts-node",
				javascript = "node",
				rust = "cd $dir && cargo run",
				php = "php",
				java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
				kotlin = "cd $dir && kotlinc $fileName -include-runtime -d $fileNameWithoutExt.jar && java -jar $fileNameWithoutExt.jar",
			},
		})

		-- Key mappings for code_runner
		local keymap = vim.keymap.set

		keymap("n", "<leader>rc", "<cmd>RunCode<CR>", { desc = "Run Code" })
		keymap("n", "<leader>rf", "<cmd>RunFile<CR>", { desc = "Run Code File" })
		keymap("n", "<leader>rp", "<cmd>RunProject<CR>", { desc = "Run Code Project" })
		keymap("n", "<leader>rx", "<cmd>RunClose<CR>", { desc = "Close Code Run" })
	end,
}
