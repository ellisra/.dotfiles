return {
    "shortcuts/no-neck-pain.nvim",

    version = "*",

    opts = {
        width = 120,
    },

    init = function()
        vim.keymap.set("n", "I", "<cmd>NoNeckPainWidthUp<CR>")
        vim.keymap.set("n", "U", "<cmd>NoNeckPainWidthDown<CR>")
    end,

    keys = {
        {
            "<leader>nn",
            "<cmd>NoNeckPain<CR>",
            desc = "[N]o [N]eck Pain",
        },
    },
}
