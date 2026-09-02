-- Arrow keys expand/collapse folders in the snacks explorer, on top of the
-- stock l(open)/h(close) keys. Carried over from an explicit request during
-- the youtuber-config era; snacks defaults do not bind arrows.
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["<Right>"] = "confirm",
                  ["<Left>"] = "explorer_close",
                },
              },
            },
          },
        },
      },
    },
  },
}
