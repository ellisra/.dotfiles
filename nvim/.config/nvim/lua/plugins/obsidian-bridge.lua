return {
    "oflisback/obsidian-bridge.nvim",

    lazy = true,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },

    cmd = {
        "ObsidianBridgeOn",
        "ObsidianBridgeOff",
    },

    config = function()
        require("obsidian-bridge").setup({})
        vim.cmd("ObsidianBridgeOff")
    end,

    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
}
