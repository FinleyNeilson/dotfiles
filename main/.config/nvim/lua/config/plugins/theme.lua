return {
	{ "rose-pine/neovim", lazy = false },
	{ "catppuccin/nvim", lazy = false },
	{ "dgox16/oldworld.nvim", lazy = false },
	{ "sainnhe/everforest", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "AlexvZyl/nordic.nvim", lazy = false },
	{ "shaunsingh/nord.nvim", lazy = false },
	{ "thesimonho/kanagawa-paper.nvim", lazy = false },
	{ "sainnhe/gruvbox-material", lazy = false },
	{ "slugbyte/lackluster.nvim", lazy = false },
	{ "vague2k/vague.nvim", lazy = false },
	{ "dasupradyumna/midnight.nvim", lazy = false },
	{ "webhooked/kanso.nvim", lazy = false },
	{ "metalelf0/black-metal-theme-neovim", lazy = false },
	{
		"cdmill/neomodern.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("neomodern").setup({})
			require("neomodern").load()
		end,
	},
	{
		"zaldih/themery.nvim",
		lazy = false,

		config = function()
			local function quickscope_highlight(primary, secondary)
				return string.format(
					[[
                        vim.api.nvim_set_hl(0, "QuickScopePrimary", {
                            fg = "%s",
                            underline = true,
                        })
                        vim.api.nvim_set_hl(0, "QuickScopeSecondary", {
                            fg = "%s",
                            underline = true,
                        })
                    ]],
					primary,
					secondary
				)
			end

			local function transparent_background()
				return [[
                        vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "FloatBorder", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "CursorLine", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "CursorLineNr", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "LineNr", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "Folded", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "FoldColumn", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "VertSplit", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "WinSeparator", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "StatusLine", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "TabLine", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none", ctermbg = "none" })
                        vim.api.nvim_set_hl(0, "ZenBg", { bg = "none", ctermbg = "none" })
                        vim.opt.cursorline = false
                      ]]
			end

			require("themery").setup({
				livePreview = true,
				themes = {
					{
						name = "burzum",
						colorscheme = "burzum",
						after = quickscope_highlight("#ddeecc", "#99bbaa"),
					},
					{
						name = "rose-pine-moon-prime",
						colorscheme = "rose-pine-moon",
						before = [[
                                    require("rose-pine").setup({
                                        dim_inactive_windows = false,
                                        styles = {
                                            bold = true,
                                            italic = false,
                                        },
                                    })
                                ]],
						after = transparent_background() .. quickscope_highlight("#9ccfd8", "#c4a7e7"),
					},
					{
						name = "catppuccin-mocha-prime",
						colorscheme = "catppuccin-mocha",
						after = transparent_background() .. quickscope_highlight("#74c7ec", "#eba0ac"),
					},
					{
						name = "kanso",
						colorscheme = "kanso-zen",
						after = quickscope_highlight("#C34043", "#DCA561"),
					},
					{
						name = "oldworld",
						colorscheme = "oldworld",
						after = quickscope_highlight("#E6B99D", "#90B99F"),
					},
					{
						name = "kanagawa",
						colorscheme = "kanagawa-paper-ink",
						after = quickscope_highlight("#A292A3", "#C4B28A"),
					},
					{
						name = "hojicha",
						colorscheme = "hojicha",
						after = quickscope_highlight("#808796", "#8bab85"),
					},
					{
						name = "rose-pine-moon",
						colorscheme = "rose-pine-moon",
						before = [[
                                    require("rose-pine").setup({
                                        dim_inactive_windows = false,
                                        styles = {
                                            bold = true,
                                            italic = false,
                                        },
                                    })
                                ]],
						after = quickscope_highlight("#9ccfd8", "#c4a7e7"),
					},
					{
						name = "nord",
						colorscheme = "nord",
						before = [[
                                    vim.g.nord_italic = true
                                    require('nord').set()
                                ]],
						after = quickscope_highlight("#88C0D0", "#5E81AC"),
					},
					{
						name = "everforest-hard",
						colorscheme = "everforest",
						before = [[
                        vim.opt.background = "dark"
                        vim.g.everforest_background = "hard"
                        ]],
						after = [[
                                require("config.modules.render_config").config()
                                ]],
					},
					{
						name = "gruvbox",
						colorscheme = "gruvbox-material",
						after = quickscope_highlight("#8ec07c", "#83a598"),
					},
				},
			})
		end,
		keys = {
			{ "<leader>th", ":Themery<CR>", desc = "toggle Themery" },
		},
	},
}
