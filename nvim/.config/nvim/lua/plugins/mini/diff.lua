local utils = require("utils")

return {
    require("mini.diff").setup({
        view = {
            style = "number",
            signs = { add = "│", change = "│", delete = "_" },
            priority = 199,
        },
    }),

    vim.api.nvim_create_user_command(
        "GitDiff",
        "lua MiniDiff.toggle_overlay()",
        { desc = "[G]it [D]iff" }
    ),

    vim.keymap.set(
        "n",
        "<leader>tg",
        "<cmd>GitDiff<CR>",
        { desc = "[T]oggle [G]it diff" }
    ),

    vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
            vim.api.nvim_set_hl(0, "MiniDiffOverAdd", {
                bg = utils.tint_colour(
                    string.format(
                        "#%06X",
                        vim.api.nvim_get_hl(0, { name = "Normal" }).bg
                    ),
                    -10,
                    10,
                    -10
                ),
            })

            vim.api.nvim_set_hl(0, "MiniDiffOverChange", {
                link = "visual",
            })

            vim.api.nvim_set_hl(0, "MiniDiffOverDelete", {
                bg = utils.tint_colour(
                    string.format(
                        "#%06X",
                        vim.api.nvim_get_hl(0, { name = "Normal" }).bg
                    ),
                    20,
                    -10,
                    -10
                ),
            })

            vim.api.nvim_set_hl(0, "MiniDiffOverContext", {
                bg = utils.tint_colour(
                    string.format(
                        "#%06X",
                        vim.api.nvim_get_hl(0, { name = "Normal" }).bg
                    ),
                    20,
                    -10,
                    -10
                ),
            })
        end,
    }),
}
