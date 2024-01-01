-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_augroup("venv_selector", { clear = true })

-- automatically load the cached virtual environment
vim.api.nvim_create_autocmd("VimEnter", {
    group = "venv_selector",
    pattern = "*",
    once = true,
    callback = function()
        require("venv-selector").retrieve_from_cache()
    end,
})

-- automatically disable command continuation for norg files (as they have their own)
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = "*.norg",
    command = "setlocal fo-=ro",
})
