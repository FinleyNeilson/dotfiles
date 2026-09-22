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

-- Live `hunk diff` args, plus the review notes Claude leaves in
-- .git/hunk-notes.json when that file exists (same as tmux prefix + g/G)
local function diff(args)
	local out = vim.fn.systemlist({ "git", "rev-parse", "--git-path", "hunk-notes.json" })
	local notes = vim.v.shell_error == 0 and out[1]
	if notes and vim.uv.fs_stat(notes) then
		args = vim.list_extend({ "--agent-context", notes }, args)
	end
	return vim.list_extend({ "diff", "--watch" }, args)
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

-- Everything on this branch since the default branch. Hunk parses targets as
-- jj revsets in jj repos, so git's `a...b` syntax fails there.
local function branch_range()
	vim.fn.system({ "jj", "root" })
	if vim.v.shell_error == 0 then
		return "trunk()..@"
	end
	local out = vim.fn.systemlist({ "git", "rev-parse", "--abbrev-ref", "origin/HEAD" })
	local base = (vim.v.shell_error == 0 and out[1]) or "main"
	return base .. "...HEAD"
end

function M.setup()
	vim.keymap.set("n", "<leader>gd", function()
		local sha = commit_under_cursor()
		open(sha and { "show", sha } or diff({}))
	end, { desc = "Hunk: commit under cursor, or working tree" })

	vim.keymap.set("n", "<leader>gD", function()
		open(diff({ branch_range() }))
	end, { desc = "Hunk: whole branch vs default branch" })
end

return M
