return {
    "shortcuts/no-neck-pain.nvim",

    version = "*",

    opts = {
        width = 107,
    },

    keys = {
        {
            "<leader>nn",
            "<cmd>NoNeckPain<CR>",
            desc = "[N]o [N]eck Pain",
        },
        {
            "<M-i>",
            "<cmd>NoNeckPainWidthUp<CR>",
            desc = "Increase width",
        },
        {
            "<M-u>",
            "<cmd>NoNeckPainWidthDown<CR>",
            desc = "Decrease width",
        },
    },
}
