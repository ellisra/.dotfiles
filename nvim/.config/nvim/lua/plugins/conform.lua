return {
    'stevearc/conform.nvim',

    enabled = false,
    ft = 'lua',
    opts = {
        format_on_save = {
            lsp_fallback = true,
            timeout = 500,
        },
        formatters_by_ft = {
            lua = { 'stylua' },
        },
    },
}
