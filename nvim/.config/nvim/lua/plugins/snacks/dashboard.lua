return {
    enabled = true,

    width = 60,

    preset = {
        ---@type snacks.dashboard.Item[]
        keys = {
            {
                icon = " ",
                key = "f",
                desc = "Find File",
                action = ":lua Snacks.dashboard.pick('files')",
            },
            {
                icon = " ",
                key = "g",
                desc = "Grep Text",
                action = ":lua Snacks.dashboard.pick('live_grep')",
            },
            {
                icon = " ",
                key = "r",
                desc = "Recent Files",
                action = ":lua Snacks.dashboard.pick('oldfiles')",
            },
            {
                icon = " ",
                key = "n",
                desc = "Neovim Config",
                action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})",
            },
            {
                icon = "󰒲 ",
                key = "l",
                desc = "Lazy",
                action = ":Lazy",
                enabled = package.loaded.lazy ~= nil,
            },
            { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
        header = [[
                                                                    
      ████ ██████           █████      ██                     
     ███████████             █████                             
     █████████ ███████████████████ ███   ███████████   
    █████████  ███    █████████████ █████ ██████████████   
   █████████ ██████████ █████████ █████ █████ ████ █████   
 ███████████ ███    ███ █████████ █████ █████ ████ █████  
██████  █████████████████████ ████ █████ █████ ████ ██████ 
	                                                                       ]],
    },

    sections = {
        { section = "header", hl = "SnacksDashboardKey" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup", pane = 2, padding = 1 },
        {
            pane = 2,
            section = "terminal",
            cmd = "onefetch --include-hidden --nerd-fonts -d url --no-art --true-color never --text-colors 4 4 4 4 7 7",
            height = 30,
            indent = 8,
            align = "center",
        },
    },
}
