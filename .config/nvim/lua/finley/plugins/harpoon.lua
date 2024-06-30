return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<leader>e",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Open harpoon toggle_quick_menu" }
		)
		vim.keymap.set(
			"n",
			"<C-j>",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		vim.keymap.set("n", "<leader>h", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go to mark 1" })
		vim.keymap.set("n", "<leader>j", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go to mark 2" })
		vim.keymap.set("n", "<leader>k", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go to mark 3" })
		vim.keymap.set("n", "<leader>l", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Go to mark 4" })
	end,
}
