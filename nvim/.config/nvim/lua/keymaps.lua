local utils = require('utils')
local constants = require('constants')

-- Make navigation keys handle wrapped text better in navigation mode
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

-- Keep cursor centred on jumps
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzz')
vim.keymap.set('n', 'N', 'Nzz')

-- Navigate to the start of the line with Home
vim.keymap.set({ 'n', 'v' }, '<Home>', '^')
vim.keymap.set('i', '<Home>', '<C-o>^')

-- <leader>w+h/j/k/l opens a new window in that direction
vim.keymap.set('n', '<leader>wl', '<cmd>vsplit<CR>', { desc = 'New window right' })
vim.keymap.set('n', '<leader>wh', '<cmd>leftabove vsplit<CR>', { desc = 'New window left' })
vim.keymap.set('n', '<leader>wj', '<cmd>split<CR>', { desc = 'New window down' })
vim.keymap.set('n', '<leader>wk', '<cmd>leftabove split<CR>', { desc = 'New window up' })

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlight' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('n', '<leader>lz', '<cmd>Lazy<CR>', { desc = 'Open [L]a[z]y.nvim' })
vim.keymap.set('n', '<leader>cd', "<cmd>echo expand('%p')<CR>", { desc = '[C]urrent [D]irectory' })
vim.keymap.set('n', '<leader>gb', function() utils.show_git_blame() end, { desc = '[G]it [B]lame' })
vim.keymap.set('n', '<leader>cc', '<cmd>VTerm claude --continue<CR>', { desc = '[C]laude [C]ode' })

vim.keymap.set('n', "'", function()
    if vim.snippet.active({ direction = 1 }) then vim.snippet.jump(1) end
end, { desc = 'Jump to next snippet placeholder', expr = true, silent = true })

vim.keymap.set('n', '<leader>td', function()
    utils.create_note({
        dirpath = constants.VAULT_DIR .. 'work/todo/',
        filename = tostring(os.date('%Y-%m-%d TODO')),
        template_path = constants.MD_TEMPLATE_DIR .. 'todo-template.md',
    })
end, { desc = 'Create [T]o[D]o Note'})

vim.keymap.set('n', 'D', function()
    vim.diagnostic.open_float({ border = 'single', max_width = 70 })
end, { desc = '[D]iagnostic float' })
