return {
  "Wansmer/treesj",
  event = "VeryLazy",

  keys = {
    { "<leader>cs", function() require("treesj").split() end, desc = "Split treesitter node" },
    { "<leader>cj", function() require("treesj").join() end, desc = "Join treesitter node" },
  },

  opts = {
    use_default_keymaps = false,
    max_join_length = 500,
  },
}
