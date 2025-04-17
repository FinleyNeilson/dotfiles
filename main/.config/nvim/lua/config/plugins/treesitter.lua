return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = {
					"python",
					"c",
					"cpp",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"javascript",
					"html",
					"markdown",
					"markdown_inline",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{ "nvim-treesitter/playground" }, -- The tree can be toggled using the command :TSPlaygroundToggle
	-- { "nvim-treesitter/nvim-treesitter-context" }, -- keeps the context of what method you are in etc.(The intelij feature)
}
