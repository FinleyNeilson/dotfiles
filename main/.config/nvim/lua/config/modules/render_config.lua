local M = {}

M.config = function()
	require("render-markdown").setup({
		heading = {
			setext = false,
			sign = false,
			icons = {
				"● ",
				"○ ",
				"◆ ",
				"◇ ",
				"‣ ",
			},
		},
		latex = {
			enabled = false,
		},
	})
end

return M
