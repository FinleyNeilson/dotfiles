require("config.core.options")
require("config.core.keymaps")
require("config.core.autocmds")
require("config.modules.hunk").setup()

vim.filetype.add({
	extension = {
		mdx = "mdx",
	},
})
