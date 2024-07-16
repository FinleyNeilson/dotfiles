return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		-- get access to the none-ls functions
		local null_ls = require("null-ls")
		-- run the setup function for none-ls to setup our different formatters
		null_ls.setup({
			sources = {
				-- setup lua formatter
				null_ls.builtins.formatting.stylua,
				-- setup black for python formatting
				null_ls.builtins.formatting.black,
				-- setup prettier to format languages that are not lua
				null_ls.builtins.formatting.prettier,
			},

			-- format on save
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ async = false })
						end,
					})
				end
			end,
		})

		-- set up a vim motion for <Space> = to automatically format our code based on which langauge server is active
		vim.keymap.set("n", "<leader>=", vim.lsp.buf.format, { desc = "[C]ode [F]ormat" })
	end,
}
