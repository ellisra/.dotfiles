---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",

    build = ":TSUpdate",

    opts = {
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "vim",
            "vimdoc",
            "rust",
            "python",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
    },

    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
