return {
	-- My main color scheme
	{
		"rose-pine/neovim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd.colorscheme("rose-pine")
		end,
	},
	-- Other color schemes
	{ "shaunsingh/nord.nvim", lazy = true }, -- :colorscheme nord
	{ "catppuccin/nvim", lazy = true }, -- :colorscheme catppuccin

	-- No config plugins
	{ "ThePrimeagen/vim-be-good", lazy = true }, -- run :VimBeGood when in an empty file
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	}, -- Adds the vertical lines for code blocks
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
	}, -- adds the info line at the bottom
	{ "folke/neodev.nvim", opts = {} }, -- TODO not sure what it does
	{ "kylechui/nvim-surround", opts = {} }, -- The amazing ys command also S for highlighted text
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	}, -- Highlights TODO comments
	{
		"mbbill/undotree",
		vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "toggle undo tree" }),
	},
	{ "folke/which-key.nvim", opts = {} }, -- Useful plugin to show you pending keybinds.
	{ "m4xshen/autoclose.nvim", opts = {} },

	-- Minimal config plugins
	{
		"norcalli/nvim-colorizer.lua", -- does this -> #00FF00
		config = function()
			require("colorizer").setup()
		end,
	},

	{
		"unblevable/quick-scope", -- Makes f command easier to use
		config = function()
			-- Define your highlight settings
			vim.cmd("highlight QuickScopePrimary guifg='#3e8fb0' gui=underline ctermfg=155 cterm=underline")
			vim.cmd("highlight QuickScopeSecondary guifg='#c4a7e7' gui=underline ctermfg=81 cterm=underline")
			-- Toggle quick scope
			vim.keymap.set("n", "<leader>ts", "<cmd>:QuickScopeToggle<cr>", { desc = "toggle quick scope" })
		end,
	},
}
