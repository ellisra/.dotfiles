return {
    "MeanderingProgrammer/render-markdown.nvim",

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons",
    },

    --@module "render-markdown"
    --@type render.md.UserConfig
    opts = {
        heading = {
            enable = true,
            sign = false,
            position = 'inline',
            icons = { '', '  ', '  ', '  ', '  ', '  ' },
            width = 'block',
        },
    },
}
