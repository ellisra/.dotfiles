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
