local utils = require('utils')
local constants = require('constants')

vim.api.nvim_create_user_command('W', 'w', {})
utils.create_split_term_command('HTerm', 'split')
utils.create_split_term_command('VTerm', 'vsplit')

vim.api.nvim_create_user_command('WeeklyRecap', function()
    utils.create_note({
        dirpath = constants.VAULT_DIR .. 'journal/weekly/',
        filename = string.format('%d-W%02d', os.date('%Y'), os.date('%V')),
        tags = { 'journal', 'weekly' },
    })
end, { desc = 'Create a weekly journal note' })

vim.api.nvim_create_user_command('VimPackUpdate', function()
    vim.pack.update()
end, { desc = 'Check for plugin updates' })
