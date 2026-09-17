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
}
