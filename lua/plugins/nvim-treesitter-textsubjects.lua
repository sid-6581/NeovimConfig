return {
  "RRethy/nvim-treesitter-textsubjects",
  event = "VeryLazy",

  keys = {
    { "<CR>", "v<CR>", remap = true, desc = "Select node [treesitter-textsubjects]" },
  },

  opts = {
    prev_selection = "<S-CR>",
    keymaps = {
      ["<CR>"] = { "textsubjects-smart", desc = "Select node [treesitter-textsubjects]" },
      [";"] = { "textsubjects-container-outer", desc = "Select outer container [treesitter-textsubjects]" },
      ["i;"] = { "textsubjects-container-inner", desc = "Select inner container [treesitter-textsubjects]" },
    },
  },

  config = function(_, opts)
    require("nvim-treesitter-textsubjects").configure(opts)
  end,
}
