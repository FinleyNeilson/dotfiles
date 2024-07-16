return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		vim.keymap.set(
			"n",
			"<C-e>",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Open harpoon toggle_quick_menu" }
		)
		vim.keymap.set(
			"n",
			"<leader>a",
			"<cmd>lua require('harpoon.mark').add_file()<cr>",
			{ desc = "Mark file with harpoon" }
		)
		vim.keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Go to mark 1" })
		vim.keymap.set("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Go to mark 2" })
		vim.keymap.set("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Go to mark 3" })
		vim.keymap.set("n", "<C-a>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Go to mark 4" })
	end,
}
