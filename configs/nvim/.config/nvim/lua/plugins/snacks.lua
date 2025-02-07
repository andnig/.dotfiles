-- lazy.nvim
return {
    "folke/snacks.nvim",
    opts = {
        picker = {
            sources = {
                explorer = {
                    hidden = true,
                    ignored = true,
                },
            },
        },
    },
}
