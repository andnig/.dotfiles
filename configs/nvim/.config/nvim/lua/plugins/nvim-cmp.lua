return {

    -- nvim-cmp configuration so to not preselect completion and require tab to select
    {
        "hrsh7th/nvim-cmp",
        enabled = false,
        dependencies = {
            "hrsh7th/cmp-emoji",
            opts = nil,
            "abecodes/tabout.nvim",
            "vim-dadbod-completion",
        },
        ---@param opts cmp.ConfigSchema
        opts = function(_, opts)
            local has_words_before = function()
                unpack = unpack or table.unpack
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0
                    and vim.api
                            .nvim_buf_get_lines(0, line - 1, line, true)[1]
                            :sub(col, col)
                            :match("%s")
                        == nil
            end

            local cmp = require("cmp")

            opts.mapping = vim.tbl_extend("force", opts.mapping, {
                ["<CR>"] = vim.NIL,

                ["<Tab>"] = cmp.mapping(function(fallback)
                    if require("copilot.suggestion").is_visible() then
                        require("copilot.suggestion").accept()
                    elseif cmp.visible() then
                        cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { "i", "s" }),
            })
            opts.preselect = cmp.PreselectMode.None
            opts.sources = cmp.config.sources(
                vim.list_extend(
                    opts.sources,
                    { { name = "emoji" }, { name = "vim-dadbod-completion" } }
                )
            )
        end,
    },
}
