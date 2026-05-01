return {
    "nvim-tree/nvim-tree.lua",
    keys = {
        { "<leader>ot", "<cmd>NvimTreeToggle<cr>", desc = "Toggle NvimTree", silent = true },
    },
    opts = {
        renderer = {
            icons = {
                show = {
                    git = false,
                    folder = true,
                    file = true,
                },
            },
        },
        view = {
            float = {
                enable = true,
                open_win_config = function()
                    local screen_w = vim.opt.columns:get()
                    local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
                    local window_w = math.floor(screen_w * 0.7)
                    local window_h = math.floor(screen_h * 0.7)
                    local center_x = (screen_w - window_w) / 2
                    local center_y = (screen_h - window_h) / 2
                    return {
                        relative = "editor",
                        border = "rounded",
                        width = window_w,
                        height = window_h,
                        row = center_y,
                        col = center_x,
                    }
                end,
            },
            width = function()
                return math.floor(vim.opt.columns:get() * 0.7)
            end,
        },
    },
}
