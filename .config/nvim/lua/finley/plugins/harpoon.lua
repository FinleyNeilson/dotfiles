return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		-- set keymaps
		local keymap = vim.keymap -- for conciseness

		keymap.set(
			"n",
			"<C-e>",
			"<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>",
			{ desc = "Open harpoon toggle_quick_menu" }
		)
		keymap.set("n", "<C-m>", "<cmd>lua require('harpoon.mark').add_file()<cr>", { desc = "Mark file with harpoon" })
		keymap.set("n", "<C-y>", "<cmd>lua require('harpoon.ui').nav_file(1)<cr>", { desc = "Mark file with harpoon" })
		keymap.set("n", "<C-t>", "<cmd>lua require('harpoon.ui').nav_file(2)<cr>", { desc = "Mark file with harpoon" })
		keymap.set("n", "<C-h>", "<cmd>lua require('harpoon.ui').nav_file(3)<cr>", { desc = "Mark file with harpoon" })
		keymap.set("n", "<C-g>", "<cmd>lua require('harpoon.ui').nav_file(4)<cr>", { desc = "Mark file with harpoon" })
		keymap.set(
			"n",
			"<leader>hn",
			"<cmd>lua require('harpoon.ui').nav_next()<cr>",
			{ desc = "Go to next harpoon mark" }
		)
		keymap.set(
			"n",
			"<leader>hp",
			"<cmd>lua require('harpoon.ui').nav_prev()<cr>",
			{ desc = "Go to previous harpoon mark" }
		)
	end,
}
