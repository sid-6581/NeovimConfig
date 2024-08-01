return {
  -- "chrisgrieser/nvim-rip-substitute",
  "sid-6581/nvim-rip-substitute",
  branch = "fix-float",
  event = "VeryLazy",

  keys = {
    { mode = { "n", "x" }, "<Leader>S", function() require("rip-substitute").sub() end, desc = "Search/replace in file [rip-substitute]" },
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
