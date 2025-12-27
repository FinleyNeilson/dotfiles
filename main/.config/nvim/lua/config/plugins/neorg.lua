return {
	"nvim-neorg/neorg",
	lazy = false,
	version = "*",
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {
					config = {
						icon_preset = "basic", -- basic varied diamond
						init_open_folds = "never",
					},
				},
				["core.summary"] = {},
				["core.keybinds"] = {
					config = {
						default_keybinds = true,
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
}
