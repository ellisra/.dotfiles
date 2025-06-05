---@type LazySpec
return {
    "stevearc/conform.nvim",

    enabled = true,
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {},
    opts = {
        notify_on_error = false,
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            lua = { "stylua" },
            python = {
                "ruff_fix",
                "ruff_format",
                "ruff_organize_imports",
            },
            go = { "goimports", "gofmt" },
        },
    },
}
