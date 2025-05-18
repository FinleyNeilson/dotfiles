return {
	{ "rose-pine/neovim", lazy = false },
	{ "catppuccin/nvim", lazy = false },
	{ "dgox16/oldworld.nvim", lazy = false },
	{ "sainnhe/everforest", lazy = false },
	{ "rebelot/kanagawa.nvim", lazy = false },
	{ "AlexvZyl/nordic.nvim", lazy = false },
	{ "thesimonho/kanagawa-paper.nvim", lazy = false },
	{ "sainnhe/gruvbox-material", lazy = false },
	{ "slugbyte/lackluster.nvim", lazy = false },
	{ "vague2k/vague.nvim", lazy = false },
	{ "dasupradyumna/midnight.nvim", lazy = false },
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
                    vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
                    vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
                ]]
			end

			require("themery").setup({
				livePreview = true, -- Apply theme while picking. Default to true.
				themes = {
					-- Dark Themes
					{
						name = "rose-pine",
						colorscheme = "rose-pine-main",
					},
					{
						name = "rose-pine-moon-prime",
						colorscheme = "rose-pine-moon",
						after = transparent_background() .. quickscope_highlight("#9ccfd8", "#c4a7e7"),
					},
					{
						name = "oldworld",
						colorscheme = "oldworld",
						after = quickscope_highlight("#E6B99D", "#90B99F"),
					},
					{
						name = "catppuccin-mocha",
						colorscheme = "catppuccin-mocha",
						before = [[
                                     vim.opt.background = "dark"
                                 ]],
					},
					{
						name = "everforest-hard",
						colorscheme = "everforest",
						before = [[
                                vim.opt.background = "dark"
                                vim.g.everforest_background = "hard"
                                ]],
					},
					{
						name = "gruvbox",
						colorscheme = "gruvbox-material",
					},
				},
			})
		end,
		keys = {
			{ "<leader>th", ":Themery<CR>", desc = "toggle Themery" },
		},
	},
}
