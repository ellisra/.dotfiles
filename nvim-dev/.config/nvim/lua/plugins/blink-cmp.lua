return {
    "saghen/blink.cmp",

    lazy = false,
    version = "v0.*",

    dependencies = "L3MON4D3/LuaSnip",

    opts = {
        keymap = { preset = "default" },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },
        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev", "luasnip" },
            providers = {
                lsp = { fallback_for = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },

        completion = { accept = { auto_brackets = { enabled = true } } },

        snippets = {
            expand = function(snippet)
                require("LuaSnip").lsp_expand(snippet)
            end,
            active = function(filter)
                if filter and filter.direction then
                    return require("luasnip").jumpable(filter.direction)
                end
                return require("luasnip").in_snippet()
            end,
            jump = function(direction)
                require("luasnip").jump(direction)
            end,
        },
    },

    opts_extend = { "sources.default" },
}
