return {
    {
        "nvim-lspconfig",
        opts = {
            inlay_hints = { enabled = false },
        },
    },
    { "nvim-neotest/nvim-nio" }, -- required for nvim dap
    {
        "neovim/nvim-lspconfig",
        opts = {
            ---@type lspconfig.options
            servers = {
                prismals = {},
            },
        },
    },
}
