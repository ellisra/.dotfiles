return {
    "ibhagwan/fzf-lua",

    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("fzf-lua").setup({})

        vim.keymap.set("n", "<leader>sf", "<cmd>FzfLua files<CR>", { desc = "[S]earch [F]iles" })
    end,
}
