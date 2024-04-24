return {
    -- custom config which piggybacks on the copilot extras in lazy.lua.
    {
        "zbirenbaum/copilot.lua",
        cmd = "Copilot",
        build = ":Copilot auth",
        event = "InsertEnter",
        config = function()
            require("copilot").setup({
                panel = {
                    enabled = true,
                    auto_refresh = true,
                },
                suggestion = {
                    enabled = true,
                    auto_trigger = true,
                    accept = false, -- disable built-in keymapping
                },
                filetypes = {
                    markdown = true,
                    yaml = true,
                },
            })

            -- hide copilot suggestions when cmp menu is open
            -- to prevent odd behavior/garbled up suggestions
            local cmp_status_ok, cmp = pcall(require, "cmp")
            if cmp_status_ok then
                cmp.event:on("menu_opened", function()
                    vim.b.copilot_suggestion_hidden = true
                end)

                cmp.event:on("menu_closed", function()
                    vim.b.copilot_suggestion_hidden = false
                end)
            end
        end,
    },

    -- copilot status in lualine
    -- this is taken from the copilot lazyvim extras at:
    -- https://www.lazyvim.org/plugins/extras/coding.copilot
    {
        "nvim-lualine/lualine.nvim",
        optional = true,
        event = "VeryLazy",
        opts = function(_, opts)
            local Util = require("lazyvim.util")
            local colors = {
                [""] = Util.ui.fg("Special"),
                ["Normal"] = Util.ui.fg("Special"),
                ["Warning"] = Util.ui.fg("DiagnosticError"),
                ["InProgress"] = Util.ui.fg("DiagnosticWarn"),
            }
            table.insert(opts.sections.lualine_x, 2, {
                function()
                    local icon = require("lazyvim.config").icons.kinds.Copilot
                    local status = require("copilot.api").status.data
                    return icon .. (status.message or "")
                end,
                cond = function()
                    local ok, clients =
                        pcall(vim.lsp.get_active_clients, { name = "copilot", bufnr = 0 })
                    return ok and #clients > 0
                end,
                color = function()
                    if not package.loaded["copilot"] then
                        return
                    end
                    local status = require("copilot.api").status.data
                    return colors[status.status] or colors[""]
                end,
            })
        end,
    },
    -- https://github.com/jackMort/ChatGPT.nvim
    {
        "jackMort/ChatGPT.nvim",
        dependencies = {
            { "MunifTanjim/nui.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope.nvim" },
        },
        -- event = "VeryLazy",
        config = function()
            local home = vim.fn.expand("$HOME")
            require("chatgpt").setup({
                api_key_cmd = "cat " .. home .. "/.secrets/openai.secret",
                openai_params = {
                    model = "gpt-4-turbo",
                },
                edit_with_instructions = {
                    keymaps = {
                        accept = "<leader>aa",
                        use_output_as_input = "<leader>ao",
                    },
                },
                chat = {
                    keymaps = {
                        yank_last = "<leader>ay",
                        yank_last_code = "<leader>ak",
                        toggle_sessions = "<leader>as",
                    },
                },
                openai_edit_params = {
                    model = "gpt-4-turbo",
                    temperature = 0,
                    top_p = 1,
                    n = 1,
                },
            })
        end,
    },
}
