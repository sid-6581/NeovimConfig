local util = require("user.util")

local gitsigns = util.safe_require("gitsigns")
if not gitsigns then return end

gitsigns.setup({
  preview_config = {
    border = "single",
  },
})
