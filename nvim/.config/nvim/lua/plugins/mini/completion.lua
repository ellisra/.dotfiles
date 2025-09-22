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

return {
    require("mini.completion").setup({
        delay = { completion = 0 },
        fallback_action = "",
        lsp_completion = { process_items = truncate_items },
    }),
}
