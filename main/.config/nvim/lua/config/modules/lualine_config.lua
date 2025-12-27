local M = {}

M.config = function()
	require("lualine").setup({
		options = {
			icons_enabled = true,
			component_separators = "",
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
					function()
						return os.date("%I:%M")
					end,
					separator = { left = "",right = "" },
				},
			},
		},
	})
end

return M
