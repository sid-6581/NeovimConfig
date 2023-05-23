return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",

  dependencies = {
    "rcarriga/nvim-dap-ui",
  },

  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define(
      "DapBreakpointCondition",
      { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" }
    )

    require("dap.ext.vscode").load_launchjs(nil, { rt_lldb = { "rust" } })

    dapui.setup({})

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    local widgets = require("dap.ui.widgets")
    local map = vim.keymap.set

    map("n", "<F5>", function() require("dap").continue() end, { desc = "Continue" })
    map("n", "<S-F5>", function() require("dap").terminate() end, { desc = "Terminate" })
    map("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
    map("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
    map("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
    map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    map({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end, { desc = "Debug Hover" })
    map({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, { desc = "Debug Preview" })
    map("n", "<Leader>df", function() widgets.centered_float(widgets.frames) end, { desc = "Debug Frames" })
    map("n", "<Leader>ds", function() widgets.centered_float(widgets.scopes) end, { desc = "Debug Scopes" })
  end,
}
