return {
    "rachartier/tiny-inline-diagnostic.nvim",

    event = "LspAttach",
    priority = 1000,

    config = function()
        require("tiny-inline-diagnostic").setup({
            preset = "simple",
            options = {
                multilines = true,
            },
        })

        -- Stop all diagnostics from beind displayed for tiny-inline-diagnostics.nvim
        vim.diagnostic.config({ virtual_text = false })
    end,
}
