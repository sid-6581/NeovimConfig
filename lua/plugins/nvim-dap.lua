return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",

  dependencies = {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
  },

  keys = {
    { "<F10>", function() require("dap").step_over() end, desc = "Step over [dap]" },
    { "<F11>", function() require("dap").step_into() end, desc = "Step into [dap]" },
    { "<F12>", function() require("dap").step_out() end, desc = "Step out [dap]" },
    {
      "<F5>",
      function()
        require("dap.ext.vscode").load_launchjs(nil, { codelldb = { "rust", "c", "cpp" } })
        require("dap").continue()
      end,
      desc = "Continue [dap]",
    },
    { "<F9>", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint [dap]" },
    { "<Leader>df", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").frames) end, desc = "Debug frames [dap]" },
    { "<Leader>ds", function() require("dap.ui.widgets").centered_float(require("dap.ui.widgets").scopes) end, desc = "Debug scopes [dap]" },
    { "<S-F5>", function() require("dap").terminate() end, desc = "Terminate [dap]" },
    { "<Leader>dh", function() require("dap.ui.widgets").hover() end, mode = { "n", "x" }, desc = "Debug hover [dap]" },
    { "<Leader>dp", function() require("dap.ui.widgets").preview() end, mode = { "n", "x" }, desc = "Debug preview [dap]" },
  },

  opts = {},

  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/adapter/codelldb",
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/target/debug/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
      },

      {
        name = "Attach to process",
        type = "codelldb",
        request = "attach",
        pid = require("dap.utils").pick_process,
        args = {},
      },
    }

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )

    require("dap.ext.vscode").json_decode = require("neoconf.json.jsonc").decode_jsonc

    dapui.setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
  end,
}
