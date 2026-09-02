-- Git UX carried over from the youtuber base config (kunchenguid/dotfiles):
-- <leader>g opens Neogit (press-and-pause; chaining into LazyVim's <leader>g*
-- maps like gg/gb still works), and gitsigns shows inline blame for the
-- current line.
return {
  {
    "NeogitOrg/neogit",
    dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
    keys = { { "<leader>g", function() require("neogit").open() end, desc = "Neogit" } },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = { current_line_blame = true },
  },
}
