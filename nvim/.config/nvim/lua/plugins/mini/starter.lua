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
                    result = lines[1] .. ":\n" .. lines[2] .. "\n- " .. lines[3]
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
