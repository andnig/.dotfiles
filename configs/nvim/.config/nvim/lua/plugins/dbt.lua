return {
    {
        "PedramNavid/dbtpal",
        ft = { "sql", "yml", "md" },
        config = function()
            local dbt = require("dbtpal")
            dbt.setup({
                -- Path to the dbt executable
                path_to_dbt = "dbt",

                -- Path to the dbt project, if blank, will auto-detect
                -- using currently open buffer for all sql,yml, and md files
                path_to_dbt_project = "",

                -- Path to dbt profiles directory
                path_to_dbt_profiles_dir = vim.fn.expand("~/.dbt"),

                -- Search for ref/source files in macros and models folders
                extended_path_search = true,

                -- Prevent modifying sql files in target/(compiled|run) folders
                protect_compiled_files = true,
            })

            -- Setup key mappings

            vim.keymap.set("n", "<leader>dr", dbt.run, { desc = "Run dbt run on the current file" })
            vim.keymap.set("n", "<leader>dp", dbt.run_all, { desc = "Run dbt run on the project" })
            vim.keymap.set(
                "n",
                "<leader>dt",
                dbt.test,
                { desc = "Run dbt test on the current file" }
            )
            vim.keymap.set(
                "n",
                "<leader>dm",
                require("dbtpal.telescope").dbt_picker,
                { desc = "Pick dbt model to run" }
            )

            -- Enable Telescope Extension
            require("telescope").load_extension("dbtpal")
        end,
        dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-telescope/telescope.nvim" } },
    },
}
