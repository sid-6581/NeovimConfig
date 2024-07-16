return {
  "Wansmer/sibling-swap.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<A-l>",
      function() require("sibling-swap").swap_with_right() end,
      desc = "Treesitter node swap with right [sibling-swap]",
    },
    {
      "<A-h>",
      function() require("sibling-swap").swap_with_left() end,
      desc = "Treesitter node swap with left [sibling-swap]",
    },
    {
      "<S-A-l>",
      function() require("sibling-swap").swap_with_right_with_opp() end,
      desc = "Treesitter node swap with rights with opposite [sibling-swap]",
    },
    {
      "<S-A-h>",
      function() require("sibling-swap").swap_with_left_with_opp() end,
      desc = "Treesitter node swap with left with opposite [sibling-swap]",
    },
  },

  opts = {
    highlight_node_at_cursor = true,
    use_default_keymaps = false,
  },
}
