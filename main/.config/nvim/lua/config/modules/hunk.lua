-- Open hunk (https://hunk.dev) diff reviews in a full-screen tmux popup
local M = {}

local hunk = vim.fn.expand("~/.hunk/bin/hunk")

local function open(args)
	local cmd = vim.list_extend({ hunk }, args)
	if vim.env.TMUX then
		vim.fn.system(vim.list_extend({
			"tmux", "display-popup", "-B", "-E", "-w", "100%", "-h", "100%",
			"-d", vim.fn.getcwd(),
			table.concat(vim.tbl_map(vim.fn.shellescape, cmd), " "),
		}, {}))
	else
		vim.cmd("tabnew")
		vim.fn.jobstart(cmd, { term = true, on_exit = function() vim.cmd("bwipeout!") end })
		vim.cmd("startinsert")
	end
end

-- The commit hash on the current line, if in a Neogit buffer and it names a real commit
local function commit_under_cursor()
	if not vim.bo.filetype:match("^Neogit") then
		return nil
	end
	for word in vim.api.nvim_get_current_line():gmatch("%x+") do
		if #word >= 7 and #word <= 40 then
			vim.fn.system({ "git", "rev-parse", "--verify", "--quiet", word .. "^{commit}" })
			if vim.v.shell_error == 0 then
				return word
			end
		end
	end
end

-- The repo's default branch (origin/HEAD), falling back to main
local function base_branch()
	local out = vim.fn.systemlist({ "git", "rev-parse", "--abbrev-ref", "origin/HEAD" })
	if vim.v.shell_error == 0 and out[1] then
		return out[1]
	end
	return "main"
end

function M.setup()
	vim.keymap.set("n", "<leader>gd", function()
		local sha = commit_under_cursor()
		open(sha and { "show", sha } or { "diff" })
	end, { desc = "Hunk: commit under cursor, or working tree" })

	vim.keymap.set("n", "<leader>gD", function()
		open({ "diff", "--watch", base_branch() .. "...HEAD" })
	end, { desc = "Hunk: whole branch vs default branch" })
end

return M
