return {
	--autoclose auto bair brackets
	"unblevable/quick-scope",
	config = function()
		-- Define your highlight settings
		vim.cmd("highlight QuickScopePrimary guifg='#3e8fb0' gui=underline ctermfg=155 cterm=underline")
		vim.cmd("highlight QuickScopeSecondary guifg='#c4a7e7' gui=underline ctermfg=81 cterm=underline")

		vim.keymap.set("n", "<leader>tqs", "<cmd>:QuickScopeToggle<cr>", { desc = "toggle quick scope" })
	end,
}
