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

-- [[ Reattach gitsigns when HEAD moves in repos on the Windows filesystem ]]
-- gitsigns only learns that HEAD moved from its .git watcher, which misses
-- changes under /mnt/c in WSL, so the gutter goes stale after `jj new` and
-- friends. `:Gitsigns refresh` keeps the stale HEAD; reattaching rebuilds it.
-- Elsewhere the watcher works, so skip it.
local function read_file(path)
	local f = io.open(path, "r")
	if not f then
		return ""
	end
	local s = f:read("*a")
	f:close()
	return s
end

local seen_heads = {}
vim.api.nvim_create_autocmd({ "BufReadPost", "BufEnter", "FocusGained" }, {
	group = vim.api.nvim_create_augroup("GitsignsWslRefresh", { clear = true }),
	callback = function(args)
		if not vim.api.nvim_buf_get_name(args.buf):match("^/mnt/%a/") then
			return
		end
		local root = vim.fs.root(args.buf, ".git")
		if not root then
			return
		end
		local gitdir = root .. "/.git"
		local head = read_file(gitdir .. "/HEAD")
		local ref = head:match("^ref: (%S+)")
		if ref then
			head = head .. read_file(gitdir .. "/" .. ref)
		end

		local prev = seen_heads[gitdir]
		seen_heads[gitdir] = head
		if args.event == "BufReadPost" or not prev or prev == head then
			return
		end

		-- Buffers in a repo share one gitsigns repo object, so detach them all
		local gs = require("gitsigns")
		gs.detach_all()
		for _, buf in ipairs(vim.api.nvim_list_bufs()) do
			if vim.api.nvim_buf_is_loaded(buf) then
				gs.attach(buf)
			end
		end
	end,
})
