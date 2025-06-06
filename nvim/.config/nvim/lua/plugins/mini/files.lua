return {
    require("mini.files").setup({
        mappings = {
            close = "<Esc>",
            synchronize = "t",

            go_in = "",
            go_in_plus = "<CR>",
            go_out = "-",
        },

        windows = {
            max_number = 1,
            width_focus = 50,
        },
    }),

    vim.keymap.set("n", "<leader>o", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
    end, { desc = "[O]pen MiniFiles" }),

    vim.keymap.set("n", "-", function()
        MiniFiles.open(vim.api.nvim_buf_get_name(0), false)
        MiniFiles.reveal_cwd()
    end),

    vim.api.nvim_create_autocmd("User", {
        pattern = "MiniFilesBufferCreate",
        callback = function(args)
            local map_buf = function(lhs, rhs)
                vim.keymap.set("n", lhs, rhs, { buffer = args.data.buf_id })
            end

            map_buf("q", MiniFiles.close)
        end,
    }),
}
