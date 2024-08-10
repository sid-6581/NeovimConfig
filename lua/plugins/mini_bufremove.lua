return {
  "echasnovski/mini.bufremove",
  event = "VeryLazy",

  keys = {
    { "<Leader>bd", function() require("mini.bufremove").delete() end, desc = "Delete buffer [mini.bufremove]" },
    { "<S-Esc>", function() require("mini.bufremove").delete() end, desc = "Delete buffer [mini.bufremove]" },
  },

  opts = {},
}
