return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lua",
			-- "windwp/nvim-autopairs", - I'm using nvim-autopairs separately
			"onsails/lspkind-nvim",
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- LuaSnip keybindings for expanding and jumping
			vim.keymap.set({ "i" }, "<C-K>", function()
				luasnip.expand()
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-L>", function()
				luasnip.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<C-J>", function()
				luasnip.jump(-1)
			end, { silent = true })

			vim.keymap.set({ "i", "s" }, "<C-E>", function()
				if luasnip.choice_active() then
					luasnip.change_choice(1)
				end
			end, { silent = true })

			-- Configure nvim-cmp
			lspkind.init()
			---@diagnostic disable-next-line
			cmp.setup({
				-- enabled = true,
				preselect = cmp.PreselectMode.None,
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
					}),
				},
				---@diagnostic disable-next-line
				view = {
					entries = "bordered",
				},
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<S-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
					["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous suggestion
					["<C-j>"] = cmp.mapping.select_next_item(), -- Next suggestion
				},
				sources = {
					{ name = "nvim_lsp_signature_help", group_index = 1 },
					{ name = "luasnip", max_item_count = 5, group_index = 1 },
					{ name = "nvim_lsp", max_item_count = 20, group_index = 1 },
					{ name = "nvim_lua", group_index = 1 },
					{ name = "vim-dadbod-completion", group_index = 1 },
					{ name = "path", group_index = 2 },
					{ name = "buffer", keyword_length = 2, max_item_count = 5, group_index = 2 },
				},
				formatting = { -- Move the formatting inside cmp.setup table
					format = lspkind.cmp_format({
						with_text = true,
						maxwidth = 50,
						menu = {
							nvim_lsp = "[LSP]",
							luasnip = "[LuaSnip]",
							nvim_lua = "[ Lua]",
							path = "[/ Path]",
							crates = " [ Crates]",
							jira_issues = "[ JIRA]",
							gh_issues = "[ GH]",
						},
					}),
				},
			})

			-- local presentAutopairs, cmp_autopairs = pcall(require, "nvim-autopairs.completion.cmp")
			-- if presentAutopairs then
			-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))
			-- end
		end,
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = { "rafamadriz/friendly-snippets" },
		event = "InsertEnter",
		postinstall = "make install_jsregexp",
		config = function()
			local luasnip = require("luasnip")
			luasnip.config.setup({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				enable_autosnippets = true,
			})
			-- Add VS Code style snippets
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},
}
