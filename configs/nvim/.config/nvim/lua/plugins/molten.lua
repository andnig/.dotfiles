return {
    {
        "benlubas/molten-nvim",
        version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
        build = ":UpdateRemotePlugins",
        dependencies = { "3rd/image.nvim" },
        init = function()
            -- this is an example, not a default. Please see the readme for more configuration options
            vim.g.molten_image_provider = "image.nvim"
            vim.keymap.set("n", "<localleader>ci", ":MoltenInit<CR>")
            vim.keymap.set("n", "<localleader>ce", ":MoltenEvaluateOperator<CR>")
            vim.keymap.set("n", "<localleader>cr", ":MoltenReevaluateCell<CR>")
            vim.keymap.set("v", "<localleader>cv", ":<C-u>MoltenEvaluateVisual<CR>gv")
            vim.keymap.set("n", "<localleader>co", ":noautocmd MoltenEnterOutput<CR>")
            vim.keymap.set("n", "<localleader>ch", ":MoltenHideOutput<CR>")
            vim.keymap.set("n", "<localleader>cd", ":MoltenDelete<CR>")
        end,
    },
}
