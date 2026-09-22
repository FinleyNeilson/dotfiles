local opt = vim.opt

-- Force .tex files to be detected as "tex" (LaTeX) rather than falling back
-- to "plaintex", which vimtex's ft = {"tex"} lazy-load never triggers for.
vim.g.tex_flavor = "latex"

-- Everything nvim runs through 'shell' -- :!, system(), and any plugin that
-- shells out -- is written in POSIX syntax (&&, 2>/dev/null, $(...)), none of
-- which nushell parses. So 'shell' stays bash even when $SHELL is nu. The
-- <leader>T terminal split opens term://$SHELL directly and is unaffected, so
-- interactive terminals inside nvim are still nu.
opt.shell = "/bin/bash"

-- QOL
opt.updatetime = 250
opt.timeoutlen = 300
opt.completeopt = "menu,menuone,noselect"

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
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
opt.colorcolumn = ""
opt.conceallevel = 0 -- No concealing

-- split windows
opt.splitright = true
opt.splitbelow = true

-- Persistent undo configuration
local undodir = vim.fn.stdpath("state") .. "/undo" -- This is actually just the default location
if vim.fn.isdirectory(undodir) == 0 then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.undofile = true
vim.opt.undodir = undodir
vim.opt.undolevels = 1000000
