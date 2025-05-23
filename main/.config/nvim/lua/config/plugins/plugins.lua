return {
    { "ThePrimeagen/vim-be-good", lazy = true },
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("lualine").setup({
                options = {
                    component_separators = { left = "", right = "" },
                    section_separators = { left = "", right = "" },
                },
                sections = {
                    lualine_a = {
                        {
                            "filename",
                            file_status = true,
                            newfile_status = true,
                            symbols = {
                                modified = "●",
                                readonly = "🔒",
                                unnamed = "[No Name]",
                                newfile = "[New]",
                            },
                            color = {},
                        },
                    },
                    lualine_b = { "branch", "diff", "diagnostics" },
                    lualine_c = { "buffers" },
                    lualine_x = { "filetype" },
                    lualine_y = { "progress" },
                    lualine_z = { "location" },
                },
            })
        end,
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
    },
    { "numToStr/Comment.nvim",    opts = {} },
    {
        "stevearc/oil.nvim",
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        lazy = false,

        config = function()
            require("oil").setup({
                keymaps = {
                    ["gR"] = "actions.refresh",
                    ["<C-l>"] = false,
                },
            })

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
        end,
    },
    { "folke/which-key.nvim",   opts = {} },
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end,
    },
    {
        "mbbill/undotree",
        vim.keymap.set("n", "<leader>tu", vim.cmd.UndotreeToggle, { desc = "toggle undo tree" }),
    },
    { "kylechui/nvim-surround", opts = {} },
    {
        "unblevable/quick-scope",
        config = function()
            -- vim.api.nvim_set_hl(0, "QuickScopePrimary", {
            --     fg = "#E6B99D",
            --     underline = true,
            --     ctermfg = 155,
            -- })
            --
            -- vim.api.nvim_set_hl(0, "QuickScopeSecondary", {
            --     fg = "#90B99F",
            --     underline = true,
            --     ctermfg = 81,
            -- })
            vim.g.qs_enable = 1
            vim.keymap.set("n", "<leader>ts", "<cmd>:QuickScopeToggle<cr>", { desc = "toggle quick scope" })
        end,
    },
}
