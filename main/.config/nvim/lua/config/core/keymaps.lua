-- set leader key to space
vim.g.mapleader = " "

-- move all of selected text together
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Keep yourself centered when jumping around
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Send to the void
vim.keymap.set({ "v" }, "<leader>d", [["_d]], { desc = "Delete to the void" })
vim.keymap.set({ "v", "n" }, "<leader>p", '"0p', { desc = "Paste last yank" })
vim.keymap.set("n", "x", '"_x')

-- System clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste from system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "paste above from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "copy until end of line to system clipboard" })

-- Insert a blank line good for not continuing a comment
vim.keymap.set(
	"n",
	"]<Space>",
	':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[1"<CR>',
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"[<Space>",
	':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>',
	{ noremap = true, silent = true }
)

vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Quit the current buffer" })
vim.keymap.set(
	"n",
	"<A-q>",
	":q!<CR>",
	{ noremap = true, silent = true, desc = "Force quit current buffer without saving" }
)

-- Save the current file
vim.keymap.set("n", "<C-l>", ":w<CR>", { noremap = true, silent = true, desc = "Save the current file" })

-- Navigate through quickfix list
vim.keymap.set(
	"n",
	"<C-j>",
	":cnext<CR>",
	{ noremap = true, silent = true, desc = "Go to the next item in the quickfix list" }
)
vim.keymap.set(
	"n",
	"<C-k>",
	":cprev<CR>",
	{ noremap = true, silent = true, desc = "Go to the previous item in the quickfix list" }
)
