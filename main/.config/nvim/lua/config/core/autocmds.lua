-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})

-- [[ Auto-resize splits on window resize ]]
local resize_group = vim.api.nvim_create_augroup("AutoResize", { clear = true })
vim.api.nvim_create_autocmd("VimResized", {
	group = resize_group,
	pattern = "*",
	callback = function()
		vim.cmd("wincmd =")
	end,
})

-- Disable quickscope in oil buffers
vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.b.qs_local_disable = 1
	end,
})
