return {
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
		ft = "markdown",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		opts = {
			workspaces = {
				{
					name = "programming",
					path = "/mnt/c/Users/finle/notes/programming",
				},
				{
					name = "philosophy",
					path = "/mnt/c/Users/finle/notes/philosophy",
				},
				{
					name = "personal",
					path = "/mnt/c/Users/finle/notes/personal",
				},
			},
			templates = {
				folder = "Templates",
				date_format = "%Y-%m-%d-%a",
				time_format = "%H:%M",
				substitutions = {
					alias = function()
						local filename = vim.fn.expand("%:t:r")
						local formatted = filename:gsub("(%l)(%u)", "%1 %2"):gsub("(%u)(%u%l)", "%1 %2"):gsub("_", " ")
						return formatted
					end,
					tags = function()
						local tag_input = vim.fn.input("Enter tags (comma-separated): ")

						local tags = table.concat(
							vim.tbl_map(function(tag)
								return "  - " .. tag:gsub("^%s*(.-)%s*$", "%1"):gsub("%s+", "-"):lower()
							end, vim.split(tag_input, ",", { trimempty = true })),
							"\n"
						)
						return tags
					end,
				},
			},
			daily_notes = {
				folder = "DailyNotes/",
			},
			completion = {
				nvim_cmp = true,
				min_chars = 0,
			},
			ui = { enable = false },
			disable_frontmatter = true,
			new_notes_location = "notes_subdir",
		},
	},
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		opts = {
			heading = {
				icons = {
					"● ",
					"○ ",
					"◆ ",
					"◇ ",
					"‣ ",
				},
			},
		},
	},
}
