-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
-- Replaced by tiny-glimmer.nvim's yank animation.
-- local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
-- vim.api.nvim_create_autocmd("TextYankPost", {
-- 	callback = function()
-- 		vim.highlight.on_yank()
-- 	end,
-- 	group = highlight_group,
-- 	pattern = "*",
-- })

-- [[ Auto-resize splits on window resize ]]
-- local resize_group = vim.api.nvim_create_augroup("AutoResize", { clear = true })
-- vim.api.nvim_create_autocmd("VimResized", {
-- 	group = resize_group,
-- 	pattern = "*",
-- 	callback = function()
-- 		vim.cmd("wincmd =")
-- 	end,
-- })

-- Disable quickscope in oil buffers
vim.api.nvim_create_autocmd("FileType", {
	pattern = "oil",
	callback = function()
		vim.b.qs_local_disable = 1
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	callback = function()
		vim.b.qs_local_disable = 1
	end,
})

-- [[ Refresh gitsigns for repos on the Windows filesystem ]]
-- gitsigns' .git watcher misses changes under /mnt/c in WSL, so the gutter goes
-- stale after `jj new` and friends. Elsewhere the watcher works, so skip it.
vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter" }, {
	group = vim.api.nvim_create_augroup("GitsignsWslRefresh", { clear = true }),
	callback = function(args)
		if vim.api.nvim_buf_get_name(args.buf):match("^/mnt/%a/") then
			pcall(vim.cmd, "Gitsigns refresh")
		end
	end,
})
