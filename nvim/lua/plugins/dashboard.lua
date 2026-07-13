return {
  "snacks.nvim",
  opts = {
    dashboard = {
      preset = {
        header = [[

 ________     _______     ________    ___      ___   ___    _____ ______
|\   ___  \  |\  ___ \   |\   __  \  |\  \    /  /| |\  \  |\   _ \  _   \
\ \  \\ \  \ \ \   __/|  \ \  \|\  \ \ \  \  /  / / \ \  \ \ \  \\\__\ \  \
 \ \  \\ \  \ \ \  \_|/__ \ \  \\\  \ \ \  \/  / /   \ \  \ \ \  \\|__| \  \
  \ \  \\ \  \ \ \  \_|\ \ \ \  \\\  \ \ \    / /     \ \  \ \ \  \    \ \  \
   \ \__\\ \__\ \ \_______\ \ \_______\ \ \__/ /       \ \__\ \ \__\    \ \__\
    \|__| \|__|  \|_______|  \|_______|  \|__|/         \|__|  \|__|     \|__|
        ]],
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "f", desc = "Find Files", action = ":lua Snacks.picker.files()" },
          { icon = "󰷾 ", key = "w", desc = "Find Word", action = ":lua Snacks.picker.grep()" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.picker.recent()" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.picker.files({cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", action = ":lua require('persistence').load()" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 1 },
        { section = "startup" },
      },
    },
  },
}
