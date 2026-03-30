require('fyler').setup({
    views = {
        finder = {
            confirm_simple = true,
            default_explorer = true,
            indentscope = { marker = '▏' },

            git_status = {
                symbols = {
                    Untracked = '',
                    Added = '',
                    Modified = '',
                    Deleted = '',
                    Renamed = '',
                    Copied = '',
                    Conflict = '',
                    Ignored = '',
                },
            },

            icon = {
                directory_collapsed = '',
                directory_expanded = '',
                directory_empty = '',
            },

            win = {
                kind = 'replace',
                kinds = {
                    float = { width = '30%', top = '10%', left = '35%' },
                },

                win_opts = { cursorline = true, number = true },
            },
        }
    },
})

vim.keymap.set('n', '<leader>o', function()
        require('fyler').open({})
end, { desc = '[O]pen File Tree' })
