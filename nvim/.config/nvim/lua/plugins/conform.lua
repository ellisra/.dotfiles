return {
    'stevearc/conform.nvim',

    enabled = true,
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
