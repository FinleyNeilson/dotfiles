return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard") -- Changed to dashboard theme

    dashboard.section.header.val = require("config.ascii.neovim")

		-- Add vertical padding
		dashboard.section.header.opts = {
			position = "center",
			hl = "Type",
		}

		-- Configure buttons if you want them
		dashboard.section.buttons.val = {
			dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  Recent files", ":Telescope oldfiles cwd_only=true<CR>"),
			dashboard.button("q", "  Quit", ":q<CR>"),
		}

		-- Setup layout with proper spacing
		dashboard.config.layout = {
			{ type = "padding", val = 2 },
			dashboard.section.header,
			{ type = "padding", val = 2 },
			dashboard.section.buttons,
		}

		alpha.setup(dashboard.config)
		vim.keymap.set("n", "<leader>os", "<cmd>:Alpha<cr>", { desc = "Open startpage" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "alpha",
			callback = function()
				vim.keymap.set(
					"n",
					"<leader>oj",
					":Neorg journal today<CR>",
					{ buffer = true, desc = "[o]pen today's neorg [j]ournal" }
				)
				vim.keymap.set(
					"n",
					"<leader>oc",
					":Neorg journal custom<CR>",
					{ buffer = true, desc = "[o]pen [c]alendar to pick a journal date" }
				)
				vim.keymap.set(
					"n",
					"<leader>ot",
					":Neorg journal toc update<CR>",
					{ buffer = true, desc = "[o]pen journal [t]able of contents" }
				)
				vim.keymap.set(
					"n",
					"<leader>oa",
					":Neorg journal agenda week<CR>",
					{ buffer = true, desc = "[o]pen journal [a]genda (week)" }
				)
				vim.keymap.set(
					"n",
					"<leader>oi",
					":Neorg index<CR>",
					{ buffer = true, desc = "[o]pen Neorg [i]ndex" }
				)
			end,
		})
	end,
}
