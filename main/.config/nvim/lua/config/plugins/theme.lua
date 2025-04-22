return {
    { "rose-pine/neovim",               lazy = false },
    { "catppuccin/nvim",                lazy = false },
    { "dgox16/oldworld.nvim",           lazy = false },
    { "sainnhe/everforest",             lazy = false },
    { "rebelot/kanagawa.nvim",          lazy = false },
    { "AlexvZyl/nordic.nvim",           lazy = false },
    { "thesimonho/kanagawa-paper.nvim", lazy = false },
    { "sainnhe/gruvbox-material",       lazy = false },
    { "slugbyte/lackluster.nvim",       lazy = false },
    { "vague2k/vague.nvim",             lazy = false },
    { "dasupradyumna/midnight.nvim",    lazy = false },
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                livePreview = true, -- Apply theme while picking. Default to true.
                themes = {
                    -- Dark Themes
                    {
                        name = "rose-pine",
                        colorscheme = "rose-pine-main",
                    },
                    {
                        name = "rose-pine-moon",
                        colorscheme = "rose-pine-moon",
                    },
                    {
                        name = "rose-pine-prime",
                        colorscheme = "rose-pine-main",
                        after = [[
                                vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
                                ]],
                    },
                    {
                        name = "rose-pine-moon-prime",
                        colorscheme = "rose-pine-moon",
                        after = [[
                                vim.api.nvim_set_hl(0, "Normal", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "NormalNC", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "EndOfBuffer", { bg = "none", ctermbg = "none" })
                                vim.api.nvim_set_hl(0, "SignColumn", { bg = "none", ctermbg = "none" })
                                ]],
                    },
                    {
                        name = "oldworld",
                        colorscheme = "oldworld",
                    },
                    {
                        name = "everforest-hard",
                        colorscheme = "everforest",
                        before = [[
                                vim.opt.background = "dark"
                                vim.g.everforest_background = "hard"
                                ]],
                    },
                    {
                        name = "gruvbox",
                        colorscheme = "gruvbox-material",
                    },
                    {
                        name = "catppuccin-mocha",
                        colorscheme = "catppuccin-mocha",
                        before = [[
                                vim.opt.background = "dark"
                                ]],
                    },
                },
            })
        end,
        keys = {
            { "<leader>th", ":Themery<CR>", desc = "toggle Themery" },
        },
    },
}
