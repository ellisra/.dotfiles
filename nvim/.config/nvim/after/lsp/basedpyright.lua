---@type vim.lsp.Config
return {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyproject.toml',
        'pyrightconfig.json',
        'requirements.txt',
        '.git',
    },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = 'standard',
                useLibraryCodeForTypes = true,
                diagnosticSeverityOverrides = {
                    reportImportCycles = 'warning',
                    reportDuplicateImport = 'warning',
                    reportConstantRedefinition = 'warning',
                    reportUnnecessaryTypeIgnoreComment = 'info',
                },
            },
        },
    },
}
