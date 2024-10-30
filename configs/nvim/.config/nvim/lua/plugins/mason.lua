return {
    {

        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "debugpy",
                "mdx-analyzer",
                "js-debug-adapter",
                "biome",
                -- "sqlfluff",
            },
        },
    },
}
