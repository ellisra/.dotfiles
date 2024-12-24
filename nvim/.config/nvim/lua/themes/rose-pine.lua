return {
    {
        "rose-pine/neovim",

        name = "rose-pine",
        lazy = false,
        priority = 1000,

        config = function()
            require("rose-pine").setup({
                variant = "dawn",

                highlight_groups = {
                    NormalFloat = { bg = "#faf4ed" },
                    FloatBorder = { bg = "#faf4ed" },
                    FloatTitle = { bg = "#faf4ed" },
                    FloatFooter = { bg = "#faf4ed" },
                    TelescopeBorder = { bg = "#faf4ed" },

                    StatusLineAccent = { bg = "#9893a5", fg = "#191724" },
                    StatuslineInsertAccent = { bg = "#9ccfd8", fg = "#1f1d2e" },
                    StatuslineVisualAccent = { bg = "#eb6f92", fg = "#1f1d2e" },
                    StatuslineReplaceAccent = { bg = "#f6c177", fg = "#1f1d2e" },
                    StatuslineCmdLineAccent = { bg = "#ebbcba", fg = "#1f1d2e" },
                    StatuslineTerminalAccent = { bg = "#c4a7e7", fg = "#1f1d2e" },
                },
            })
        end,

        init = function()
            vim.cmd.colorscheme("rose-pine-dawn")
        end,
    },
}
