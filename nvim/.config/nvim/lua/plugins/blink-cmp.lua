return {
    "saghen/blink.cmp",

    event = "InsertEnter",
    version = "v0.*",

    dependencies = {
        "L3MON4D3/LuaSnip",
        "rafamadriz/friendly-snippets",
    },

    opts = {
        keymap = {
            preset = "default",

            ["<Up>"] = { "select_prev", "fallback" },
            ["<Down>"] = { "select_next", "fallback" },

            ["<Tab>"] = { "select_and_accept", "fallback" },
            ["<C-Enter>"] = { "select_and_accept", "fallback" },
        },
        appearance = {
            use_nvim_cmp_as_default = false,
            nerd_font_variant = "mono",
        },

        completion = {
            accept = { auto_brackets = { enabled = true } },

            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
                treesitter_highlighting = true,

                -- window = { border = "single" },
            },

            trigger = {
                show_on_insert_on_trigger_character = false,
            },

            ghost_text = { enabled = false },
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
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
            min_keyword_length = function()
                if vim.fn.getcmdtype() == ":" then
                    return 3
                else
                    return 1
                end
            end,
        },
    },

    opts_extend = { "sources.default" },
}
