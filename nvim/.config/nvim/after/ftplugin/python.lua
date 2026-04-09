local mini_pairs = require('mini.pairs')
local utils = require('utils')

vim.api.nvim_create_user_command('ISort', function (opts)
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

vim.keymap.set('i', "'", function ()
    local line = vim.api.nvim_get_current_line()
    local col = vim.api.nvim_win_get_cursor(0)[2]
    local char_before = col > 0 and line:sub(col, col) or ''

    if char_before:match('[frb]') then
        return mini_pairs.open("''", '..')
    end

    return mini_pairs.open("''", '[^%a\\].')
end, { buffer = true, expr = true, replace_keycodes = false })

vim.keymap.set('i', '"', function ()
    local before, after = utils.get_pair_context(2)
    if before == '""' and after:sub(1, 1) ~= '"' then
        return vim.api.nvim_replace_termcodes('""""<Left><Left><Left>', true, false, true)
    end

    if before:sub(-1, -1):match('[frb]') then
        return mini_pairs.open('""', '..')
    end

    return mini_pairs.open('""', '[^%a\\].')
end, { buffer = true, expr = true, replace_keycodes = false })
