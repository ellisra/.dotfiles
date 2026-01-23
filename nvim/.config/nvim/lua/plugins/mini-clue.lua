local miniclue = require('mini.clue')

return {
    miniclue.setup({
        triggers = {
            -- Leader triggers
            { mode = 'n', keys = '<Leader>' },
            { mode = 'x', keys = '<Leader>' },

            -- Built-in completion
            { mode = 'i', keys = '<C-x>' },

            -- `g` key
            { mode = 'n', keys = 'g' },
            { mode = 'x', keys = 'g' },

            -- Marks
            { mode = 'n', keys = '`' },
            { mode = 'x', keys = "'" },
            { mode = 'x', keys = '`' },

            -- Registers
            { mode = 'n', keys = '"' },
            { mode = 'x', keys = '"' },
            { mode = 'i', keys = '<C-r>' },
            { mode = 'c', keys = '<C-r>' },

            -- Window commands
            { mode = 'n', keys = '<C-w>' },

            -- `z` key
            { mode = 'n', keys = 'z' },
            { mode = 'x', keys = 'z' },

            -- Additional triggers
            { mode = 'n', keys = 's' },
            { mode = 'n', keys = '[' },
            { mode = 'n', keys = ']' },
        },

        clues = {
            miniclue.gen_clues.builtin_completion(),
            miniclue.gen_clues.g(),
            miniclue.gen_clues.marks(),
            miniclue.gen_clues.registers(),
            miniclue.gen_clues.windows(),
            miniclue.gen_clues.z(),
        },

        window = { delay = 100, config = { width = 50 } },
    }),

    vim.api.nvim_create_autocmd('BufEnter', {
        desc = 'Ensure triggers are enabled if mini.clue is loaded',
        group = vim.api.nvim_create_augroup('ellisra.enable_miniclue_triggers', { clear = true }),
        callback = function(args)
            ---@diagnostic disable-next-line: undefined-field
            if _G.MiniClue then
                ---@diagnostic disable-next-line: undefined-global
                MiniClue.enable_buf_triggers(args.buf)
            end
        end,
    })
}
