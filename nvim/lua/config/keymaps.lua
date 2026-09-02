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

-- Carried over from the youtuber base config (kunchenguid/dotfiles) ---------
-- Esc saves, merged with LazyVim's stock Esc (clear search highlight); the
-- save half only fires in real, named, modifiable file buffers.
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
  if vim.bo.buftype == "" and vim.bo.modifiable and vim.api.nvim_buf_get_name(0) ~= "" then
    vim.cmd("update")
  end
end, { desc = "Clear hlsearch + Save" })
-- select all (overrides vim's number-increment, same tradeoff as before)
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select All" })
-- pasting over a selection no longer clobbers your clipboard
vim.cmd([[ xnoremap <expr> p 'pgv"'.v:register.'y' ]])

-- Youtuber git UX verbatim: <leader>g must fire Neogit INSTANTLY (the plugin
-- spec in plugins/neogit.lua owns the mapping). LazyVim's <leader>g* group
-- (gg lazygit, gb blame, ...) is removed here because any longer mapping on
-- the same prefix forces vim to pause before firing the bare <leader>g.
-- diffview stays reachable via :DiffviewOpen; lazygit via the shell command.
for _, mode in ipairs({ "n", "v", "x" }) do
  for _, map in ipairs(vim.api.nvim_get_keymap(mode)) do
    if map.lhs and map.lhs:sub(1, 2) == " g" and #map.lhs > 2 then
      pcall(vim.keymap.del, mode, map.lhs)
    end
  end
end
