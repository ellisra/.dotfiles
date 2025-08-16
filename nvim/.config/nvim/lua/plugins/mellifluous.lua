return {
    "ellisra/mellifluous.nvim",

    init = function()
        local utils = require("utils")

        utils.set_hl("@markup.heading.1", { bg = "NONE" })
        utils.set_hl("@markup.heading.2", { bg = "NONE" })
        utils.set_hl("@markup.heading.3", { bg = "NONE" })
        utils.set_hl("@markup.heading.4", { bg = "NONE" })
        utils.set_hl("@markup.heading.5", { bg = "NONE" })
        utils.set_hl("@markup.heading.6", { bg = "NONE" })

        utils.set_hl("StatusLine", { bg = "#242424", fg = "#aeaeae" })
        utils.set_hl("StatusLineAccent", { bg = "#aeaeae", fg = "#1a1a1a" })
        utils.set_hl(
            "StatuslineInsertAccent",
            { bg = "#a8a1be", fg = "#1a1a1a" }
        )
        utils.set_hl(
            "StatuslineVisualAccent",
            { bg = "#d59192", fg = "#1a1a1a" }
        )
        utils.set_hl(
            "StatuslineReplaceAccent",
            { bg = "#cbaa88", fg = "#1a1a1a" }
        )
        utils.set_hl(
            "StatuslineCmdLineAccent",
            { bg = "#938ca8", fg = "#1a1a1a" }
        )
        utils.set_hl(
            "StatuslineTerminalAccent",
            { bg = "#938ca8", fg = "#1a1a1a" }
        )
    end,
}
