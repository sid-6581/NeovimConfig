local map = function(mode, lhs, rhs, opts)
  vim.tbl_deep_extend("force", { silent = true, noremap = true }, opts)
  vim.keymap.set(mode, lhs, rhs, opts)
end

return {
  "mfussenegger/nvim-dap",
  event = "VeryLazy",

  dependencies = {
    "rcarriga/nvim-dap-ui",
  },

  opts = {},

  config = function(_, opts)
    local dap = require("dap")
    local dapui = require("dapui")

    local codelldb_root = require("mason-registry").get_package("codelldb"):get_install_path() .. "/extension/"
    local codelldb_path = codelldb_root .. "adapter/codelldb"

    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = codelldb_path,
        args = { "--port", "${port}" },
      },
    }

    dap.configurations.rust = {
      {
        name = "Launch File",
        type = "codelldb",
        request = "launch",
        program = function() return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/target/debug/", "file") end,
        cwd = "${workspaceFolder}",
        stopOnEntry = true,
      },
    }

    -- stylua: ignore start
    vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "", texthl = "DiagnosticSignError", linehl = "", numhl = "" })
    -- stylua: ignore end

    require("dap.ext.vscode").json_decode = require("neoconf.json.jsonc").decode_jsonc

    require("dap.ext.vscode").load_launchjs(nil, {
      codelldb = { "rust", "c", "cpp" },
    })

    dapui.setup(opts)

    dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
    dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
    dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end

    local widgets = require("dap.ui.widgets")

    map("n", "<F10>", function() require("dap").step_over() end, { desc = "Step Over" })
    map("n", "<F11>", function() require("dap").step_into() end, { desc = "Step Into" })
    map("n", "<F12>", function() require("dap").step_out() end, { desc = "Step Out" })
    map("n", "<F5>", function() require("dap").continue() end, { desc = "Continue" })
    map("n", "<F9>", function() require("dap").toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
    map("n", "<Leader>df", function() widgets.centered_float(widgets.frames) end, { desc = "Debug Frames" })
    map("n", "<Leader>ds", function() widgets.centered_float(widgets.scopes) end, { desc = "Debug Scopes" })
    map("n", "<S-F5>", function() require("dap").terminate() end, { desc = "Terminate" })
    map({ "n", "v" }, "<Leader>dh", function() require("dap.ui.widgets").hover() end, { desc = "Debug Hover" })
    map({ "n", "v" }, "<Leader>dp", function() require("dap.ui.widgets").preview() end, { desc = "Debug Preview" })
  end,
}
