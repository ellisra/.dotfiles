require('fyler').setup({
    views = {
        finder = {
            confirm_simple = true,
            default_explorer = true,
            indentscope = { marker = '▏' },

            icon = {
                directory_collapsed = '',
                directory_expanded = '',
                directory_empty = '',
            },

            win = {
                kind = 'replace',
                win_opts = { cursorline = true, number = true },
            },
        }
    },
})

vim.keymap.set('n', '<leader>o', function ()
        require('fyler').open({})
end, { desc = '[O]pen File Tree' })
