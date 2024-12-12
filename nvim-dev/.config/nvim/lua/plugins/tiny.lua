return {
    {
        "rachartier/tiny-inline-diagnostic.nvim",

        event = "VeryLazy",
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
        end,
    },
}
