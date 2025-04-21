---@type LazySpec
return {
    "L3MON4D3/LuaSnip",

    event = "LspAttach",
    build = (function()
        if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
            return
        end
        return "make install_jsregexp"
    end)(),

    dependencies = { "rafamadriz/friendly-snippets" },

    config = function()
        require("luasnip.loaders.from_vscode").lazy_load()

        vim.keymap.set("n", "'", function()
            require("luasnip").jump(1)
        end, { silent = true })
    end,
}
