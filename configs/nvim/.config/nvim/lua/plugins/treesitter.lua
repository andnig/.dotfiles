return {
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            highlight = {
                enable = true,
                disable = { "dbt", "sql" },
            },
            ensure_installed = {
                "bash",
                "csv",
                "html",
                "javascript",
                "json",
                "lua",
                "markdown",
                "markdown_inline",
                "prisma",
                "python",
                "query",
                "regex",
                "sql",
                "tsx",
                "typescript",
                "vim",
                "yaml",
            },
        },
    },
}
