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
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        -- {
        --     section = "terminal",
        --     cmd = "onefetch --include-hidden -d url",
        --     height = 22,
        --     width = 90,
        --     padding = 1,
        --     align = "center",
        -- },
        { section = "startup" },
    },
}
