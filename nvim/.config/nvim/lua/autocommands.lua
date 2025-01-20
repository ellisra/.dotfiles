vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd(
    "VimResized",
    { desc = "Resize splits if terminal resized", command = "wincmd =" }
)

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI", "WinScrolled" }, {
    desc = "Enable scrolloff when at end of file",
    group = vim.api.nvim_create_augroup("ScrollEOF", { clear = true }),
    callback = function()
        -- Ignore floating windows
        if vim.api.nvim_win_get_config(0).relative ~= "" then
            return
        end

        local win_height = vim.fn.winheight(0)
        local scrolloff = math.min(vim.o.scrolloff, math.floor(win_height / 2))
        local visual_distance_to_eof = win_height - vim.fn.winline()

        if visual_distance_to_eof < scrolloff then
            local win_view = vim.fn.winsaveview()
            vim.fn.winrestview({
                topline = win_view.topline + scrolloff - visual_distance_to_eof,
            })
        end
    end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    desc = "Place curseor at last position on buffer entry",
    group = vim.api.nvim_create_augroup("AutoLastPosition", { clear = true }),
    callback = function(args)
        local position = vim.api.nvim_buf_get_mark(args.buf, [["]])
        local winid = vim.fn.bufwinid(args.buf)
        pcall(vim.api.nvim_win_set_cursor, winid, position)
    end,
})

-- Turn on spell checking for markdown files
vim.cmd("autocmd FileType markdown setlocal spell")
