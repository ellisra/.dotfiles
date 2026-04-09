local fzf = require('fzf-lua')
local keymap = vim.keymap.set

fzf.setup({
    fzf_colors = true,
    file_icon_padding = ' ',
    oldfiles = { include_current_session = true },
    defaults = { formatter = 'path.filename_first', git_icons = true },

    keymap = {
        builtin = {
            ['<C-p>'] = 'toggle-preview',
            ['<S-Down>'] = 'preview-page-down',
            ['<S-Up>'] = 'preview-page-up',
        },
    },

    winopts = {
        backdrop = 100,
        height = 0.50,
        width = 0.50,
        row = 1,
        col = 0,

        preview = {
            wrap = true,
            vertical = 'down:90%',
            hidden = true,
        },
    },

    grep = {
        rg_opts = '--column --line-number --no-heading --color=always --smart-case --max-columns=4096 --hidden -g "!.git" -e',

        winopts = {
            height = 0.5,
            width = 1,
            row = 1,
            col = 0,

            preview = {
                wrap = true,
                horizontal = 'right:70%',
                hidden = false,
            },
        },
    },
})

keymap('n', '<leader>sf', fzf.files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>so', fzf.oldfiles, { desc = '[S]earch [O]ldfiles' })
keymap('n', '<leader><leader>', fzf.resume, { desc = '[ ] Resume search' })
keymap('n', '<leader>sb', fzf.buffers, { desc = '[S]earch [B]uffers' })
keymap('n', '<leader>sg', fzf.live_grep, { desc = '[S]earch [G]rep' })

keymap('n', '<leader>sn', function ()
    fzf.files({ cwd = vim.fn.stdpath('config') })
end, { desc = '[S]earch [N]eovim config' })

keymap('n', '<leader>sd', function ()
    fzf.diagnostics_document({
        winopts = {
            width = 1,
            height = 0.2,
        },
    })
end, { desc = '[S]earch [D]iagnostics' })

keymap('n', '<leader>sr', function ()
    fzf.lsp_references({
        winopts = {
            width = 1,
            height = 0.2,
            preview = {
                hidden = false,
                layout = 'horizontal',
                horizontal = 'right:60%',
            },
        }
    })
end, { desc = '[S]earch [R]eferences' })

keymap('n', '<leader>ca', function ()
    fzf.lsp_code_actions({
        winopts = {
            width = 1,
            preview = {
                hidden = false,
                layout = 'horizontal',
                horizontal = 'right:70%'
            }
        }
    })
end, { desc = '[C]ode [A]ctions' })

keymap('n', 'gd', function ()
    fzf.lsp_definitions({ jump1 = true })
end, { desc = '[G]o to [D]efinition' })

keymap('n', '<leader>sm', function ()
    fzf.helptags({
        winopts = {
            width = 1,
            preview = {
                hidden = false,
                layout = 'horizontal',
                horizontal = 'right:60%',
            },
        },
    })
end, { desc = '[S]earch [M]anual' })

keymap('n', '<leader>sk', function ()
    fzf.keymaps({
        winopts = {
            width = 1,
            height = 0.4,
            preview = {
                layout = 'vertical',
                vertical = 'down:40%',
            },
        },
    })
end, { desc = '[S]earch [K]eymaps' })

keymap('n', '<leader>sc', function ()
    fzf.colorschemes({
        winopts = { height = 0.2, width = 0.2 },
    })
end, { desc = '[S]earch [C]olorschemes' })

keymap('n', '<leader>sh', function ()
    fzf.highlights({ fzf_colors = true })
end, { desc = '[S]earch [H]ighlights' })

keymap('n', '<leader>sp', function ()
    fzf.spell_suggest({ winopts = { width = 0.1, height = 0.2 } })
end, { desc = '[S][p]elling suggestions' })

