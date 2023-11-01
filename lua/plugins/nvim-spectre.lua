return {
  "nvim-pack/nvim-spectre",
  event = "VeryLazy",

  keys = {
    { "<leader>S", function() require("spectre").toggle() end, desc = "Replace in files (Spectre)" },
  },

  opts = {},
}
