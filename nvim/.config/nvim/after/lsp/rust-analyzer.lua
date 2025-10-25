---@type vim.lsp.Config
return {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    filetypes = { 'rust' },
    settings = {
        autoformat = true,
        cargo = { allFeatures = true },
        checkOnSave = { command = 'clippy' },
    },
}
