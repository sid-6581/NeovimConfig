return {
  "chrisgrieser/nvim-rip-substitute",
  event = "VeryLazy",

  keys = {
    { mode = { "n", "x" }, "<Leader>S", function() require("rip-substitute").sub() end, desc = "Search/replace in file [rip-substitute]" },
  },

  opts = {
    popupWin = {
      title = "Search/Replace",
      position = "top",
    },
  },
}
