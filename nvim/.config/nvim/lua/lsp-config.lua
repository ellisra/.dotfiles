return {
    vim.lsp.enable({
        'basedpyright',
        'clangd',
        'gopls',
        'lua-ls',
        'markdown-oxide',
        'ols',
        'roslyn-ls',
        'rust-analyzer',
        'vtsls',
    }),

    vim.diagnostic.config({
        signs = {
            priority = 200,
            text = {
                [vim.diagnostic.severity.ERROR] = '',
                [vim.diagnostic.severity.WARN] = '',
                [vim.diagnostic.severity.INFO] = '',
                [vim.diagnostic.severity.HINT] = '',
            },
        },
    }),
}
