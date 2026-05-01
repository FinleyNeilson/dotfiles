vim.api.nvim_create_autocmd("FileType", {
	pattern = "tex",
	callback = function()
		-- vim.cmd("colorscheme yui_light")
		-- require("lualine").setup(require("lualine").get_config())

		-- Disable quickscope
		vim.g.qs_disable = 1

		vim.keymap.set("n", "Q", "gqapi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("x", "Q", "gqi<ESC>", { silent = true, noremap = true, buffer = true })
	end,
})
