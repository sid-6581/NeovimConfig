local M = {
  "stevearc/dressing.nvim",
}

function M.config()
  local dressing = require("dressing")

  dressing.setup({
    input = {
      border = "single",
    },
    select = {
      nui = {
        border = {
          style = "single",
        },
      },
      builtin = {
        border = "single",
      },
    },
  })
end

return M
