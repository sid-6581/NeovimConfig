return {
  "gbprod/yanky.nvim",
  event = "VeryLazy",

  keys = {
    { "y", "<Plug>(YankyYank)", mode = { "n", "x" }, desc = "Yank text [yanky]" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "n" }, desc = "Put yanked text after cursor [yanky]" },
    { "P", "<Plug>(YankyGPutBefore)", mode = { "n" }, desc = "Put yanked text before cursor [yanky]" },
    { "p", "<Plug>(YankyPutAfter)", mode = { "x" }, desc = "Replace text with yanked [yanky]" },
    { "P", "<Plug>(YankyPutBefore)", mode = { "x" }, desc = "Replace text with yanked [yanky]" },
    { "[y", "<Plug>(YankyCycleForward)", desc = "Cycle forward through yank history [yanky]" },
    { "]y", "<Plug>(YankyCycleBackward)", desc = "Cycle backward through yank history [yanky]" },
    { "]p", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise) [yanky]" },
    { "[p", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise) [yanky]" },
    { "]P", "<Plug>(YankyPutIndentAfterLinewise)", desc = "Put indented after cursor (linewise) [yanky]" },
    { "[P", "<Plug>(YankyPutIndentBeforeLinewise)", desc = "Put indented before cursor (linewise) [yanky]" },
    { ">p", "<Plug>(YankyPutIndentAfterShiftRight)", desc = "Put and indent right [yanky]" },
    { "<p", "<Plug>(YankyPutIndentAfterShiftLeft)", desc = "Put and indent left [yanky]" },
    { ">P", "<Plug>(YankyPutIndentBeforeShiftRight)", desc = "Put before and indent right [yanky]" },
    { "<P", "<Plug>(YankyPutIndentBeforeShiftLeft)", desc = "Put before and indent left [yanky]" },
    { "=p", "<Plug>(YankyPutAfterFilter)", desc = "Put after applying a filter [yanky]" },
    { "=P", "<Plug>(YankyPutBeforeFilter)", desc = "Put before applying a filter [yanky]" },
  },

  opts = function()
    local utils = require("yanky.utils")
    local mapping = require("yanky.telescope.mapping")

    return {
      ring = {
        sync_with_numbered_registers = false,
      },
      system_clipboard = {
        sync_with_ring = false,
      },
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
    }
  end,

  config = function(_, opts)
    require("yanky").setup(opts)
    vim.api.nvim_set_hl(0, "YankyPut", { link = "Visual" })
    vim.api.nvim_set_hl(0, "YankyYanked", { link = "Visual" })
  end,
}
