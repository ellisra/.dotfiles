local utils = require('utils')

vim.opt_local.wrap = true
if vim.bo.buftype == '' then
    vim.opt_local.spell = true
end

vim.keymap.set('n', '-', function()
    utils.toggle_checkbox()
end, { desc = 'Togge Checkbox', buffer = true })

vim.keymap.set('n', '<leader>at', function()
    utils.select_markdown_table()
    vim.api.nvim_feedkeys('ga|', 'x', false)
end, { desc = '[A]lign [T]able', buffer = true })

vim.api.nvim_create_user_command('AddFootnote', function(opts)
    local footnote_num = opts.args

    vim.api.nvim_put({ '[^' .. footnote_num .. ']' }, 'c', true, true)

    vim.cmd('normal! G')
    vim.cmd('normal! o')
    vim.api.nvim_put({ '[^' .. footnote_num .. ']: ' }, 'c', false, true)
    vim.cmd('stopinsert')
end, { nargs = 1 })

vim.api.nvim_create_user_command('AddTags', function()
    vim.api.nvim_put({ '---', 'tags:', '  - ', '---' }, 'l', false, true)
    vim.api.nvim_win_set_cursor(0, {3, 5})
    vim.cmd('startinsert!')
end, { desc = 'Add markdown tag block' })

vim.fn.matchadd('MdLinkBrackets', '\\[\\[')
vim.fn.matchadd('MdLinkBrackets', '\\]\\]')
