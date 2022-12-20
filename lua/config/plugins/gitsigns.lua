local M = {
  "lewis6991/gitsigns.nvim",
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
