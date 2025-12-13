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
                    reportUnknownParameterType = 'none',
                    reportImportCycles = 'warning',
                    reportDuplicateImport = 'warning',
                    reportConstantRedefinition = 'warning',
                    reportUnnecessaryTypeIgnoreComment = 'warning',
                    reportUnusedClass = 'info',
                    reportUnusedFunction = 'info',
                    reportUnusedVariable = 'info',
                    reportUnusedExpression = 'info',
                    reportAttributeAccessIssue = 'none',
                },
            },
        },
    },
}
