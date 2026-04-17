require('blink.cmp').setup({
    keymap = {
        preset = 'default',
        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<C-Enter>'] = { 'select_and_accept', 'fallback' },
        ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
    },

    cmdline = {
        enabled = true,
        completion = { menu = { auto_show = true } },
        keymap = {
            ['<Up>'] = { 'select_prev', 'fallback' },
            ['<Down>'] = { 'select_next', 'fallback' },
            ['<Tab>'] = { 'select_and_accept', 'fallback' },
        },
    },

    completion = {
        trigger = { show_on_insert_on_trigger_character = false },

        documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            treesitter_highlighting = true,
            window = { border = 'single' },
        },
    },

    signature = {
        enabled = true,
        trigger = {
            show_on_trigger_character = false,
            show_on_insert_on_trigger_character = false,
            show_on_accept_on_trigger_character = false,
        },
        window = {
            border = 'single',
            show_documentation = true,
        },
    },

    sources = {
        default = { 'lsp', 'path', 'buffer' },
        per_filetype = { markdown = { 'lsp' } },
        min_keyword_length = function ()
            local mode = vim.api.nvim_get_mode().mode
            if mode == 'c' then
                return 2
            else
                return 1
            end
        end,
    },
})
