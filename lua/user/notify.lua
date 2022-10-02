local util = require("user.util")

local notify = util.safe_require("notify")
if not notify then return end

notify.setup({
  stages = "fade_in_slide_out",
  background_colour = "#000000",
})

vim.notify = notify
