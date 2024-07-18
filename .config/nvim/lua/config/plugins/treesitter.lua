return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "python", "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "norg" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},

	{ "nvim-treesitter/playground" }, -- The tree can be toggled using the command :TSPlaygroundToggle
}
