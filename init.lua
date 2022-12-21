local util = require("config.util")
local require = util.safe_require

require("config.options")
require("config.lazy")

vim.api.nvim_create_autocmd("User", {
  pattern = "VeryLazy",
  callback = function()
    require("config.mappings")
    vim.cmd("highlight link FloatBorder Normal")
    vim.cmd("highlight link NormalFloat Normal")
  end,
})
