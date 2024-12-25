return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",

			{
				"ray-x/lsp_signature.nvim",
				-- event = "VeryLazy",
				config = function(_)
					opts = {
						floating_window = false,
						floating_window_above_cur_line = true,
						hint_scheme = "Comment",
					}
					require("lsp_signature").setup(opts)
				end,
			},
		},
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
			require("mason-lspconfig").setup({
				ensure_installed = {
					"html",
					"cssls",
					"pyright",
					"stimulus_ls",
				},
				handlers = {
					function(servername)
						require("lspconfig")[servername].setup({
							on_attach = require("mason").on_attach,
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,
				},
			})
			require("mason-tool-installer").setup({
				ensure_installed = {
					-- Linters
					"eslint",
					"stylelint",
					"markdownlint",
					"pylint",
					-- Formatter
					"prettier",
					-- "biome",
					"mdformat",
					"sqlfluff",
					-- DAP
					"debugpy",
					"ts-standard",
				},
			})

			local nvim_lsp = require("lspconfig")
			nvim_lsp.ruff.setup({
				-- init_options = {
				--   settings = {
				--     -- Ruff language server settings go here
				--   }
				-- }
			})
			nvim_lsp.lua_ls.setup({})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf, silent = true }
					local keybindings = {
						{ "n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", "Show LSP references" },
						-- {"n", "gR", "<cmd>Telescope lsp_references<CR>", "Show LSP references with Telescope"},
						{ "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
						{ "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", "Show LSP definitions" },
						-- {"n", "gd", "<cmd>Telescope lsp_definitions<CR>", "Show LSP definitions with Telescope"},
						{ "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", "Show LSP implementations" },
						-- {"n", "gi", "<cmd>Telescope lsp_implementations<CR>", "Show LSP implementations with Telescope"},
						{ "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Show LSP type definitions" },
						-- {"n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", "Show LSP type definitions with Telescope"},
						{ "n", "<leader>D", "<cmd>lua vim.diagnostic.setloclist()<CR>", "Show buffer diagnostics" },
						{ "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", "Smart rename" },
						-- {"n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", "Show buffer diagnostics with Telescope"},
						{ "n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", "Show line diagnostics" },
						{ "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", "Go to previous diagnostic" },
						{ "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", "Go to next diagnostic" },
						{ "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", "Show documentation" },
						{ "n", "<leader>rs", ":LspRestart<CR>", "Restart LSP" },
						{ "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", "Show code actions" },
					}
					for _, kb in pairs(keybindings) do
						opts.desc = kb[4]
						vim.keymap.set(kb[1], kb[2], kb[3], opts)
					end
				end,
			})

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end
		end,
	},

	{
		"antosha417/nvim-lsp-file-operations",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function()
			require("lsp-file-operations").setup()
		end,
	},
}
