return {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("neorg").setup({
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.itero"] = {},
                ["core.promo"] = {},
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.summary"] = {}, -- Adds the generate-workspace-summary command
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp",
                    },
                },
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = "~/.notes",
                        },
                        default_workspace = "notes",
                    },
                },
            },
        })
    end,
}
