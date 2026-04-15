---@type vim.lsp.Config
return {
    cmd = { 'pyrefly', 'lsp' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml', 'uv.lock', 'requirements.txt', '.git' },
    init_options = {
        pyrefly = {
            displayTypeErrors = 'force-on',
            analysis = {
                showHoverGoToLinks = false,
            },
        }
    },
    handlers = {
        -- TODO: Remove this when pyreflye properly supports ignoring diagnostics
        ['textDocument/publishDiagnostics'] = function (err, result, ctx, config)
            if result and result.diagnostics then
                result.diagnostics = vim.tbl_filter(function (diag)
                    return diag.code ~= 'missing-attribute'
                end, result.diagnostics)
            end
            vim.lsp.diagnostic.on_publish_diagnostics(err, result, ctx)
        end
    },
}
