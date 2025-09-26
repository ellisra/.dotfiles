---@type vim.lsp.Config
return {
    cmd = { 'lua-language-server' },
    root_markers = { '.luarc.json' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            telemetry = { enable = false },
            completion = { callSnippet = 'Replace' },
            runtime = {
                version = 'LuaJIT',
                path = { 'lua/?.lua', 'lua/?/init.lua' },
            },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    '$XDG_DATA_HOME/nvim/lazy',
                    '${3rd}/luv/library',
                },
            },
        },
    },
}
