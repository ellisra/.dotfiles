return {
    "danymat/neogen",

    config = function()
        require("neogen").setup({
            snippet_engine = "luasnip",
            input_after_comment = true,
        })

        vim.api.nvim_set_keymap(
            "n",
            "<leader>do",
            "<cmd>Neogen<CR>",
            { desc = "[Do]cument function" }
        )
    end,
}
