local M = {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
}

function M.config()
  local trouble = require("trouble")

  trouble.setup({
    use_diagnostic_signs = true,
  })
end

return M
