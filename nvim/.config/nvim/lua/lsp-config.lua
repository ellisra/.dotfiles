return {
    vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp-attach', { clear = true }),
        callback = function(event)
            vim.keymap.set('n', 'K', function()
                vim.lsp.buf.hover({ border = 'single' })
            end, { buffer = event.buf })
        end,
    }),

    vim.lsp.enable({
        'basedpyright',
        'clangd',
        'gopls',
        'lua-ls',
        'markdown-oxide',
        'roslyn-ls',
        'rust-analyzer',
        'vtsls',
    }),

    vim.diagnostic.config({
        virtual_lines = {
            current_line = true,
        },

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
