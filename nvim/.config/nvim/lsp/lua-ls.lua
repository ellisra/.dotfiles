---@type vim.lsp.Config
return {
    cmd = { "lua-language-server" },
    root_markers = { ".luarc.json" },
    filetypes = { "lua" },
    settings = {
        Lua = {
            telemetry = { enable = false },
            completion = { callSnippet = "Replace" },
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = {
                    "$VIMRUNTIME",
                    "$XDG_DATA_HOME/nvim/lazy",
                    "${3rd}/luv/library",
                },
            },
        },
    },
}
