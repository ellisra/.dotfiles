return {
    cmd = { "basedpyright-langserver", "--stdio" },
    root_markers = { "pyproject.toml" },
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
                },
            },
        },
    },
}
