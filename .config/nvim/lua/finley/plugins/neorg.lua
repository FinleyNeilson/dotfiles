return {
	"nvim-neorg/neorg",
	dependencies = { "luarocks.nvim" },
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.keybinds"] = {
					config = {
						neorg_leader = ",",
						hook = function(keybinds) -- By default, the key that is used to iterate on an item is <M-CR> (Alt + Enter). If you want to change the bind, remap the core.itero.next-iteration event. https://github.com/nvim-neorg/neorg/wiki/User-Keybinds
							keybinds.remap(
								"norg",
								"n",
								"<M-CR>",
								"<cmd>Neorg keybind all core.itero.next-iteration<CR>"
							)
						end,
					},
				},
				["core.completion"] = {
					config = {
						engine = "nvim-cmp",
					},
				},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							programming = "~/notes/programming",
							math = "~/notes/math",
							philosophy = "~/notes/philosophy",
						},
						index = "index.norg",
					},
				},
				["core.summary"] = {},
				["core.ui.calendar"] = {},
			},
		})
	end,
}
