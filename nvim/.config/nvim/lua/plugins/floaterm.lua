return {
    "voldikss/vim-floaterm",

    config = function()
        vim.keymap.set("n", "<leader>to", ":FloatermNew<CR>", { desc = "[T]erminal [O]pen" })
        vim.keymap.set("n", "<leader>tt", ":FloatermToggle<CR>", { desc = "[T]erminal [T]oggle" })
        vim.keymap.set("n", "<leader>tk", ":FloatermKill<CR>", { desc = "[T]erminal [K]ill" })
        vim.keymap.set("n", "<leader>tn", ":FloatermNext<CR>", { desc = "[T]erminal [N]ext" })
        vim.keymap.set("n", "<leader>tp", ":FloatermPrev<CR>", { desc = "[T]erminal [P]rev" })
        vim.keymap.set(
            "n",
            "<leader>lg",
            ":FloatermNew --width=0.9 --height=0.9<CR>lazygit<CR>",
            { desc = "Open [L]azy[G]it" }
        )
    end,
}
