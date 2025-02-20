return {
  "MagicDuck/grug-far.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<A-g>",
      function() require("grug-far").toggle_instance({ instanceName = "default" }) end,
      mode = { "n", "x" },
      desc = "Search/replace in files [grug-far]",
    },
  },

  opts = {
    staticTitle = "Search/replace in files",
    startInInsertMode = false,
    transient = true,
    folding = {
      foldcolumn = "0",
    },
  },
}
