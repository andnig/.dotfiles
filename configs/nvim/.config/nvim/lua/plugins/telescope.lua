return {
    "nvim-telescope/telescope.nvim",
    keys = {
      -- add a keymap to browse plugin files
      -- stylua: ignore
      {
        "<leader>fp",
        function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        desc = "Find Plugin File",
      },
    },
    -- change some options
    opts = {
        defaults = {
            file_ignore_patterns = {
                "node_modules",
                ".next",
                ".git",
                ".cache",
                ".idea",
                ".vscode",
                ".DS_Store",
                ".github",
            },
        },
    },
}