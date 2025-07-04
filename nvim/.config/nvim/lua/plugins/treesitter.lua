return {
    "nvim-treesitter/nvim-treesitter",

    lazy = false,
    branch = "main",
    build = ":TSUpdate",

    config = function()
        local patterns = {
            "bash",
            "c",
            "diff",
            "go",
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
            "yaml",
        }

        require("nvim-treesitter").install(patterns)

        vim.api.nvim_create_autocmd("FileType", {
            pattern = patterns,
            callback = function()
                vim.treesitter.start()
                vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
                vim.bo.indentexpr =
                    "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
