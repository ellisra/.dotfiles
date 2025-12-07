---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            telemetry = { enable = false },
            runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
            workspace = {
                checkThirdParty = false,
                library = { vim.env.VIMRUNTIME, '${3rd}/luv/library' },
            },
        },
    },
}
