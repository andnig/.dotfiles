return {
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
