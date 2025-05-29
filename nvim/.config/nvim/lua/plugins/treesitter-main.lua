---@type LazySpec
return {
    "nvim-treesitter/nvim-treesitter",

    branch = "main",
    build = ":TSUpdate",
    lazy = false,

    opts = {
        ensure_installed = {
            "bash",
            "c",
            "diff",
            "html",
            "json",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "query",
            "regex",
            "vim",
            "vimdoc",
            "rust",
            "toml",
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
