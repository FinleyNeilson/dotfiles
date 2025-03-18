return {
	{ "ThePrimeagen/vim-be-good", lazy = true },
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{ "folke/which-key.nvim", opts = {} },
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	},
	{
		"mbbill/undotree",
		vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "toggle undo tree" }),
	},
	{ "kylechui/nvim-surround", opts = {} },
	{
		"unblevable/quick-scope",
		config = function()
			vim.g.qs_enable = 0
			vim.keymap.set("n", "<leader>ts", "<cmd>:QuickScopeToggle<cr>", { desc = "toggle quick scope" })
		end,
	},
}
