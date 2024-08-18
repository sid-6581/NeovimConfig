return {
  "Wansmer/sibling-swap.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-l>", function() require("sibling-swap").swap_with_right() end, desc = "Swap right [sibling-swap]" },
    { "<A-h>", function() require("sibling-swap").swap_with_left() end, desc = "Swap left [sibling-swap]" },
  },

  opts = {
    highlight_node_at_cursor = false,
    use_default_keymaps = false,
  },
}
