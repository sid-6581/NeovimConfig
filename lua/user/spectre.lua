local util = require("user.util")

local spectre = util.safe_require("spectre")
if not spectre then return end

spectre.setup({
  is_insert_mode = true,
})
