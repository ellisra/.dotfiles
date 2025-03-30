---@type LazySpec
return {
    "shortcuts/no-neck-pain.nvim",

    version = "*",

    opts = {
        width = 102,
    },

    keys = {
        {
            "<leader>nn",
            "<cmd>NoNeckPain<CR>",
            desc = "[N]o [N]eck Pain",
        },
    },
}
