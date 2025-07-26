return {
    "RRethy/base16-nvim",

    lazy = false,
    priority = 1000,

    init = function()
        vim.api.nvim_create_autocmd("ColorScheme", {
            callback = function()
                require("utils").set_highlights()
            end,

            desc = "Reapply custom highlights on colorscheme change",
        })
    end,
}
