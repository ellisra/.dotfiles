return {
    "e-ink-colorscheme/e-ink.nvim",

    lazy = false,
    priority = 1000,

    config = function()
        require("e-ink").setup()
        vim.cmd.colorscheme("e-ink")

        local utils = require("utils")
        local mono = require("e-ink.palette").mono()
        local ever = require("e-ink.palette").everforest()

        utils.set_hl("StatusLine", { bg = mono[2], fg = mono[12] })
        utils.set_hl("StatusLineAccent", { bg = mono[12], fg = mono[2] })
        utils.set_hl(
            "StatuslineInsertAccent",
            { bg = ever.green, fg = mono[2] }
        )
        utils.set_hl("StatuslineVisualAccent", { bg = ever.red, fg = mono[2] })
        utils.set_hl(
            "StatuslineReplaceAccent",
            { bg = ever.yellow, fg = mono[2] }
        )
        utils.set_hl(
            "StatuslineCmdLineAccent",
            { bg = ever.blue, fg = mono[2] }
        )
        utils.set_hl(
            "StatuslineTerminalAccent",
            { bg = ever.magenta, fg = mono[2] }
        )

        utils.set_hl("LspDiagnosticsSignError", { fg = ever.red })
        utils.set_hl("LspDiagnosticsSignWarning", { fg = ever.yellow })
        utils.set_hl("LspDiagnosticsSignHint", { fg = ever.blue })
        utils.set_hl("LspDiagnosticsSignInformation", { fg = ever.cyan })
    end,
}
