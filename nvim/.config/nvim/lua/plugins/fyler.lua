return {
    'A7Lavinraj/fyler.nvim',

    branch = 'stable',

    opts = {
        confirm_simple = true,
        default_explorer = true,
        indentscope = { marker = '▏' },
        popups = { permission = { width = '0.3rel', left = '0.35rel' } },

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

        win = {
            border = 'single',
            kind = 'float',
            kind_presets = {
                split_left_most = {
                    width = '0.12rel',
                },
                split_right_most = {
                    width = '0.15rel',
                },
                float = {
                    width = '0.3rel',
                    top = '0.1rel',
                    left = '0.35rel',
                },
            },
        },
    },

    init = function()
        local Fyler = require('fyler')

        vim.keymap.set('n', '<leader>o', function()
            Fyler.open({})
        end, { desc = '[O]pen File Tree' })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'Fyler',
            callback = function()
                vim.opt_local.statuscolumn = ''
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
            end,
        })
    end,
}
