local util = require("user.util")

local autopairs = util.safe_require("nvim-autopairs")
if not autopairs then return end

local autopairs_cmp = util.safe_require("nvim-autopairs.completion.cmp")
if not autopairs_cmp then return end

local cmp = util.safe_require("cmp")
if not cmp then return end

autopairs.setup({
  check_ts = true,
})

autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))

cmp.event:on(
  'confirm_done',
    autopairs_cmp.on_confirm_done()
)

