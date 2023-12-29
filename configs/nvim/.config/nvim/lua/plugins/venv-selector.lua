return {
    {
        "linux-cultist/venv-selector.nvim",
        cmd = "VenvSelect",
        opts = function(_, opts)
            if require("lazyvim.util").has("nvim-dap-python") then
                opts.dap_enabled = true
            end
            return vim.tbl_deep_extend("force", opts, {
                name = {
                    ".venv",
                    ".env",
                },
                anaconda_base_path = os.getenv("CONDA_BASE_PREFIX"),
                anaconda_envs_path = os.getenv("CONDA_BASE_PREFIX") .. "/envs",
            })
        end,
        keys = {
            { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" },
            { "<leader>cc", "<cmd>:VenvSelectCached<cr>", desc = "Select Cached VirtualEnv" },
            { "<leader>cm", "<cmd>:VenvSelectCached<cr>", desc = "Select My VirtualEnv" },
        },
    },
}
