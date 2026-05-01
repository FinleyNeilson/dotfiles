return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({
				install_dir = vim.fn.stdpath("data") .. "/site",
			})

			ts.install({
				"lua",
				"vim",
				"vimdoc",
				"query",
				"python",
				"javascript",
				"c",
				"cpp",
				"rust",
				"go",
				"markdown",
				"markdown_inline",
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					local lang = vim.treesitter.language.get_lang(vim.bo.filetype)
					if lang then
						pcall(vim.treesitter.start)
					end
				end,
			})

			vim.api.nvim_create_autocmd("FileType", {
				callback = function()
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},
}
