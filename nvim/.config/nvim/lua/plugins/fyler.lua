return {
    "A7Lavinraj/fyler.nvim",

    opts = {
        auto_confirm_simple_edits = true,
        default_explorer = true,
        indentscope = { marker = "▏" },
        views = {
            confirm = { width = 0.2, height = 0.2 },
            explorer = {
                width = 0.15,
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
    end,
}
