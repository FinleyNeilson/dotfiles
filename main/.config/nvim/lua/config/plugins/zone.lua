return {
	"tamton-aquib/zone.nvim",
	event = "VeryLazy",
	opts = {
		style = "dvd",
		after = 60, -- Idle timeout
		exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "dashboard", "lazy" },
		-- More options to come later

		treadmill = {
			direction = "left",
			headache = true,
			tick_time = 30, -- Lower, the faster
			-- Opts for Treadmill style
		},
		epilepsy = {
			stage = "aura", -- "aura" or "ictal"
			tick_time = 100,
		},
		dvd = {
			-- text = {"line1", "line2", "line3", "etc"}
			tick_time = 80,
			-- Opts for Dvd style
		},
		-- etc
	},
	config = function(_, opts)
		require("zone").setup(opts)

		-- The dvd style reads the float position as `config.row[false]`, the table
		-- shape older Neovim returned. Newer Neovim returns a plain number, so hand
		-- the style the old shape while its tick runs.
		local helper = require("zone.helper")
		local on_each_tick = helper.on_each_tick
		helper.on_each_tick = function(callback, timeout)
			return on_each_tick(function()
				local get = vim.api.nvim_win_get_config
				vim.api.nvim_win_get_config = function(win)
					local config = get(win)
					if type(config.row) == "number" then
						config.row = { [false] = config.row }
						config.col = { [false] = config.col }
					end
					return config
				end
				local ok, err = pcall(callback)
				vim.api.nvim_win_get_config = get
				if not ok then
					error(err)
				end
			end, timeout)
		end
	end,
}
