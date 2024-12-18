return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "medium"
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_enable_italic = false
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_better_performance = 1
        end,

        init = function()
            vim.cmd.colorscheme("gruvbox-material")
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#282828", fg = "#d4be98" })
            vim.api.nvim_set_hl(0, "FloatBorder", { bg = "#282828", fg = "#d4be98" })
            vim.api.nvim_set_hl(0, "FloatTitle", { bg = "#282828", fg = "#d4be98" })
            vim.api.nvim_set_hl(0, "FloatFooter", { bg = "#282828", fg = "#d4be98" })
        end,
    },
}
