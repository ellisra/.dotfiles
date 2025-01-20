return {
    "saghen/blink.cmp",

    -- event = "InsertEnter",
    event = "VeryLazy",
    version = "v0.*",

    dependencies = {
        { "L3MON4D3/LuaSnip", version = "v2.*" },
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
            },

            trigger = {
                show_on_insert_on_trigger_character = false,
            },

            ghost_text = { enabled = false },
        },

        snippets = {
            preset = "luasnip",
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "lazydev" },
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
