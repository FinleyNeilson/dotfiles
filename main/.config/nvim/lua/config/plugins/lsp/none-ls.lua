return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.clang_format.with({
                    extra_args = { "--style={BasedOnStyle: Google, IndentWidth: 4}" },
                }),
                null_ls.builtins.formatting.markdownlint.with({
                    extra_args = { "--config", "/home/finley-neilson/.config/nvim/markdownlint.json" },
                }),
                null_ls.builtins.diagnostics.markdownlint.with({
                    diagnostics_format = "#{m} (#{c})",
                    extra_args = { "--config", "/home/finley/.config/nvim/markdownlint.json" },
                }),
            },
        })
        vim.keymap.set("n", "<leader><CR>", vim.lsp.buf.format, { desc = "code format space =" })
    end,
}
