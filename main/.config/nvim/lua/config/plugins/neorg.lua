return {
	{
		"FinleyNeilson/neorg",
		lazy = false, -- fork's main branch adds `:Neorg journal agenda`; switch back to nvim-neorg/neorg + version = "*" if/when merged upstream
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.export"] = {},
					["core.concealer"] = {
						config = {
							icon_preset = "basic", -- basic varied diamond
						},
					},
					["core.summary"] = {},
					["core.keybinds"] = {
						config = {
							default_keybinds = false,
						},
					},
					["core.journal"] = {
						config = {
							strategy = "nested", -- nested, flat
							workspace = "personal",
						},
					},
					["core.esupports.hop"] = {
						config = {
							-- Use the system's default opener (same as markdown)
							external_opener = function(uri)
								-- This uses Neovim's built-in ui.open which respects your system settings
								vim.ui.open(uri)
							end,
						},
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								programming = "~/notes/programming",
								philosophy = "~/notes/philosophy",
								personal = "~/notes/personal",
							},
							default_workspace = "programming",
						},
					},
				},
			})
		end,
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-neorg/tree-sitter-norg" }, -- Pulls parser directly
			{ "nvim-neorg/tree-sitter-norg-meta" }, -- Pulls meta parser directly
		},
	},
	-- {
	-- 	"chrisgrieser/nvim-origami",
	-- 	ft = "norg",
	-- 	opts = {
	-- 		foldtext = {
	-- 			lineCount = {
	-- 				template = " %d",
	-- 			},
	-- 		},
	-- 	},
	-- },
	{
		"luukvbaal/statuscol.nvim",
		ft = "norg",
		config = function()
			local builtin = require("statuscol.builtin")
			require("statuscol").setup({
				relculright = true,
				segments = {
					{
						sign = { namespace = { "gitsigns" }, maxwidth = 1, colwidth = 1, auto = true },
						click = "v:lua.ScSa",
					},
					{ text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
					{ text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
				},
			})
		end,
	},
}
