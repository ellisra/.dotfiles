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
}
