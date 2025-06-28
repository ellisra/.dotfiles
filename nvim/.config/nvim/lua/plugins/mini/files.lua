local minifiles = require("mini.files")

local function open_cwd()
    minifiles.open(vim.api.nvim_buf_get_name(0), false)
    minifiles.reveal_cwd()
end

return {
    require("mini.files").setup({
        mappings = {
            close = "<Esc>",
            synchronize = "t",

            go_in = "",
            go_in_plus = "<CR>",
            go_out = "-",
        },

        windows = {
            max_number = 1,
            width_focus = 50,
        },
    }),

    vim.keymap.set("n", "<leader>o", function()
        open_cwd()
    end, { desc = "[O]pen MiniFiles" }),
}
