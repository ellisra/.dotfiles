---@type LazySpec
return {
    "folke/lazydev.nvim",

    event = "LspAttach",
    ft = "lua",
    opts = {
        library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
    },
}
