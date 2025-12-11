local utils = require('utils')
local constants = require('constants')

-- Make navigation keys handle wrapped text better in navigation mode
vim.keymap.set('n', 'k', 'gk')
vim.keymap.set('n', 'j', 'gj')

-- Ctrl + j/k navigates half page down/up and centres the cursor
vim.keymap.set('n', '<C-j>', '<C-d>zz')
vim.keymap.set('i', '<C-j>', '<C-o><C-d><C-o>zz')
vim.keymap.set('n', '<C-k>', '<C-u>zz')
vim.keymap.set('i', '<C-k>', '<C-o><C-u><C-o>zz')

-- Navigate to the start of the line with Home
vim.keymap.set({ 'n', 'v' }, '<Home>', '^')
vim.keymap.set('i', '<Home>', '<C-o>^')

-- Clear search highlight on Esc
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Exit built-in terminal
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Vim window split commands
-- <leader>w+h/j/k/l opens a new window in that direction
vim.keymap.set(
    'n',
    '<leader>wl',
    '<cmd>vsplit<CR>',
    { noremap = true, silent = true, desc = 'New window right' }
)
vim.keymap.set(
    'n',
    '<leader>wh',
    '<cmd>leftabove vsplit<CR>',
    { noremap = true, silent = true, desc = 'New window left' }
)
vim.keymap.set(
    'n',
    '<leader>wj',
    '<cmd>split<CR>',
    { noremap = true, silent = true, desc = 'New window down' }
)
vim.keymap.set(
    'n',
    '<leader>wk',
    '<cmd>leftabove split<CR>',
    { noremap = true, silent = true, desc = 'New window up' }
)

-- Open Lazy.nvim
vim.keymap.set('n', '<leader>lz', '<cmd>Lazy<CR>', { desc = 'Open [L]a[z]y.nvim' })

-- Echo current filepath
vim.keymap.set(
    'n',
    '<leader>cd',
    "<cmd>echo expand('%p')<CR>",
    { desc = '[C]urrent [D]irectory' }
)

vim.keymap.set('n', "'", function()
    if vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
    end
end, { desc = 'Jump to next snippet placeholder', expr = true, silent = true })

vim.keymap.set('n', '<leader>gb', function()
    local line = vim.fn.line('.')
    local file = vim.fn.expand('%')

    local cmd = string.format('git blame --porcelain -L%d,%d -- "%s"', line, line, file)
    local output = vim.fn.system(cmd)

    if vim.v.shell_error ~= 0 then
        vim.notify('Git blame failed: ' .. output, vim.log.levels.ERROR)
        return
    end

    local lines = vim.split(output, '\n')
    local author, date = '', ''

    for _, line_content in ipairs(lines) do
        if line_content:match('^author ') then
            author = line_content:gsub('^author ', '')
        elseif line_content:match('^author%-time ') then
            local timestamp = line_content:gsub('^author%-time ', '')
            date = tostring(os.date('%Y-%m-%d', tonumber(timestamp)))
        end
    end

    local content = string.format('  %s • %s', author, date)
    local buf = vim.api.nvim_create_buf(false, true)
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, { content })

    local win = vim.api.nvim_open_win(buf, false, {
        relative = 'cursor',
        row = -3,
        col = 0,
        width = #content,
        height = 1,
        style = 'minimal',
        border = 'rounded',
        focusable = false,
    })

    -- Auto-close logic (same as above)
    local function close_float()
        if vim.api.nvim_win_is_valid(win) then
            vim.api.nvim_win_close(win, true)
        end
    end

    local group = vim.api.nvim_create_augroup('GitBlameFloat', { clear = true })
    vim.api.nvim_create_autocmd(
        { 'CursorMoved', 'CursorMovedI', 'InsertEnter', 'BufLeave' },
        {
            group = group,
            callback = function()
                close_float()
                vim.api.nvim_del_augroup_by_id(group)
            end,
        }
    )
end, { desc = '[G]it [B]lame' })

vim.keymap.set(
    'n',
    '<leader>cc',
    '<cmd>VTerm claude --continue<CR>',
    { desc = '[C]laude [C]ode' }
)

vim.keymap.set('n', '<leader>td', function()
    utils.create_note({
        dirpath = constants.VAULT_DIR .. 'work/todo/',
        filename = tostring(os.date('%Y-%m-%d - TODO')),
        template_path = constants.MD_TEMPLATE_DIR .. 'todo-template.md',
    })
end, { desc = '[T]o[D]o Note'})
