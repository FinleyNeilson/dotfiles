local opt = vim.opt

-- QOL
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.wrap = false

-- Save undo history
opt.undofile = true
opt.undolevels = 10000
opt.undoreload = 10000

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true
opt.scrolloff = 6

-- appearance
opt.guicursor = ""
vim.opt.fillchars = { eob = " " }
opt.termguicolors = true
opt.signcolumn = "yes"
opt.colorcolumn = "81"
opt.conceallevel = 0 -- No concealing

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Persistent undo configuration
local undodir = vim.fn.stdpath("config") .. "/undo"
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.undofile = true
vim.opt.undodir = undodir
