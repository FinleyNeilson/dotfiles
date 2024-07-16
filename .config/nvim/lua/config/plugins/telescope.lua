return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x", -- fuzzy finder over lists
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin") -- there are way more builtins
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[s]earch [f]iles}" }) -- could put desc in here at some point
			vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[s]earch [g]rep}" })
			vim.keymap.set("n", "<leader>sb", builtin.buffers, { desc = "[s]earch [b]uffers}" })
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[s]earch [h]elp}" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[s]earch [d]iagnostics}" })
			vim.keymap.set("n", "<leader>pp", builtin.planets, { desc = "[p]ee [p]ee" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			-- get access to telescopes navigation functions
			local actions = require("telescope.actions")

			require("telescope").setup({
				-- use ui-select dropdown as our ui
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				-- set keymappings to navigate through items in the telescope io
				mappings = {
					i = {
						-- use <cltr> + n to go to the next option
						["<C-n>"] = actions.cycle_history_next,
						-- use <cltr> + p to go to the previous option
						["<C-p>"] = actions.cycle_history_prev,
						-- use <cltr> + j to go to the next preview
						["<C-j>"] = actions.move_selection_next,
						-- use <cltr> + k to go to the previous preview
						["<C-k>"] = actions.move_selection_previous,
					},
				},
				-- load the ui-select extension
				require("telescope").load_extension("ui-select"),
			})
		end,
	},
}
