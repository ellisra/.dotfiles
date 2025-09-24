local function truncate_items(items, _)
    local max_len = 30
    for _, item in ipairs(items) do
        if item.label and #item.label > max_len then
            item.label = item.label:sub(1, max_len) .. "…"
        end
        if item.labelDetails and item.labelDetails.detail then
            item.labelDetails.detail = nil
        end
        item.detail = nil
    end

    return items
end

local map_multistep = require("mini.keymap").map_multistep
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
    require("mini.completion").setup({
        delay = { completion = 0 },
        fallback_action = "",
        lsp_completion = { process_items = truncate_items },
    }),

    map_multistep("i", "<Tab>", { smart_accept }),
    map_multistep("i", "<C-Enter>", { smart_accept }),
}
