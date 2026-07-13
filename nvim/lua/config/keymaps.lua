-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result + center" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result + center" })
vim.keymap.set("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "Clear search highlight" })
vim.keymap.set("n", "dia", vim.diagnostic.open_float, { desc = "Diagnostic float" })

-- Visual indent (keep selection)
vim.keymap.set("v", "<", "<gv", { desc = "Indent left + reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right + reselect" })
vim.keymap.set({ "n", "t" }, "<C-;>", function()
  Snacks.terminal()
end, { desc = "Toggle Snacks terminal" })
