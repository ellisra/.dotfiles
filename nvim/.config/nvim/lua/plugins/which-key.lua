return {
    {
        "folke/which-key.nvim",

        event = "VimEnter",

        opts = { preset = "modern" },

        config = function(_, opts)
            require("which-key").setup(opts)
        end,
    },
}
