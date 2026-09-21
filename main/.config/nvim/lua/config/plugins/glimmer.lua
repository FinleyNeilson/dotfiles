return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	priority = 10, -- low priority so it catches other plugins' keybindings
	opts = {
		overwrite = {
			yank = {
				default_animation = {
					name = "fade",
					-- The default (Visual) is barely visible on dark themes.
					settings = { from_color = "#4a7a72" },
				},
			},
		},
	},
	config = function(_, opts)
		require("tiny-glimmer").setup(opts)

		-- Colors are resolved once at setup, so a theme switch leaves the old ones
		-- cached. The plugin's own `autoreload` does this too, but prints a message
		-- on every switch, which themery makes noisy.
		vim.api.nvim_create_autocmd("ColorScheme", {
			callback = function()
				require("tiny-glimmer").apply()
			end,
		})
	end,
}
