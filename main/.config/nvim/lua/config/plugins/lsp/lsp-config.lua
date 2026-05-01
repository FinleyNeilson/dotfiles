return {
	-- install mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	-- automatically installs formatters and linters
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"clang-format",
					"stylua",
					"black",
					"goimports",
				},
			})
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
					"texlab",
				},
			})
		end,
	},
	-- The actual configuration
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Diagnostics and UI setup
			vim.o.winborder = "rounded"
			vim.diagnostic.config({
				virtual_text = { prefix = "●" },
				signs = true,
				underline = true,
				update_in_insert = false,
				float = { border = "rounded" },
			})

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP hover doc" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
			vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame symbol" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ction" })
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostics float" })
			vim.keymap.set("n", "<leader>q", vim.diagnostic.setqflist, { desc = "Send diagnostics to quickfix" })
			vim.keymap.set("n", "<leader>Q", vim.diagnostic.setloclist, { desc = "Send diagnostics to loclist" })

			-- Configure servers with custom settings
			vim.lsp.config("clangd", {
				cmd = { "clangd", "--offset-encoding=utf-16" },
				capabilities = {
					offsetEncoding = { "utf-16" },
				},
			})

			vim.lsp.config("ts_ls", {
				filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
				init_options = {
					preferences = {
						disableSuggestions = true,
					},
				},
				settings = {
					javascript = {
						diagnostics = {
							ignoredCodes = { 6133, 6192 },
						},
					},
					typescript = {
						diagnostics = {
							ignoredCodes = { 6133, 6192 },
						},
					},
				},
			})

			vim.lsp.config("gopls", {
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

			-- Enable all servers
			vim.lsp.enable("clangd")
			vim.lsp.enable("ts_ls")
			vim.lsp.enable("gopls")
			vim.lsp.enable("lua_ls")
			vim.lsp.enable("pyright")
			vim.lsp.enable("cmake")
			vim.lsp.enable("eslint")
			vim.lsp.enable("html")
			vim.lsp.enable("cssls")
			vim.lsp.enable("jsonls")
			vim.lsp.enable("texlab")
		end,
	},
}
