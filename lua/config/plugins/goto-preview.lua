local M = {
  "rmagatti/goto-preview",
  event = "VeryLazy",
}

function M.config()
  local goto_preview = require("goto-preview")
  goto_preview.setup({})
end

return M
