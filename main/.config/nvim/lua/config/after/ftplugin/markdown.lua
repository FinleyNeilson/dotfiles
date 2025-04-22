vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		if vim.bo.buftype ~= "" then
			return
		end

        vim.opt_local.colorcolumn = ""
        vim.g.qs_enable = 0

		vim.cmd("colorscheme gruvbox-material")
		require("lualine").setup({})

		-- Keybindings for Obsidian
		-- Custom keybinging functions

		local function insert_code_block()
			-- Prompt the user for the language
			vim.ui.input({ prompt = "Enter language: " }, function(language)
				if language then
					-- Get current cursor position
					local cursor_pos = vim.api.nvim_win_get_cursor(0)
					local row = cursor_pos[1]

					-- Insert the code block
					vim.api.nvim_buf_set_lines(0, row, row, false, { "```" .. language }) -- Insert language line
					vim.api.nvim_buf_set_lines(0, row + 1, row + 1, false, { "" }) -- Empty line for content
					vim.api.nvim_buf_set_lines(0, row + 2, row + 2, false, { "```" }) -- Insert closing ```

					-- Move the cursor inside the code block
					vim.api.nvim_win_set_cursor(0, { row + 2, 0 }) -- Move to the empty line inside the code block
				end
			end)
		end

		vim.keymap.set("n", "<leader>tm", function()
			require("null-ls").toggle({ name = "markdownlint" })
		end, { desc = "Toggle markdownlint", buffer = true })

		vim.keymap.set("n", "<leader>tr", function()
			vim.cmd("RenderMarkdown toggle")
			vim.defer_fn(function()
				vim.opt_local.conceallevel = 0
			end, 50)
		end, { desc = "Toggle Markdown Rendering", buffer = true })

		vim.keymap.set("n", "Q", "gqapi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("x", "Q", "gqi<ESC>", { silent = true, noremap = true, buffer = true })
		vim.keymap.set("n", "<leader>co", function()
			insert_code_block()
		end, { desc = "Insert code block", buffer = true })
		-- vim.keymap.set("n", "<leader>o", "<cmd>ObsidianOpen<CR>", { desc = "Open on App", buffer = true })
		vim.keymap.set("n", "<leader>sg", "<cmd>ObsidianSearch<CR>", { desc = "Grep", buffer = true })
		vim.keymap.set("n", "<leader>sf", "<cmd>ObsidianQuickSwitch<CR>", { desc = "Find Files", buffer = true })
		-- vim.keymap.set("n", "<leader>n", "<cmd>ObsidianNew<CR>", { desc = "New Note", buffer = true })
		vim.keymap.set("n", "<leader>cn", "<cmd>ObsidianTOC<CR>", { desc = "Table of Contents", buffer = true })
		vim.keymap.set("n", "<leader>rn", "<cmd>ObsidianRename<CR>", { desc = "Rename", buffer = true })
		vim.keymap.set("n", "<leader>L", "<cmd>ObsidianLinks<CR>", { desc = "Links", buffer = true })
		vim.keymap.set("n", "<leader>b", "<cmd>ObsidianBacklinks<CR>", { desc = "Backlinks", buffer = true })
		vim.keymap.set("n", "<leader>ta", "<cmd>ObsidianTags<CR>", { desc = "Tags", buffer = true })
		vim.keymap.set("n", "<leader>te", "<cmd>ObsidianTemplate<CR>", { desc = "Template", buffer = true })
		vim.keymap.set("v", "<leader>l", "<cmd>ObsidianLinkNew<CR>", { desc = "New Link", buffer = true })
		vim.keymap.set("n", "<leader>da", "<cmd>ObsidianDailies<CR>", { desc = "Daily Notes", buffer = true })
		vim.keymap.set("n", "<leader>wo", "<cmd>ObsidianWorkspace<CR>", { desc = "Workspace", buffer = true })
	end,
})
