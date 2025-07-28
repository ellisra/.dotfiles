---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    root_markers = { "pyproject.toml", "requirements.txt", ".git" },
    filetypes = { "python" },
    settings = {
        basedpyright = {
            disableOrganizeImports = true,
            analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    useLibraryCodeForTypes = true,
                    reportUnknownParameterType = true,
                    reportImportCycles = "warning",
                    reportDuplicateImport = "warning",
                    reportConstantRedefinition = "error",
                    reportUnnecessaryTypeIgnoreComment = "warning",
                    reportUnusedClass = "warning",
                    reportUnusedFunction = "warning",
                    reportUnusedVariable = "warning",
                    reportUnusedExpression = "warning",
                    reportAttributeAccessIssue = "none",
                },
            },
        },
    },
}
