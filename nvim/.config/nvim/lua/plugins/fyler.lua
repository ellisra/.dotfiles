return {
    "A7Lavinraj/fyler.nvim",

    opts = {
        auto_confirm_simple_edits = true,
        default_explorer = true,
        indentscope = { marker = "▏" },
        views = {
            confirm = { width = 0.2, height = 0.2 },
            explorer = {
                width = 0.2,
                height = 1,
                kind = "split:leftmost",
            },
        },
    },

    init = function()
        vim.keymap.set(
            "n",
            "<leader>o",
            "<cmd>Fyler<CR>",
            { desc = "[O]pen File Tree" }
        )

        vim.api.nvim_create_autocmd("FileType", {
            pattern = "fyler",
            callback = function()
                vim.opt_local.statuscolumn = ""
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
            end,
        })
    end,
}
