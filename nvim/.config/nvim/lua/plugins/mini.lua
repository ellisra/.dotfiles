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

            -- require("mini.files").setup({
            --     mappings = {
            --         close = "<Esc>",
            --         go_in = "<CR>",
            --         go_out = "-",
            --     },
            --
            --     windows = {
            --         max_number = 2,
            --         preview = true,
            --         width_focus = 15,
            --         width_nofocus = 15,
            --         width_preview = 90,
            --     },
            -- })

            -- Replacement for nvim-autopairs
            require("mini.pairs").setup({})
        end,

        init = function()
            -- vim.keymap.set(
            --     "n",
            --     "<leader>o",
            --     "<cmd>lua require('mini.files').open(vim.api.nvim_buf_get_name(0))<CR>",
            --     { desc = "[O]pen file explorer" }
            -- )
        end,
    },
}
