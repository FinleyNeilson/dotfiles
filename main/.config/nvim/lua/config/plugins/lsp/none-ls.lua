return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style=LLVM" },
				}),
				null_ls.builtins.formatting.goimports,
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"svelte",
						"astro",
						"css",
						"scss",
						"less",
						"json",
						"json5",
						"jsonc",
						"yaml",
						"graphql",
					},
				}),
				null_ls.builtins.formatting.markdownlint.with({
					extra_args = { "--config", "/home/finley/.config/nvim/markdownlint.json" },
				}),

				null_ls.builtins.diagnostics.markdownlint.with({
					diagnostics_format = "#{m} (#{c})",
					extra_args = { "--config", "/home/finley/.config/nvim/markdownlint.json" },
				}),
				null_ls.builtins.diagnostics.golangci_lint,
			},
		})
		vim.keymap.set("n", "<leader><CR>", function()
			vim.lsp.buf.format({
				filter = function(client)
					return client.name ~= "ts_ls" and client.name ~= "eslint"
				end,
			})
		end, { desc = "format buffer (prettier/none-ls, not tsserver)" })

		-- markdownlint is registered but off by default; toggle with <leader>tm
		null_ls.disable({ name = "markdownlint" })
	end,
}
