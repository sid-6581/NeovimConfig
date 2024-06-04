return {
  "kazhala/close-buffers.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>ba", function() require("close_buffers").wipe({ type = "all" }) end, desc = "Delete all buffers" },
    { "<Leader>bd", function() require("close_buffers").wipe({ type = "this" }) end, desc = "Delete buffer" },
    { "<Leader>bh", function() require("close_buffers").wipe({ type = "hidden" }) end, desc = "Delete hidden buffers" },
    { "<Leader>bo", function() require("close_buffers").wipe({ type = "other" }) end, desc = "Delete other buffers" },
    { "<S-Esc>", function() require("close_buffers").wipe({ type = "this" }) end, desc = "Delete buffer" },
  },

  opts = {
    filetype_ignore = { "neo-tree" },
    preserve_window_layout = { "this" },
  },
}
