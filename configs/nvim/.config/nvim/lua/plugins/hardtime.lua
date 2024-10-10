return {
    {
        "m4xshen/hardtime.nvim",
        event = "VeryLazy",
        dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
        keys = {
            { "j", 'v:count || mode(1)[0:1] == "no" ? "j" : "gj"' },
            { "k", 'v:count || mode(1)[0:1] == "no" ? "k" : "gk"' },
        },
        opts = {
            max_count = 5,
            disabled_filetypes = {
                "avante",
                "NvimTree",
                "TelescopePrompt",
                "aerial",
                "alpha",
                "checkhealth",
                "dapui*",
                "Diffview*",
                "Dressing*",
                "help",
                "httpResult",
                "lazy",
                "lspinfo",
                "Neogit*",
                "mason",
                "neotest%-summary",
                "minifiles",
                "neo%-tree*",
                "netrw",
                "noice",
                "notify",
                "prompt",
                "qf",
                "query",
                "oil",
                "undotree",
                "trouble",
                "Trouble",
                "fugitive",
            },
            -- disable_mouse = false,
        },
    },
}
