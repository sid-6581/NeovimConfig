local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",

  dependencies = {
    {
      "ggandor/flit.nvim",
      config = { labeled_modes = "nv" },
    },
    { "ggandor/leap-ast.nvim" },
  },
}

function M.config()
  local leap = require("leap")
  leap.opts.max_phase_one_targets = 0
  leap.opts.highlight_unlabeled_phase_one_targets = false
end

return M
