return {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
        vim.g.vimtex_view_method = "general"
        vim.g.vimtex_view_general_viewer = "cmd.exe"
        vim.g.vimtex_compiler_method = "latexmk"
        vim.g.vimtex_quickfix_mode = 0

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "tex",
            callback = function()
                local pdf_path = vim.fn.expand("%:p:r") .. ".pdf"
                local win_pdf_path = vim.fn.system("wslpath -w " .. pdf_path):gsub("\n", "")
                vim.g.vimtex_view_general_options = string.format(
                    '/C start /B "" "C:\\Users\\finle\\AppData\\Local\\SumatraPDF\\SumatraPDF.exe" "%s"',
                    win_pdf_path
                )
            end,
        })

        vim.api.nvim_create_autocmd("BufWinLeave", {
            pattern = "*.tex",
            callback = function(args)
                local bufname = vim.api.nvim_buf_get_name(args.buf)
                if not bufname:match("^oil://") then
                    vim.cmd("silent! VimtexClean!")
                end
            end,
        })
    end,
}
