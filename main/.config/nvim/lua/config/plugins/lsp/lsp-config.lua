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
					"--fallback-style={BasedOnStyle: Google, IndentWidth: 4}",
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
			vim.keymap.set("n", "<leader>ch", vim.lsp.buf.hover, { desc = "[C]ode [H]over Documentation" })
			vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, { desc = "[C]ode Goto [D]efinition" })
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
			vim.keymap.set(
				"n",
				"<leader>cr",
				require("telescope.builtin").lsp_references,
				{ desc = "[C]ode Goto [R]eferences" }
			)
			vim.keymap.set(
				"n",
				"<leader>ci",
				require("telescope.builtin").lsp_implementations,
				{ desc = "[C]ode Goto [I]mplementations" }
			)
			vim.keymap.set("n", "<leader>cR", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
			vim.keymap.set("n", "<leader>cD", vim.lsp.buf.declaration, { desc = "[C]ode Goto [D]eclaration" })

			-- Diagnostic key mappings
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostic floating window" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Open quickfix with diagnostics" })
		end,
	},
}
