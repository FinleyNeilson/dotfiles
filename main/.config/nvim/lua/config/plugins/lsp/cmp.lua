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

			lsp_kind.init()
			---@diagnostic disable-next-line
			cmp.setup({
				enabled = function()
					-- Disable nvim-cmp when Telescope is open
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
				---@diagnostic disable-next-line
				view = {
					entries = "bordered",
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
					["<tab>"] = cmp_next,
					["<C-j>"] = cmp_next,
					["<C-k>"] = cmp_prev,
				},
				sources = {
					{ name = "nvim_lsp_signature_help", group_index = 1 },
					{ name = "nvim_lsp", max_item_count = 20, group_index = 1 },
					{ name = "nvim_lua", group_index = 1 },
					{ name = "path", group_index = 2 },
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
