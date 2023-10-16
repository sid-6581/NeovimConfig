return {
  "kazhala/close-buffers.nvim",
  event = "VeryLazy",

  keys = {
    { "<S-Esc>", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
    { "<Leader>bd", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
    { "<Leader>ba", function() require("close_buffers").delete({ type = "all" }) end, desc = "Delete all buffers" },
    {
      "<Leader>bh",
      function() require("close_buffers").delete({ type = "hidden" }) end,
      desc = "Delete hidden buffers",
    },
    {
      "<Leader>bo",
      function() require("close_buffers").delete({ type = "other" }) end,
      desc = "Delete other buffers",
    },
  },

  opts = {
    filetype_ignore = { "neo-tree" },
    preserve_window_layout = { "this" },
  },
}
