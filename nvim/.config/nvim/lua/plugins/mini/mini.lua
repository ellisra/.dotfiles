return {
    { -- Collection of various small independent plugins/modules
        "echasnovski/mini.nvim",

        lazy = false,
        config = function()
            -- One-liners
            require("mini.ai").setup({ n_lines = 500 }) -- Extended around/inside
            require("mini.align").setup({}) -- Align text objects
            require("mini.icons").setup({}) -- Icons
            require("mini.pairs").setup({}) -- Autopairs

            -- Configured Plugins
            require("plugins.mini.clue") -- Keymap hints
            require("plugins.mini.diff") -- Visualise git changes and allow git hunk interraction
            require("plugins.mini.files") -- File system editing
            require("plugins.mini.hipatterns") -- Highlight colour codes and other specified patterns
            require("plugins.mini.surround") -- Add/delete/replace surroundings (brackets, quotes, etc.)
        end,
    },
}
