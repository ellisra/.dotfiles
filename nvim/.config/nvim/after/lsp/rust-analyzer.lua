---@type vim.lsp.Config
return {
    cmd = { 'rust-analyzer' },
    root_markers = { 'Cargo.toml' },
    filetypes = { 'rust' },
    settings = {
        ['rust-analyzer'] = {
            completion = { callable = { snippets = 'add_parentheses' } }
        }
    },
}
