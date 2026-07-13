return {
  "mfussenegger/nvim-dap",
  opts = function()
    local dap = require("dap")

    -- Python DAP
    dap.configurations.python = dap.configurations.python or {}
    table.insert(dap.configurations.python, {
      name = "Custom Script: Current File",
      type = "python",
      request = "launch",
      program = function()
        return vim.fn.expand("%:p")
      end,
      pythonPath = function()
        local venv = vim.fn.getcwd() .. "/.venv/bin/python"
        if vim.fn.executable(venv) == 1 then
          return venv
        end
        return "python3"
      end,
      env = function()
        return { PYTHONPATH = vim.fn.getcwd() }
      end,
      justMyCode = false,
      console = "integratedTerminal",
    })

    -- JS/TS DAP
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
    dap.adapters["pwa-chrome"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          require("mason-registry").get_package("js-debug-adapter"):get_install_path()
            .. "/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }

    for _, lang in ipairs({ "javascript", "typescript", "javascriptreact", "typescriptreact" }) do
      dap.configurations[lang] = dap.configurations[lang] or {}
      table.insert(dap.configurations[lang], {
        type = "pwa-node",
        request = "attach",
        name = "Attach to process",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
      })
      table.insert(dap.configurations[lang], {
        type = "pwa-chrome",
        request = "launch",
        name = "Launch Chrome",
        url = "http://localhost:3000",
        webRoot = "${workspaceFolder}",
      })
      table.insert(dap.configurations[lang], {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      })
      table.insert(dap.configurations[lang], {
        type = "pwa-node",
        request = "launch",
        name = "Launch compiled TS",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeArgs = { "--loader", "ts-node/esm" },
        sourceMaps = true,
        resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
      })
    end
  end,
}
