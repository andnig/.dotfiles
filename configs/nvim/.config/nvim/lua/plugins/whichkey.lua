return {
    "folke/which-key.nvim",
    opts = {
        plugins = { spelling = true },
        defaults = {
            ["<leader>n"] = { name = "+notes" },
            ["<leader>i"] = { name = "+image" },
            ["<leader>m"] = { name = "+markdown" },
            ["<leader>a"] = { name = "+ai" },
            ["<localleader>c"] = { name = "+code" },
        },
    },
}
