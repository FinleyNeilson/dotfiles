return {
	{ "ThePrimeagen/vim-be-good", lazy = true },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("config.modules.lualine_config").config()
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},
	{ "numToStr/Comment.nvim", opts = {} },
	{
		"stevearc/oil.nvim",
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		lazy = false,

		config = function()
			require("oil").setup({
				keymaps = {
					["gR"] = "actions.refresh",
					["<C-l>"] = false,
				},
			})

			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},
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
			vim.g.qs_enable = 1
			vim.keymap.set("n", "<leader>ts", "<cmd>:QuickScopeToggle<cr>", { desc = "toggle quick scope" })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equivalent to setup({}) function
	},
}
