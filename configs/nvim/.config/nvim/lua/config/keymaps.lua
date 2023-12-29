-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste but do not override yank register" })
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })
vim.keymap.set("n", "<leader>p", [["+p]], { desc = "[p]aste from system clipboard" })
vim.keymap.set("n", "<leader>P", [["+P]], { desc = "[P]aste from system clipboard" })

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete into void" })

vim.keymap.set(
    "n",
    "<leader>fx",
    "<cmd>!chmod +x %<CR>",
    { silent = true, desc = "Chmod +x this file" }
)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz", { desc = "Next quickfix" })
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz", { desc = "Previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "Next location" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "Previous location" })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line down" })

vim.api.nvim_set_keymap(
    "n",
    "<leader>bn",
    "<cmd>lua require('methods').create_buffer_with_name()<CR>",
    { noremap = true, silent = true, desc = "Create buffer with name" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>nr",
    "<cmd>lua require('methods').create_new_note('russmedia')<CR>",
    { noremap = true, silent = true, desc = "Create new Russmedia note" }
)

vim.api.nvim_set_keymap(
    "n",
    "<leader>ng",
    "<cmd>lua require('methods').create_new_note('general')<CR>",
    { noremap = true, silent = true, desc = "Create new General note" }
)
