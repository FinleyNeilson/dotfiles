-- set leader key to space
vim.g.mapleader = " "

-- Keep yourself centered when jumping around

-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Send to the void
vim.keymap.set({ "v" }, "<leader>d", [["_d]], { desc = "Delete to the void" })
vim.keymap.set("n", "x", '"_x')

-- Paste last yank
vim.keymap.set({ "v", "n" }, "<leader>p", '"0p', { desc = "Paste last yank" })

-- System clipboard
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

-- move all of selected text together
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Quit the current file

vim.keymap.set("n", "<C-q>", ":q<CR>", { noremap = true, silent = true, desc = "Quit the current buffer" })
vim.keymap.set(
	"n",
	"<A-q>",
	":q!<CR>",
	{ noremap = true, silent = true, desc = "Force quit current buffer without saving" }
)

-- Save the current file
vim.keymap.set("n", "<C-l>", ":w<CR>", { noremap = true, silent = true, desc = "Save the current file" })

-- Buffers and file navigation

vim.keymap.set('n', '<C-h>', '<C-^>', { noremap = true })
vim.keymap.set("n", "<C-s>", ":bprev<CR>", { noremap = true, silent = true, desc = "Buffer previous" })
vim.keymap.set("n", "<C-g>", ":bnext<CR>", { noremap = true, silent = true, desc = "Buffer next" })
vim.api.nvim_set_keymap("n", "<C-t>", ":%bd|e#|bd#<CR>", { noremap = true, silent = true, desc = "Delete all buffers except current file"})
vim.keymap.set("n", "<C-x>", ":bdelete<CR>", { noremap = true, silent = true, desc = "Delete current buffer" })

-- Center the screen
vim.api.nvim_set_keymap("n", "<C-f>", "zz", { noremap = true, silent = true, desc = "Centre"})

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

    -- if not ok then
    --   vim.notify(
    --     "No more items in the " .. (is_loclist and "location" or "quickfix") .. " list",
    --     vim.log.levels.INFO
    --   )
    -- end
  end
end

vim.keymap.set("n", "<C-j>", smart_qf_nav("cnext"), {
  noremap = true,
  silent = true,
  desc = "Go to the next item in loclist or quickfix list",
})

vim.keymap.set("n", "<C-k>", smart_qf_nav("cprev"), {
  noremap = true,
  silent = true,
  desc = "Go to the previous item in loclist or quickfix list",
})

vim.api.nvim_create_user_command("Lgrep", function(opts)
  vim.cmd("lvimgrep /" .. opts.args .. "/ %")
  vim.cmd("lopen")
end, { nargs = 1 })

vim.keymap.set("n", "<leader>tc", function()
  if vim.wo.colorcolumn ~= "" then
    vim.wo.colorcolumn = ""
  else
    vim.wo.colorcolumn = "81"
  end
end, { desc = "Toggle colorcolumn at 81" })
