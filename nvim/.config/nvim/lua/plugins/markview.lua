return {
    "OXY2DEV/markview.nvim",

    lazy = false,

    config = function()
        local presets = require("markview.presets")

        require("markview").setup({
            markdown = {
                headings = presets.simple,
            },
        })

        vim.api.nvim_set_hl(0, "MarkviewPalette0", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette1", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette2", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette3", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette4", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette5", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette6", { bg = "" })
        vim.api.nvim_set_hl(0, "MarkviewPalette7", { bg = "" })
    end,
}
