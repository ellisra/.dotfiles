local MiniStarter = require("mini.starter")
local custom_items = {
    { name = "files", action = ":FzfLua files", section = "Pickers" },
    {
        name = "neovim config",
        action = function()
            require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
        end,
        section = "Pickers",
    },
    MiniStarter.sections.recent_files(9, false, false),
    MiniStarter.sections.builtin_actions(),
}

return {
    MiniStarter.setup({
        header = function()
            local hour = tonumber(vim.fn.strftime("%H"))
            local part_id = math.floor((hour + 4) / 8) + 1
            local day_part = ({ "evening", "morning", "afternoon", "evening" })[part_id]

            return ("Good %s, Rob"):format(day_part)
        end,

        items = custom_items,

        footer = function()
            local function wrap_text(text, max_width)
                local lines = {}
                local current_line = ""

                for word in text:gmatch("%S+") do
                    if #current_line == 0 then
                        current_line = word
                    elseif #current_line + #word + 1 <= max_width then
                        current_line = current_line .. " " .. word
                    else
                        table.insert(lines, current_line)
                        current_line = word
                    end
                end

                if #current_line > 0 then
                    table.insert(lines, current_line)
                end

                return table.concat(lines, "\n")
            end

            local handle = io.popen(
                "wget -q http://www.brainyquote.com/link/quotebr.js -O - | grep -o -E \"[A-Z][^<]*\" | head -3"
            )
            local result = ""

            if handle ~= nil then
                local output = handle:read("*a")
                handle:close()

                local lines = {}
                for line in output:gmatch("[^\r\n]+") do
                    if line:match("%S") then
                        table.insert(lines, line:match("^%s*(.-)%s*$"))
                    end
                end

                if #lines >= 3 then
                    local wrapped_quote = wrap_text(lines[2], 50)
                    result = lines[1]
                        .. ":\n"
                        .. wrapped_quote
                        .. "\n- "
                        .. lines[3]
                else
                    result = output
                end
            end

            return result
        end,

        content_hooks = {
            MiniStarter.gen_hook.adding_bullet(),
            MiniStarter.gen_hook.indexing(
                "all",
                { "Builtin actions", "Pickers" }
            ),
            MiniStarter.gen_hook.aligning("center", "center"),
        },
    }),
}
