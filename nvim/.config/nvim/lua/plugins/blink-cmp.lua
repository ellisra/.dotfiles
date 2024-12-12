return {
    "saghen/blink.cmp",

    lazy = false,
    version = "v0.*",

    dependencies = { "L3MON4D3/LuaSnip" },

    opts = {
        keymap = {
            preset = "default",

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },

            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<CR>"] = { "select_and_accept", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },

            documentation = {
                auto_show = true,
                auto_show_delay = 200,
            },
        },

        snippets = {
            expand = function(snippet)
                require("luasnip").lsp_expand(snippet)
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

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev", "luasnip" },
            providers = {
                lsp = { fallback = { "lazydev" } },
                lazydev = { name = "LazyDev", module = "lazydev.integrations.blink" },
            },
        },
    },

    opts_extend = { "sources.default" },
}