return {
    {
        "rose-pine/neovim",
        name = "rose-pine",

        config = function()
            require("rose-pine").setup({
                variant = "auto",

                palette = {
                    main = { -- Softened the colour palette
                        _nc = "#16141f",
                        base = "#191724",
                        surface = "#2f2d3c",
                        overlay = "#353346",
                        muted = "#716e85",
                        subtle = "#8d8aa3",
                        text = "#c9c7cd",
                        love = "#ea83a5",
                        gold = "#e6b99d",
                        rose = "#e29eca",
                        pine = "#90b99f",
                        foam = "#85b5ba",
                        iris = "#aca1cf",
                        leaf = "#95b1ac",
                        highlight_low = "#31303c",
                        highlight_med = "#4a4959",
                        highlight_high = "#59586b",
                        none = "NONE",
                    },
                },
            })
        end,

        init = function()
            vim.cmd.colorscheme("rose-pine")
        end,
    },
}
