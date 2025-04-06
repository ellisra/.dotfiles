local function in_comment(marker)
    local comment_tbl = {
        python = "#",
        lua = "--",
    }

    return function(bufnr)
        -- Only render hipatterns inside comments, if comment syntax provided
        local comment = comment_tbl[vim.bo[bufnr].filetype]
        if comment == nil then
            return nil
        end

        return comment .. " ()" .. marker .. "()%f[%W]"
    end
end

return {
    require("mini.hipatterns").setup({
        highlighters = {
            fixme = {
                pattern = in_comment("FIXME"),
                group = "MiniHipatternsFixme",
            },
            hack = {
                pattern = in_comment("HACK"),
                group = "MiniHipatternsHack",
            },
            todo = {
                pattern = in_comment("TODO"),
                group = "MiniHipatternsTodo",
            },
            note = {
                pattern = in_comment("NOTE"),
                group = "MiniHipatternsNote",
            },

            hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
    }),
}
