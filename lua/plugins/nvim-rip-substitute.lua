return {
  "chrisgrieser/nvim-rip-substitute",
  event = "VeryLazy",

  keys = {
    { "<Leader>S", function() require("rip-substitute").sub() end, mode = { "n", "x" }, desc = "Search/replace in file [rip-substitute]" },
  },

  opts = {
    popupWin = {
      title = "Search/Replace",
      position = "bottom",
    },
    keymaps = {
      abort = "<Esc>",
    },
  },
}
