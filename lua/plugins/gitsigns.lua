local M = {
  "lewis6991/gitsigns.nvim",
  event = { "BufReadPost", "InsertEnter" },
}

function M.config()
  local gitsigns = require("gitsigns")

  gitsigns.setup({
    preview_config = {
      border = "single",
    },
  })
end

return M
