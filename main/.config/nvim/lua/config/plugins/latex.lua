return {
	"lervag/vimtex",
	ft = { "tex" },
	init = function()
		local sioyek_path = "/mnt/c/Program Files/sioyek-release-windows/sioyek.exe"

		vim.g.vimtex_view_method = "sioyek"
		vim.g.vimtex_view_sioyek_exe = sioyek_path
		vim.g.vimtex_compiler_method = "latexmk"
		vim.g.vimtex_quickfix_mode = 0

		--  Stop automatic compilation
		vim.g.vimtex_compiler_latexmk = {
			continuous = 0,
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = "tex",
			callback = function()
				vim.keymap.set("n", "<leader>c", "<cmd>VimtexCompile<cr>", { buffer = true, desc = "Compile LaTeX" })
			end,
		})

		vim.api.nvim_create_autocmd("User", {
			pattern = "VimtexEventCompileSuccess",
			callback = function()
                local pdf_path = vim.fn.expand("%:p:r") .. ".pdf"
                local win_path = vim.fn.system("wslpath -w " .. vim.fn.shellescape(pdf_path)):gsub("%s+", "")

				vim.fn.jobstart({
					sioyek_path,
                    win_path,
                    "--reuse-window",
					"--execute-command",
					"reload",
				})
			end,
		})
	end,
}
