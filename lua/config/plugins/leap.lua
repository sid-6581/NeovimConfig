local M = {
  "ggandor/leap.nvim",
  event = "VeryLazy",

  dependencies = {
    { "ggandor/flit.nvim" },
    { "ggandor/leap-ast.nvim" },
  },
}

function M.config()
  -- require("leap").add_default_mappings()
  require("flit").setup({
    labeled_modes = "nv",
  })
  -- vim.keymap.set({ "n", "x", "o" }, "M", function()
  --   require("leap-ast").leap()
  -- end, { desc = "Leap to parent AST node" })
end

return M
