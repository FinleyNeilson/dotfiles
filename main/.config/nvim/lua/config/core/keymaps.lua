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
vim.keymap.set({ "v" }, "<leader>w", [["_dkp]], { desc = "[w]ack it in, sending what its replacing to the void" })
vim.keymap.set("n", "x", '"_x')

-- System clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { desc = "paste from system clipboard" })
-- vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { desc = "paste above from system clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { desc = "copy to system clipboard" })
vim.keymap.set("n", "<leader>Y", '"+Y', { desc = "copy until end of line to system clipboard" })

-- Better splits
vim.keymap.set("n", "<C-W>,", ":vertical resize -5<CR>")
vim.keymap.set("n", "<C-W>.", ":vertical resize +5<CR>")

-- Insert a black line good for not continuing a comment
vim.keymap.set("n", "]<Space>", ':<C-u>put =repeat(nr2char(10),v:count)<Bar>execute "\'[1"<CR>')
vim.keymap.set(
	"n",
	"[<Space>",
	':<C-u>put!=repeat(nr2char(10),v:count)<Bar>execute "\']+1"<CR>',
	{ noremap = true, silent = true }
)

vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set('n', '<C-q>', ':q<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Space>', ':w<CR>', { noremap = true, silent = true })

vim.keymap.set('n','<leader>;', ':cnext<CR>')
vim.keymap.set('n','<leader>,', ':cprev<CR>')

