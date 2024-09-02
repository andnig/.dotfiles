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
            -- disable_mouse = false,
        },
    },
}