local utils = require('utils')

vim.opt_local.wrap = true
vim.opt_local.spell = true

vim.keymap.set('n', '-', function()
    utils.toggle_checkbox()
end, { desc = 'Togge Checkbox', buffer = true })

vim.keymap.set('n', '<leader>at', function()
    utils.select_markdown_table()
    vim.api.nvim_feedkeys('ga|', 'x', false)
end, { desc = '[A]lign [T]able', buffer = true })
