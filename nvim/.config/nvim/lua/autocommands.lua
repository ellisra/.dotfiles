local utils = require('utils')

local autocmd = vim.api.nvim_create_autocmd
local augroup = function(name) vim.api.nvim_create_augroup(name, { clear = true }) end

autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = augroup('ellisra.highlight_yank'),
    callback = function()
        vim.hl.on_yank()
    end,
})

autocmd('VimResized', {
    desc = 'Resize splits if terminal resized',
    group = augroup('ellisra.resize_windows'),
    command = 'wincmd =',
})

autocmd('BufReadPost', {
    desc = 'Place cursor at last position on buffer entry',
    group = augroup('ellisra.auto_last_position'),
    callback = function(args)
        local position = vim.api.nvim_buf_get_mark(args.buf, '"')
        local winid = vim.fn.bufwinid(args.buf)
        pcall(vim.api.nvim_win_set_cursor, winid, position)
    end,
})

autocmd('ColorScheme', {
    desc = 'Reapply custom highlights on colorscheme change',
    group = augroup('ellisra.apply_highlights'),
    callback = function(event)
        vim.schedule(function()
            utils.set_highlights(event.match)
        end)
    end,
})

autocmd('OptionSet', {
    desc = 'Set colorscheme depending on terminal bg',
    group = augroup('ellisra.sync_term_bg'),
    pattern = 'background',
    callback = function()
        if vim.o.background == 'light' then
            vim.cmd.colorscheme(vim.g.light_default)
        else
            vim.cmd.colorscheme(vim.g.dark_default)
        end
    end,
})

autocmd('FileType', {
    desc = 'Disable auto comment on newline',
    group = augroup('ellisra.disable_auto_comment'),
    callback = function()
        vim.opt.formatoptions:remove({ 'c', 'r', 'o' })
    end,
})

autocmd('FileType', {
    desc = 'Set 2-space indent for heavily nested filetypes',
    group = augroup('ellisra.indent_2_spaces'),
    pattern = { 'yaml', 'json', 'jsonc' },
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.tabstop = 2
    end
})

autocmd('TermOpen', {
    desc = 'Start terminal in insert mode',
    group = augroup('ellisra.terminal_insert'),
    callback = function()
        vim.defer_fn(function()
            if vim.bo.filetype == 'dap-view-term' then
                return
            elseif vim.bo.buftype == 'terminal' then
                vim.cmd.startinsert()
            end
        end, 1)
    end,
})
