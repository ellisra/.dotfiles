local FzfLua = require("fzf-lua")

local function get_footnotes()
    local bufnr = vim.api.nvim_get_current_buf()
    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local footnotes = {}

    for line_num, line in ipairs(lines) do
        for footnote in line:gmatch("%[%^([^%]]+)%]") do
            local is_definition = line:match("^%s*%[%^" .. footnote .. "%]:")

            if line:match("^%s*%[%^" .. footnote .. "%]:") then
                table.insert(footnotes, {
                    text = footnote,
                    line = line_num,
                    col = line:find("%[%^" .. footnote .. "%]"),
                    full_line = line,
                    type = is_definition and "definition" or "reference",
                })
            end
        end
    end

    return footnotes
end

local function format_footnote(footnote)
    -- local type_indicator = footnote.type == "definition" and "[DEF]" or "[REF]"

    return string.format(
        "%s:%d - %s",
        -- type_indicator,
        footnote.text,
        footnote.line,
        footnote.full_line:gsub("^%s*", "")
    )
end

local function footnotes_picker()
    local footnotes = get_footnotes()

    if #footnotes == 0 then
        vim.notify(
            "No footnotes found in current buffer",
            vim.log.levels.INFO,
            {}
        )

        return
    end

    local entries = {}
    for _, footnote in ipairs(footnotes) do
        table.insert(entries, format_footnote(footnote))
    end

    FzfLua.fzf_exec(entries, {
        prompt = "Footnotes> ",
        actions = {
            ["default"] = function(selected)
                if not selected or #selected == 0 then
                    return
                end

                local line_num = selected[1]:match(":(%d+)")
                if line_num then
                    vim.api.nvim_win_set_cursor(0, { tonumber(line_num), 0 })
                    vim.cmd("normal! zz")
                end
            end,
        },

        fzf_opts = {
            ["--delimiter"] = ":",
            ["--with-nth"] = "1,3..",
            ["--preview"] = "echo {3..}",
        },
    })
end

vim.api.nvim_create_user_command("FootnotesPicker", footnotes_picker, {})

vim.keymap.set(
    "n",
    "<leader>fn",
    footnotes_picker,
    { desc = "Pick [F]oot[N]otes" }
)

return footnotes_picker
