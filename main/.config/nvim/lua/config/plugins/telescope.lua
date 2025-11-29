return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x", -- fuzzy finder over lists
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin") -- there are way more builtins
			local actions = require("telescope.actions")
			require("telescope").setup({
				vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles}" }),
				vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "[s]earch [s]tructure}" }),
				vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[s]earch [g]rep}" }),
				vim.keymap.set("n", "<leader>sG", builtin.current_buffer_fuzzy_find, { desc = "[s]earch [G]rep in the curreent buffer}" }),
				vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[s]earch [b]uffers}" }),
				vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp}" }),
				vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics}" }),
				vim.keymap.set("n", "<leader>spp", builtin.planets, { desc = "[p]ee [p]ee" }),
				defaults = {
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-x>"] = actions.delete_buffer,
						},
					},
				},
			})
		end,
	},
}
