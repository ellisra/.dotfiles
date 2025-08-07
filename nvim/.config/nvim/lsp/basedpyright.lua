---@type vim.lsp.Config
return {
    cmd = { "basedpyright-langserver", "--stdio" },
    root_markers = {
        "pyproject.toml",
        "pyrightconfig.json",
        "requirements.txt",
        ".git",
    },
    filetypes = { "python" },
    settings = {
        basedpyright = {
            disableOrganizeImports = false,
            analysis = {
                typeCheckingMode = "standard",
                diagnosticSeverityOverrides = {
                    useLibraryCodeForTypes = true,
                    reportUnknownParameterType = false,
                    reportImportCycles = "warning",
                    reportDuplicateImport = "warning",
                    reportConstantRedefinition = "none",
                    reportUnnecessaryTypeIgnoreComment = "warning",
                    reportUnusedClass = "info",
                    reportUnusedFunction = "info",
                    reportUnusedVariable = "info",
                    reportUnusedExpression = "info",
                    reportAttributeAccessIssue = "none",
                    reportArgumentType = false,
                },
            },
        },
    },
}
