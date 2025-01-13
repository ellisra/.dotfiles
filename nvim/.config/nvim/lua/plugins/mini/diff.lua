return {
    require("mini.diff").setup({
        view = {
            style = "sign",
            signs = { add = "│", change = "│", delete = "_" },
            priority = 199,
        },
    }),
}
