vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end

		vim.opt_local.conceallevel = 2
		vim.opt_local.colorcolumn = ""
		vim.g.qs_enable = 0
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2

		vim.opt.fillchars = {
			foldopen = "",
			foldclose = "",
			foldsep = " ",
		}
		vim.opt.foldcolumn = "1"

		vim.keymap.set("n", "Q", "o<ESC>kO<ESC>jgqipi<ESC>{dd}ddk", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<leader>q", "gqipi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("x", "Q", "gqi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("i", "<C-l>", "<Plug>(neorg.itero.next-iteration)", { buffer = true })
		vim.keymap.set("n", "<leader>co", "<Plug>(neorg.looking-glass.magnify-code-block)", { buffer = true })
	end,
})
