return {
  "Wansmer/treesj",
  event = "VeryLazy",

  keys = {
    { "<Leader>cs", function() require("treesj").split() end, desc = "Split treesitter node [treesj]" },
    { "<Leader>cj", function() require("treesj").join() end, desc = "Join treesitter node [treesj]" },
    { "M", function() require("treesj").toggle() end, desc = "Split/join treesitter node [treesj]" },
  },

  opts = {
    use_default_keymaps = false,
    max_join_length = 500,
  },
}
