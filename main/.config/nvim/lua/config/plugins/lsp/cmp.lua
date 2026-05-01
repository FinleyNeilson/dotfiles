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
			"onsails/lspkind-nvim",
			{ "roobert/tailwindcss-colorizer-cmp.nvim", config = true },
		},
		config = function()
			local cmp = require("cmp")
			local lsp_kind = require("lspkind")

			lsp_kind.init({
				mode = "symbol_text",
				preset = "codicons",
				symbol_map = {
					copilot = "",
				},
			})

			vim.api.nvim_set_hl(0, "CmpItemKindCopilot", { fg = "#6CC644" })

			local cmp_next = function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				else
					fallback()
				end
			end
			local cmp_prev = function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end

			cmp.setup({
				enabled = function()
					if vim.b.__telescope_picker then
						return false
					end
					return true
				end,
				preselect = cmp.PreselectMode.None,
				window = {
					completion = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						winhighlight = "Normal:Normal,FloatBorder:LspBorderBG,CursorLine:PmenuSel,Search:None",
					}),
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, vim_item)
						vim_item = lsp_kind.cmp_format({
							mode = "symbol_text",
							maxwidth = 50,
						})(entry, vim_item)

						if entry.source.name == "copilot" then
							vim_item.kind = " Copilot"
							vim_item.kind_hl_group = "CmpItemKindCopilot"
						end

						return require("tailwindcss-colorizer-cmp").formatter(entry, vim_item)
					end,
				},
				view = { entries = "bordered" },
				mapping = {
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = false,
					}),
					["<tab>"] = cmp_next,
					["<C-j>"] = cmp_next,
					["<C-k>"] = cmp_prev,
				},
				sources = {
					{ name = "copilot", priority = 1000, group_index = 1 },
					{ name = "nvim_lsp", priority = 750, group_index = 1, max_item_count = 10 },
					{ name = "nvim_lsp_signature_help", group_index = 1 },
					{ name = "nvim_lua", group_index = 1 },
					{ name = "path", group_index = 2 },
				},
				sorting = {
					priority_weight = 2,
					comparators = {
						require("copilot_cmp.comparators").prioritize,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.locality,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
}
