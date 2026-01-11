local utils = require('utils')

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = vim.api.nvim_create_augroup('ellisra.highlight_yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize splits if terminal resized',
    group = vim.api.nvim_create_augroup('ellisra.resize_windows', { clear = true }),
    command = 'wincmd =',
})

vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Place curseor at last position on buffer entry',
    group = vim.api.nvim_create_augroup('ellisra.auto_last_position', { clear = true }),
    callback = function(args)
        local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
        local winid = vim.fn.bufwinid(args.buf)
        pcall(vim.api.nvim_win_set_cursor, winid, position)
    end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
    desc = 'Reapply custom highlights on colorscheme change',
    group = vim.api.nvim_create_augroup('ellisra.apply_highlights', { clear = true }),
    callback = function(event)
        vim.schedule(function()
            utils.set_highlights(event.match)
        end)
    end,
})

vim.api.nvim_create_autocmd('OptionSet', {
    desc = 'Set colorscheme depending on terminal bg',
    group = vim.api.nvim_create_augroup('ellisra.sync_term_bg', { clear = true }),
    pattern = 'background',
    callback = function()
        if vim.o.background == 'light' then
            vim.cmd.colorscheme(vim.g.light_default)
        else
            vim.cmd.colorscheme(vim.g.dark_default)
        end
    end,
})
