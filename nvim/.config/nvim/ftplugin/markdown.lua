vim.opt_local.breakindent = true
vim.opt_local.linebreak = true
vim.opt_local.wrap = true
vim.opt_local.spell = true

local utils = require('utils')

vim.keymap.set('n', '-', function()
    utils.toggle_checkbox()
end, { desc = 'Togge Checkbox', buffer = true })
