local M = {}

-- { left = "▓▒░", right = "░▒▓" },
-- { left = "", right = "░▒▓" },
-- { left = "", right = "" },
-- { left = "", right = "" },

M.config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			component_separators = { left = "", right = "" },
			-- section_separators = { left = "▓▒░", right = "░▒▓" },
			-- section_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					"filename",
					separator = { left = "", right = "" },
					file_status = true,
					newfile_status = true,
					path = 0,
					symbols = {
						modified = "●",
						readonly = "◎",
						unnamed = "∅",
						newfile = "+",
					},

					color = {},
				},
			},
			lualine_b = { "diagnostics" },
			lualine_c = {},
			lualine_x = {},
			lualine_y = {
					{ "progress", separator = " ", padding = { left = 1, right = 0 } },
					{ "location", padding = { left = 0, right = 1 } },
			},
			lualine_z = {
				{
                    "filetype",
                    icon_only = true,
					separator = { left = "", right = "" },
				},
			},
		},
		inactive_sections = {
			lualine_c = {
				{
					"filename",
					symbols = {
						modified = "●",
						readonly = "◎",
						unnamed = "∅",
						newfile = "+",
					},
				},
			},
			lualine_x = { "location" },
		},
	})
end

return M
