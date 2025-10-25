vim.opt_local.wrap = true
vim.opt_local.spell = true

vim.keymap.set('n', '-', function()
    require('utils').toggle_checkbox()
end, { desc = 'Togge Checkbox', buffer = true })
