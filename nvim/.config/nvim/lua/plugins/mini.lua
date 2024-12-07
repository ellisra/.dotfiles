return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",
        config = function()
            -- Better Around/Inside textobjects
            require("mini.ai").setup({ n_lines = 500 })

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

            require("mini.files").setup({
                mappings = {},

                windows = {
                    max_number = 3,
                    preview = true,
                    width_focus = 20,
                    width_preview = 50,
                },
            })
        end,
    },
}
