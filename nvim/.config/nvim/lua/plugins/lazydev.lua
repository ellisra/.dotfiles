return {
    "folke/lazydev.nvim",

    event = "LspAttach",
    ft = "lua",
    opts = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
}
