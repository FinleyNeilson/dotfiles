return {
	{
		"tpope/vim-obsession",
		lazy = false,
		config = function()
			-- Auto-track a session when nvim opens bare (no file args) in a directory,
			-- writing ./Session.vim so tmux-resurrect's nvim "session" strategy can find
			-- it and restore the full window layout instead of just reopening files.
			vim.api.nvim_create_autocmd("VimEnter", {
				callback = function()
					if vim.fn.argc() == 0 and vim.v.this_session == "" then
						vim.cmd("Obsession ./Session.vim")
					end
				end,
			})

			vim.keymap.set("n", "<leader>oS", function()
				if vim.v.this_session ~= "" then
					vim.cmd("Obsession!")
				else
					vim.cmd("Obsession ./Session.vim")
				end
			end, { desc = "Toggle [o]bsession [S]ession recording" })
		end,
	},
}
