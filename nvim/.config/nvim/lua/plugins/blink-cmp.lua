return {
    "daghen/blink.cmp",

    lazy = false,
    dependencies = "rafamdriz/friendly-snippets",

    opts = {
        keymap = {
            ["<CR>"] = { "select_and_accept", "fallback" },
            ["<tab>"] = { "select_and_accept", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },
            ["<Up>"] = { "select_prev", "fallback" },
            ["<PageDown>"] = { "scroll_documentation_down" },
            ["<PageUp>"] = { "scroll_documentation_up" },
        },

        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },
    },
}
