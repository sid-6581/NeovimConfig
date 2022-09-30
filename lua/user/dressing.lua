local util = require("user.util")

local dressing = util.safe_require("dressing")
if not dressing then return end

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
