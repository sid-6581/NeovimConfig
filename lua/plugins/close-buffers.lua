return {
  "kazhala/close-buffers.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>ba", function() require("close_buffers").delete({ type = "all" }) end, desc = "Delete all buffers [close-buffers]" },
    { "<Leader>bd", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer [close-buffers]" },
    { "<Leader>bh", function() require("close_buffers").delete({ type = "hidden" }) end, desc = "Delete hidden buffers [close-buffers]" },
    { "<Leader>bo", function() require("close_buffers").delete({ type = "other" }) end, desc = "Delete other buffers [close-buffers]" },
    { "<S-Esc>", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer [close-buffers]" },
  },

  opts = {
    filetype_ignore = { "neo-tree" },
    preserve_window_layout = { "this" },
  },
}
