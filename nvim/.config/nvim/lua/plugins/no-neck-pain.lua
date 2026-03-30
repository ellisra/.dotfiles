require('no-neck-pain').setup({ width = 130 })

vim.keymap.set('n','<leader>nn', '<cmd>NoNeckPain<CR>', { desc = '[N]o [N]eck Pain' })
vim.keymap.set('n', 'I', '<cmd>NoNeckPainWidthUp<CR>')
vim.keymap.set('n', 'U', '<cmd>NoNeckPainWidthDown<CR>')
