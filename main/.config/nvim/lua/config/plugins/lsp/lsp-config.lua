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
				ensure_installed = { "lua_ls", "pyright", "clangd", "cmake" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Access lspconfig functions
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua language server setup
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			-- Python language server setup
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})

			-- C++ language server setup (clangd)
			lspconfig.clangd.setup({
				capabilities = capabilities,
				cmd = {
					"clangd",
					"--compile-commands-dir=build",
					"--fallback-style={BasedOnStyle: Google}",
				},
			})

			-- CMake language server setup
			lspconfig.cmake.setup({
				capabilities = capabilities,
			})

			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
				},
				signs = true,
				underline = true,
				update_in_insert = false,
				float = { border = "rounded" },
			})

			-- Key mappings for LSP functionality
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "[l]sp hover documentation" })
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[Go]to [D]efinition" })
			vim.keymap.set("n", "<leader>la", vim.lsp.buf.code_action, { desc = "[l]sp [A]ctions" })
			vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementations" })
			vim.keymap.set("n", "<leader>lR", vim.lsp.buf.rename, { desc = "[L]sp [R]ename" })

			-- Diagnostic key mappings
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic floating window" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open quickfix with diagnostics" })
			vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Open quickfix with diagnostics" })
		end,
	},
}
