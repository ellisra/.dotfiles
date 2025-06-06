vim.api.nvim_create_user_command("W", "w", {})

vim.api.nvim_create_user_command("AddFootnote", function(opts)
    local footnote_num = opts.args

    vim.api.nvim_put({ "[^" .. footnote_num .. "]" }, "c", true, true)

    vim.cmd("normal! G")
    vim.cmd("normal! o")
    vim.api.nvim_put({ "[^" .. footnote_num .. "]: " }, "c", false, true)
    vim.cmd("stopinsert")
end, { nargs = 1 })
