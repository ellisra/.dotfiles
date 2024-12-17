return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            require("mini.ai").setup({ n_lines = 500 }) -- hello

            -- Add/delete/replace surroundings (brackets, quotes, etc.)
            require("mini.surround").setup({
                mappings = {
                    add = "ma",
                    delete = "md",
                    find = "mf",
                    find_left = "mF",
                    highlight = "mv",
                    replace = "mr",
                    update_n_lines = "mn",
                },
            })

            -- Visualise git changes and allow git hunk interraction
            require("mini.diff").setup({
                view = {
                    style = "sign",
                    signs = { add = "▏", change = "▏", delete = "_" },
                    priority = 199,
                },
            })

            -- Better scope highlighting for indent-blankline
            -- require("mini.indentscope").setup({
            --     draw = {
            --         animation = require("mini.indentscope").gen_animation.none(),
            --     },
            --     symbol = "▏",
            -- })

            -- Replacement for nvim-autopairs
            require("mini.pairs").setup({})
        end,
    },
}
