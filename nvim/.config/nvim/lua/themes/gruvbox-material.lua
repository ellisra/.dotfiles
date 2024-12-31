return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_enable_italic = false
            vim.g.gruvbox_material_disable_italic_comment = true
            vim.g.gruvbox_material_better_performance = 1
        end,

        init = function()
            vim.cmd.colorscheme("gruvbox-material")
            vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
            vim.api.nvim_set_hl(0, "FloatBorder", { link = "Normal" })
            vim.api.nvim_set_hl(0, "FloatTitle", { link = "Normal" })
            vim.api.nvim_set_hl(0, "FloatFooter", { link = "Normal" })

            vim.api.nvim_set_hl(0, "StatusLineAccent", { bg = "#a89984", fg = "#1b1b1b" })
            vim.api.nvim_set_hl(0, "StatuslineInsertAccent", { bg = "#a9b665", fg = "#1b1b1b" })
            vim.api.nvim_set_hl(0, "StatuslineVisualAccent", { bg = "#ea6962", fg = "#1b1b1b" })
            vim.api.nvim_set_hl(0, "StatuslineReplaceAccent", { bg = "#e78a4e", fg = "#1b1b1b" })
            vim.api.nvim_set_hl(0, "StatuslineCmdLineAccent", { bg = "#7daea3", fg = "#1b1b1b" })
            vim.api.nvim_set_hl(0, "StatuslineTerminalAccent", { bg = "#d3869b", fg = "#1b1b1b" })

            vim.api.nvim_set_hl(0, "LspDiagnosticsSignError", { fg = "#ea6962", bg = "#32302f" })
            vim.api.nvim_set_hl(0, "LspDiagnosticsSignWarning", { fg = "#d8a657", bg = "#32302f" })
            vim.api.nvim_set_hl(0, "LspDiagnosticsSignHint", { fg = "#a9b665", bg = "#32302f" })
            vim.api.nvim_set_hl(
                0,
                "LspDiagnosticsSignInformation",
                { fg = "#7daea3", bg = "#32302f" }
            )
        end,
    },
}
