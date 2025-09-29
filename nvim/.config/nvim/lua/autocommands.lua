vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight yanked text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.hl.on_yank()
    end,
})

vim.api.nvim_create_autocmd('VimResized', {
    desc = 'Resize splits if terminal resized',
    command = 'wincmd =',
})

vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Place curseor at last position on buffer entry',
    group = vim.api.nvim_create_augroup('AutoLastPosition', { clear = true }),
    callback = function(args)
        local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
        local winid = vim.fn.bufwinid(args.buf)
        pcall(vim.api.nvim_win_set_cursor, winid, position)
    end,
})

vim.api.nvim_create_autocmd('ColorScheme', {
    callback = function(event)
        require('utils').set_highlights(event.match)
    end,

    desc = 'Reapply custom highlights on colorscheme change',
})

-- vim.api.nvim_create_autocmd('CompleteDone', {
--     callback = function()
--         local completed = vim.v.completed_item
--         if completed.kind == 'Function' or completed.kind == 'Method' then
--             local col = vim.fn.col('.')
--             local line = vim.fn.getline('.')
--             if line:sub(col, col) ~= '(' then
--                 vim.api.nvim_put({ '()' }, 'c', true, true)
--                 vim.api.nvim_feedkeys(
--                     vim.api.nvim_replace_termcodes('<Left>', true, false, true),
--                     'n',
--                     false
--                 )
--             end
--         end
--     end,
--     desc = 'Add parentheses when completing a function or method (if not already present)',
-- })
