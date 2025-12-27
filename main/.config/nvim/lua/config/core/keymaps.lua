-- set leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Send to the void
vim.keymap.set({ "v" }, "<leader>d", [["_d]], { desc = "Delete to the void" })
vim.keymap.set("n", "x", '"_x')

-- Paste last yank
vim.keymap.set({ "v", "n" }, "<leader>p", '"0p', { desc = "Paste last yank" })
vim.keymap.set({ "v", "n" }, "<leader>P", '"0P', { desc = "Paste last yank" })

-- System clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "copy until end of line to system clipboard" })

-- Quit the current file
vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Quit the current buffer" })
vim.keymap.set("n", "<leader>x", ":bw!<CR>", { desc = "Wipe the buffer" })
vim.keymap.set(
	"n",
	"<A-q>",
	":q!<CR>",
	{ noremap = true, silent = true, desc = "Force quit current buffer without saving" }
)

-- Save the current file
vim.keymap.set("n", "<C-f>", ":w<CR>", { noremap = true, silent = true, desc = "Save the current file" })

-- Buffers and file navigation
vim.keymap.set("n", "<C-h>", "<C-^>", { noremap = true })
vim.keymap.set("n", "<C-s>", ":bprev<CR>", { noremap = true, silent = true, desc = "Buffer previous" })
vim.keymap.set("n", "<C-g>", ":bnext<CR>", { noremap = true, silent = true, desc = "Buffer next" })
vim.api.nvim_set_keymap(
	"n",
	"<C-t>",
	":%bd|e#|bd#<CR>",
	{ noremap = true, silent = true, desc = "Delete all buffers except current file" }
)

-- Center the screen
vim.api.nvim_set_keymap("n", "<C-l>", "zz", { noremap = true, silent = true, desc = "Centre" })

-- Better word replacement - pre-fills current word
vim.keymap.set(
	"n",
	"<leader>sr",
	[[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
	{ desc = "[s]earch and [R]eplace" }
)

local function smart_qf_nav(cmd)
	return function()
		local is_loclist = false

		for _, win in ipairs(vim.fn.getwininfo()) do
			if win.loclist == 1 then
				is_loclist = true
				break
			end
		end

		local final_cmd = is_loclist and cmd:gsub("^c", "l") or cmd

		local ok = pcall(function()
			vim.cmd(final_cmd)
		end)
	end
end

vim.keymap.set("n", "<leader>j", smart_qf_nav("cnext"), {
	noremap = true,
	silent = true,
	desc = "Go to the next item in loclist or quickfix list",
})

vim.keymap.set("n", "<leader>k", smart_qf_nav("cprev"), {
	noremap = true,
	silent = true,
	desc = "Go to the previous item in loclist or quickfix list",
})

vim.api.nvim_create_user_command("Lgrep", function(opts)
	vim.cmd("lvimgrep /" .. opts.args .. "/ %")
	vim.cmd("lopen")
end, { nargs = 1 })

vim.keymap.set("n", "<leader>tc", function()
	vim.wo.colorcolumn = vim.wo.colorcolumn ~= "" and "" or "81"
end, { desc = "Toggle colorcolumn at 81" })

vim.keymap.set("n", "<leader>ti", function()
	vim.wo.signcolumn = vim.wo.signcolumn == "yes" and "no" or "yes"
end, { desc = "Toggle signcolumn" })

vim.keymap.set("n", "<leader>tl", function()
	vim.o.laststatus = vim.o.laststatus == 0 and 2 or 0
end, { desc = "Toggle lualine" })

vim.keymap.set("n", "<leader>T", function()
	vim.cmd("botright split term://$SHELL")
end, { desc = "Open terminal split" })
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
