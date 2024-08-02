return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",

  keys = {
    { "<leader>G", function() require("grug-far").toggle_instance(require("plugins.grug-far").opts) end, desc = "Search/replace in files [grug-far]" },
  },

  opts = {
    instanceName = "far",
    staticTitle = "Search/replace in files",
    startInInsertMode = false,
    transient = true,
    folding = {
      foldcolumn = "0",
    },
  },
}
