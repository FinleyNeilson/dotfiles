return {
	"zbirenbaum/copilot-cmp",
	event = { "InsertEnter", "LspAttach" },
	fix_pairs = true,
	config = function()
		require("copilot_cmp").setup()
	end,
	dependencies = {
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
				filetypes = {
					norg = false,
					markdown = false,
					tex = false,
				},
			})
		end,
	},
}
