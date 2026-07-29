return {
	"nvim-java/nvim-java",
	ft = "java",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"neovim/nvim-lspconfig",
		"mfussenegger/nvim-dap",
		"williamboman/mason.nvim",
		{
			"JavaHello/spring-boot.nvim",
			commit = "218c0c26c14d99feca778e4d13f5ec3e8b1b60f0",
		},
	},
	config = function()
		require("java").setup()

		-- Fallback for standalone (no pom.xml/build.gradle) projects, e.g. simple
		-- course assignments: jdtls can't otherwise infer that "src" holds sources
		-- or find JARs referenced only via IntelliJ's .idea project files.
		vim.lsp.config("jdtls", {
			settings = {
				java = {
					project = {
						sourcePaths = { "src" },
						referencedLibraries = {
							"lib/**/*.jar",
							"libs/**/*.jar",
							"resources/**/*.jar",
						},
					},
				},
			},
		})

		vim.lsp.enable("jdtls")

		-- When Neovim is opened directly on a .java file (`nvim Foo.java`), this
		-- config function runs before VimEnter, so vim.lsp.enable's own retroactive
		-- FileType redispatch (which requires vim_did_enter) never fires and jdtls
		-- never autostarts for that first buffer. Redispatch it ourselves once
		-- VimEnter happens.
		if vim.v.vim_did_enter == 0 then
			vim.api.nvim_create_autocmd("VimEnter", {
				once = true,
				callback = function()
					vim.cmd.doautoall("nvim.lsp.enable FileType")
				end,
			})
		end
	end,
}
