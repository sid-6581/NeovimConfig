local M = {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
}

function M.config()
  local dressing = require("dressing")

  dressing.setup({
    input = {
      border = "single",
      insert_only = false,
      start_in_insert = false,
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
