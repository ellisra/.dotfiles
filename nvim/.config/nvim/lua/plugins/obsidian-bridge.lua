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

        vim.keymap.set(
            "n",
            "<leader>tb",
            "<cmd>ObsidianBridgeToggle<CR>",
            { desc = "[T]oggle Obsidian [B]ridge" }
        )
    end,

    event = {
        "BufReadPre *.md",
        "BufNewFile *.md",
    },
}
