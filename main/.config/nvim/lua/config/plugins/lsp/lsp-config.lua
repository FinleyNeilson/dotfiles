return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"cmake",
					"ts_ls",
					"eslint",
					"html",
					"cssls",
					"gopls",
                    "jsonls",
				},
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,

					-- Go
					["gopls"] = function()
						require("lspconfig").gopls.setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							settings = {
								gopls = {
									analyses = {
										unusedparams = true,
										shadow = true,
									},
									staticcheck = true,
								},
							},
						})
					end,

					-- C++
					["clangd"] = function()
						require("lspconfig").clangd.setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							cmd = {
								"clangd",
								"--compile-commands-dir=build",
								"--fallback-style={BasedOnStyle: Google}",
							},
						})
					end,
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			vim.o.winborder = "rounded"

			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				float = { border = "rounded" },
			})

			-- Key mappings
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover doc" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame symbol" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics float" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Send diagnostics to quickfix" })
			vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Send diagnostics to loclist" })
		end,
	},
}
