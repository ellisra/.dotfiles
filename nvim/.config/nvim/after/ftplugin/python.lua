local mini_pairs = require('mini.pairs')

vim.api.nvim_create_user_command('ISort', function(opts)
    local path = opts.args
    local isort = '!ruff check --select I --fix %s'

    if path ~= nil and path ~= '' then
        vim.cmd(string.format(isort, path))
    else
        vim.cmd(string.format(isort, '%'))
    end
end, {
    nargs = '?',
    complete = 'file',
    desc = 'isort current python file with ruff',
})

vim.keymap.set('i', "'", function()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local char_before = col > 0 and line:sub(col, col) or ''

    if char_before:match('[frb]') then
        return mini_pairs.open("''", '..')
    end

    return mini_pairs.open("''", '[^%a\\].')
end, { buffer = true, expr = true, replace_keycodes = false })
