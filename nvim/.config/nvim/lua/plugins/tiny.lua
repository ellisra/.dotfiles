return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",

        event = "LspAttach",
        priority = 1000,

        config = function()
            require("tiny-inline-diagnostic").setup({
                preset = "simple",
                options = {
                    multilines = true,
                },
            })
        end,
    },

    {
        "rachartier/tiny-code-action.nvim",

        event = "LspAttach",
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },

        config = function()
            require("tiny-code-action").setup()

            vim.keymap.set("n", "<leader>q", function()
                require("tiny-code-action").code_action({})
            end, { noremap = true, silent = true, desc = "Open [Q]uickfix List" })
        end,
    },
}
