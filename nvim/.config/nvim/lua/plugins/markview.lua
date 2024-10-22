return {
    "OXY2DEV/markview.nvim",

    lazy = false,
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    config = function()
        local markview = require("markview")

        markview.setup({
            list_items = { indent_size = 0 },
            headings = {
                shift_width = 0,
            },
        })
    end
}
