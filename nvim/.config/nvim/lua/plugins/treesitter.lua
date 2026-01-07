local patterns = {
    'bash',
    'c',
    'cpp',
    'css',
    'c_sharp',
    'diff',
    'go',
    'html',
    'java',
    'json',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'regex',
    'vim',
    'vimdoc',
    'rust',
    'toml',
    'python',
    'yaml',
    'javascript',
    'typescript',
}

require('nvim-treesitter').install(patterns)

vim.api.nvim_create_autocmd('FileType', {
    pattern = patterns,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.api.nvim_create_autocmd('User', {
    pattern = 'PackChanged',
    callback = function(event)
        local name, kind = event.data.spec.name, event.data.kind

        if name == 'nvim-treesitter' and (kind == 'install' or kind == 'update') then
            if not event.data.active then
                vim.cmd.packadd('nvim-treesitter')
            end
            vim.cmd('TSUpdate')
        end
    end,
    desc = 'Run TSupdate after nvim-treesitter updates',
})
