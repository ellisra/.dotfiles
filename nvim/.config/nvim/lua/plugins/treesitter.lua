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
    'odin',
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
    desc = 'Start treesitter for filetype',
    group = vim.api.nvim_create_augroup('ellisra.treesitter_start', { clear = true }),
    pattern = patterns,
    callback = function()
        vim.treesitter.start()
        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    end,
})

vim.api.nvim_create_autocmd('PackChanged', {
    desc = 'Update parsers on nvim-treesitter update',
    group = vim.api.nvim_create_augroup('ellisra.treesitter_upate', { clear = true }),
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end,
})
