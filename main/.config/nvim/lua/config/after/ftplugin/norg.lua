vim.api.nvim_create_autocmd("FileType", {
	pattern = "norg",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end

		vim.opt_local.conceallevel = 2
		vim.opt_local.colorcolumn = ""
		vim.g.qs_enable = 0
		vim.bo.tabstop = 2
		vim.bo.softtabstop = 2
		vim.bo.shiftwidth = 2

		vim.opt_local.fillchars = {
			foldopen = "",
			foldclose = "",
			foldsep = " ",
			eob = " ",
		}
		vim.wo.foldcolumn = "1"

		vim.keymap.set("n", "<localleader>o", "o<CR><ESC>O", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "Q", "o<ESC>kO<ESC>jgqipi<ESC>{dd}ddk^", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<leader>q", "gqipi<ESC>^", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<leader>l", "Bi{<Esc>Ea}<Esc>B", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("x", "Q", "gqi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<leader><CR>", "ggVG=", { buffer = true, nowait = true })
		vim.keymap.set("n", "<C-j>", "za", { buffer = true, nowait = true })
		vim.keymap.set("n", "<leader><C-j>", "zA", { buffer = true, nowait = true })
		vim.keymap.set("n", "<C-k>", "zr", { buffer = true, nowait = true })
		vim.keymap.set("i", "<C-l>", "<Plug>(neorg.itero.next-iteration)", { buffer = true })
		vim.keymap.set("n", "<leader>co", "<Plug>(neorg.looking-glass.magnify-code-block)", { buffer = true })
		vim.keymap.set(
			"n",
			"<leader>oj",
			":Neorg journal today<CR>",
			{ buffer = true, desc = "[o]pen today's neorg [j]ournal" }
		)
		vim.keymap.set(
			"n",
			"<leader>or",
			":Neorg journal tomorrow<CR>",
			{ buffer = true, desc = "open [j]ournal tomo[r]row" }
		)
		vim.keymap.set(
			"n",
			"<leader>oy",
			":Neorg journal yesterday<CR>",
			{ buffer = true, desc = "open [j]ournal [y]esterday" }
		)
		vim.keymap.set(
			"n",
			"<leader>oi",
			":Neorg index<CR>",
			{ buffer = true, desc = "[o]pen Neorg [i]ndex" }
		)

		vim.keymap.set("n", "<,", "<Plug>(neorg.promo.demote)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<<", "<Plug>(neorg.promo.demote.nested)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", ">.", "<Plug>(neorg.promo.promote)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set(
			"n",
			">>",
			"<Plug>(neorg.promo.promote.nested)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<C-Space>",
			"<Plug>(neorg.qol.todo-items.todo.task-cycle)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<CR>",
			"<Plug>(neorg.esupports.hop.hop-link)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<M-CR>",
			"<Plug>(neorg.esupports.hop.hop-link.vsplit)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<M-t>",
			"<Plug>(neorg.esupports.hop.hop-link.tab-drop)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>id",
			"<Plug>(neorg.tempus.insert-date)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>li",
			"<Plug>(neorg.pivot.list.invert)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>lt",
			"<Plug>(neorg.pivot.list.toggle)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>ta",
			"<Plug>(neorg.qol.todo-items.todo.task-ambiguous)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>tc",
			"<Plug>(neorg.qol.todo-items.todo.task-cancelled)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>td",
			"<Plug>(neorg.qol.todo-items.todo.task-done)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>th",
			"<Plug>(neorg.qol.todo-items.todo.task-on-hold)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>ti",
			"<Plug>(neorg.qol.todo-items.todo.task-important)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>tp",
			"<Plug>(neorg.qol.todo-items.todo.task-pending)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>tr",
			"<Plug>(neorg.qol.todo-items.todo.task-recurring)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set(
			"n",
			"<localleader>tu",
			"<Plug>(neorg.qol.todo-items.todo.task-undone)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set("i", "<C-d>", "<Plug>(neorg.promo.demote)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("i", "<C-t>", "<Plug>(neorg.promo.promote)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set(
			"i",
			"<M-d>",
			"<Plug>(neorg.tempus.insert-date.insert-mode)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set("x", "<", "<Plug>(neorg.promo.demote.range)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("x", ">", "<Plug>(neorg.promo.promote.range)", { silent = true, noremap = true, buffer = true })
		vim.keymap.set(
			"n",
			"<localleader>nn",
			"<Plug>(neorg.dirman.new-note)",
			{ silent = true, noremap = true, buffer = true }
		)
		vim.keymap.set("n", "gO", "<cmd>Neorg toc<CR>", { silent = true, noremap = true, buffer = true })
	end,
})
