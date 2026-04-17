return {
    vim.lsp.enable({
        'pyrefly',
        'clangd',
        'gopls',
        'lua-ls',
        'markdown-oxide',
        'ols',
        'rust-analyzer',
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
