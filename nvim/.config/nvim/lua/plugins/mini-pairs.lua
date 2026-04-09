require('mini.pairs').setup({ modes = { insert = true, command = true } })

local utils = require('utils')

vim.keymap.set('i', '<Space>', function ()
    local before, after = utils.get_pair_context()
    if before == '{' and after == '}' then
        return '<Space><Space><Left>'
    end

    return '<Space>'
end, { expr = true, replace_keycodes = true })

vim.keymap.set('i', '<BS>', function ()
    local before, after = utils.get_pair_context()
    if before == ' ' and after == ' ' then
        local outer_before, outer_after = utils.get_pair_context(2)
        local open = outer_before:sub(1, 1)
        local close = outer_after:sub(2, 2)
        if open == '{' and close == '}' then
            return vim.api.nvim_replace_termcodes('<BS><Del>', true, false, true)
        end
    end

    return require('mini.pairs').bs()
end, { expr = true, replace_keycodes = false })
