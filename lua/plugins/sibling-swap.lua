return {
  "Wansmer/sibling-swap.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-l>", function() require("sibling-swap").swap_with_right() end, desc = "Treesitter node swap with right" },
    { "<A-h>", function() require("sibling-swap").swap_with_left() end, desc = "Treesitter node swap with left" },
    { "<S-A-l>", function() require("sibling-swap").swap_with_right_with_opp() end, desc = "Treesitter node swap with rights with opposite" },
    { "<S-A-h>", function() require("sibling-swap").swap_with_left_with_opp() end, desc = "Treesitter node swap with left with opposite" },
  },

  opts = {
    highlight_node_at_cursor = true,
    use_default_keymaps = false,
  },
}
