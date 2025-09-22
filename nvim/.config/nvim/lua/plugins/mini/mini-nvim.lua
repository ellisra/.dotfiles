local smart_accept = {
    condition = function()
        return vim.fn.pumvisible() == 1
    end,
    action = function()
        local info = vim.fn.complete_info()
        if info.selected ~= -1 then
            return "<C-y>"
        else
            return "<C-n><C-y>"
        end
    end,
}

return {
    "nvim-mini/mini.nvim",

    lazy = false,
    config = function()
        -- One-liners
        require("mini.ai").setup()
        require("mini.align").setup()
        require("mini.icons").setup()
        require("mini.splitjoin").setup()

        -- Configured Plugins
        require("plugins.mini.clue")
        require("plugins.mini.completion")
        require("plugins.mini.diff")
        require("plugins.mini.hipatterns")
        require("plugins.mini.indentscope")
        require("plugins.mini.pairs")
        require("plugins.mini.surround")

        -- Mics Functions
        require("mini.misc").setup_termbg_sync()

        -- Keymaps
        local map_multistep = require("mini.keymap").map_multistep

        map_multistep("i", "<Tab>", { smart_accept })
        map_multistep("i", "<C-Enter>", { smart_accept })
    end,
}
