-- Monochrome: override the plugin's gold shooting-star/trail groups.
local function set_mono_hl()
	vim.api.nvim_set_hl(0, "StarfallShootingHead", { fg = "#ffffff", bold = true })
	vim.api.nvim_set_hl(0, "StarfallShootingTrail1", { fg = "#ffffff", bold = true })
	vim.api.nvim_set_hl(0, "StarfallShootingTrail2", { fg = "#9a9a9a" })
	vim.api.nvim_set_hl(0, "StarfallShootingTrail3", { fg = "#4d4d4d" })
end

-- starfall skips every buffer with a non-empty buftype, and alpha is "nofile".
-- While a tick runs, report alpha's buftype as "" so the startpage is decorated.
local function allow_alpha(engine)
	local tick = engine.tick
	engine.tick = function()
		local get = vim.api.nvim_get_option_value
		vim.api.nvim_get_option_value = function(name, o)
			if name == "buftype" and o and o.buf and get("filetype", { buf = o.buf }) == "alpha" then
				return ""
			end
			return get(name, o)
		end
		local ok, err = pcall(tick)
		vim.api.nvim_get_option_value = get
		if not ok then
			error(err)
		end
	end
end

return {
	{
		"RedEye-Developers/starfall.nvim",
		cmd = { "StarfallStart", "StarfallStop", "StarfallToggle" },
		opts = {
			density = 6,
			falling_stars = 1,
			colors = { "#eaeaea", "#bdbdbd", "#8a8a8a" },
			falling_color = "#ffffff",
			shooting_color = "#ffffff",
		},
		config = function(_, opts)
			local starfall = require("starfall")
			starfall.setup(opts)
			starfall.config.ignore_filetypes = vim.tbl_filter(function(ft)
				return ft ~= "alpha"
			end, starfall.config.ignore_filetypes)
			allow_alpha(require("starfall.engine"))
			set_mono_hl()
			vim.api.nvim_create_autocmd("ColorScheme", { callback = set_mono_hl })
		end,
		keys = {
			{ "<leader>tS", "<cmd>StarfallToggle<CR>", desc = "toggle starfall" },
		},
	},
}
