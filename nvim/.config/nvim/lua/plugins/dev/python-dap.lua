local plugins = {
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = "mfussenegger/nvim-dap",
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")

			dapui.setup({
				-- layouts = {
				-- 	{
				-- 		elements = {
				-- 			{ id = "scopes", size = 0.25 },
				-- 			{ id = "breakpoints", size = 0.20 },
				-- 			{ id = "stacks", size = 0.20 },
				-- 			{ id = "watches", size = 0.20 },
				-- 		},
				-- 		position = "left",
				-- 		size = 35,
				-- 	},
				-- },
			})

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		-- event = "BufEnter",
		lazy = true,
		keys = {
			{ "<leader>dc", "<cmd>lua require('dap').continue()<CR>", desc = "Continue" },
			{ "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<CR>", desc = "Toggle Breakpoint" },
			{ "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>", desc = "Toggle REPL" },
			{ "<leader>ds", "<cmd>lua require('dap').start()<CR>", desc = "Start" },
			{ "<leader>dt", "<cmd>lua require('dap').stop()<CR>", desc = "Stop" },
			{ "<leader>di", "<cmd>lua require('dap').step_into()<CR>", desc = "Step Into" },
			{ "<leader>do", "<cmd>lua require('dap').step_over()<CR>", desc = "Step Over" },
			{ "<leader>du", "<cmd>lua require('dap').step_out()<CR>", desc = "Step Out" },
			{ "<leader>dp", "<cmd>lua require('dap').pause()<CR>", desc = "Pause" },
			{ "<leader>dl", "<cmd>lua require('dap').run_last()<CR>", desc = "Run Last" },
		},
	},
	{
		"mfussenegger/nvim-dap-python",
		lazy = true,
		ft = "python",
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			local python_path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
			require("dap-python").setup(python_path)
		end,
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		lazy = true,
		opts = {
			enabled = true,
			highlight_changed_variables = true,
			highlight_new_as_changed = false,
			show_stop_reason = true,
			commented = false,
			only_first_definition = true,
			clear_on_continue = false,
			display_callback = function(variable, buf, stackframe, node, options)
				local value = variable.value:gsub("%s+", " ")
				if options.virt_text_pos == "inline" then
					return " = " .. value
				else
					return variable.name .. " = " .. value
				end
			end,
			virt_text_pos = vim.fn.has("nvim-0.10") == 1 and "inline" or "eol",
			all_frames = false,
			virt_lines = false,
		},
	},
}

return plugins
