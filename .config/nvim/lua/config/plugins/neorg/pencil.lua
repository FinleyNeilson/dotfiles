return {
	"preservim/vim-pencil",
	config = function()
		-- Enable filetype plugin (usually already set)
		vim.cmd("filetype plugin on")

		-- Define the autocmds for enabling SoftPencil
		vim.api.nvim_create_augroup("pencil", { clear = true })

		vim.api.nvim_create_autocmd("FileType", {
			group = "pencil",
			pattern = { "norg", "markdown" },
			callback = function()
				vim.cmd("PencilSoft")
			end,
		})
	end,
}
