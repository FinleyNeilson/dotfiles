local M = {}

M.config = function()
    require("lualine").setup({
        options = {
            icons_enabled = true,
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
end

return M
