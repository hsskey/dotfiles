-- Arrow keys expand/collapse folders in the snacks explorer, on top of the
-- stock l(open)/h(close) keys. Carried over from an explicit request during
-- the youtuber-config era; snacks defaults do not bind arrows.
-- ponytail: ignored=true on picker sources; toggle with I in explorer/picker
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            ignored = true,
            win = {
              list = {
                keys = {
                  ["<Right>"] = "confirm",
                  ["<Left>"] = "explorer_close",
                },
              },
            },
          },
          files = { ignored = true },
          grep = { ignored = true },
        },
      },
    },
  },
}
