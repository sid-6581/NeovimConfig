local M = {
  "rmagatti/goto-preview",
}

function M.config()
  local goto_preview = require("goto-preview")
  goto_preview.setup({})
end

return M
