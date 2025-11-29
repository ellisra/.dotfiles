return {
    'A7Lavinraj/fyler.nvim',
    branch = 'stable',

    opts = {
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
                    kind = 'float',
                    kinds = {
                        float = { width = '30%', top = '10%', left = '35%' },
                    }
                },
            }
        },
    },

    init = function()
        local Fyler = require('fyler')

        vim.keymap.set('n', '<leader>o', function()
            Fyler.open({})
        end, { desc = '[O]pen File Tree' })
    end,
}
