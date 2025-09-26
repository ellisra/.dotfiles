return {
    'A7Lavinraj/fyler.nvim',

    commit = 'c2bd45c',

    opts = {
        confirm_simple = true,
        default_explorer = true,
        indentscope = {
            marker = '▏',
        },

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
            buf_opts = {
                buflisted = false,
                buftype = 'acwrite',
                expandtab = true,
                filetype = 'fyler',
                shiftwidth = 2,
                syntax = 'fyler',
            },
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
            win_opts = {
                winhighlight = 'FzfLuaNormal:FzfLuaNormal,FzfLuaBorder:FzfLuaBorder,FzfLuaTitle:FzfLuaTitle',
            },
        },
    },

    init = function()
        local Fyler = require('fyler')

        vim.keymap.set('n', '<leader>o', function()
            Fyler.open({})
        end, { desc = '[O]pen File Tree' })

        vim.api.nvim_create_autocmd('FileType', {
            pattern = 'fyler',
            callback = function()
                vim.opt_local.statuscolumn = ''
                vim.opt_local.number = false
                vim.opt_local.relativenumber = false
            end,
        })
    end,
}
