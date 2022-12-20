local M = {
  "windwp/nvim-autopairs",
}

function M.config()
  local autopairs = require("nvim-autopairs")
  local autopairs_cmp = require("nvim-autopairs.completion.cmp")
  local cmp = require("cmp")

  autopairs.setup({
    check_ts = true,
    ts_config = {
      lua = { "string", "comment" }, -- it will not add a pair on that treesitter node
    },
  })

  autopairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
  cmp.event:on("confirm_done", autopairs_cmp.on_confirm_done())
end

return M
