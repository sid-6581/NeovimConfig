return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { mode = { "n", "x" }, "y", "<Plug>(YankyYank)", desc = "Yank text" },
    { mode = { "n", "x" }, "p", "<Plug>(YankyPutAfter)", desc = "Put yanked text after cursor" },
    { mode = { "n", "x" }, "P", "<Plug>(YankyPutBefore)", desc = "Put yanked text before cursor" },
    { mode = { "n", "x" }, "gp", "<Plug>(YankyGPutAfter)", desc = "Put yanked text after selection" },
    { mode = { "n", "x" }, "gP", "<Plug>(YankyGPutBefore)", desc = "Put yanked text before selection" },
    { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise)" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise)" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter" },
  },

  config = function()
    local utils = require("yanky.utils")
    local mapping = require("yanky.telescope.mapping")

    require("yanky").setup({
      highlight = {
        timer = 200,
      },
      picker = {
        telescope = {
          use_default_mappings = false,
          mappings = {
            default = mapping.put("p"),
            i = {
              ["<C-X>"] = mapping.delete(),
            },
            n = {
              p = mapping.put("p"),
              P = mapping.put("P"),
              d = mapping.delete(),
              r = mapping.set_register(utils.get_default_register()),
            },
          },
        },
      },
    })
    vim.api.nvim_set_hl(0, "YankyPut", { link = "Visual" })
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "Visual" })
  end,
}
