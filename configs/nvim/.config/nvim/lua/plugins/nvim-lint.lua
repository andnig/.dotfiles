return {
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                sql = { "sqlfluff" },
                dbt = { "sqlfluff" },
            },
            linters = {
                sqlfluff = {
                    args = {
                        "lint",
                        "--format=json",
                        "--dialect=bigquery",
                        "--templater=dbt",
                    },
                },
            },
        },
    },
}
