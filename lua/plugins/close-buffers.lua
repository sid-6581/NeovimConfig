return {
  "kazhala/close-buffers.nvim",
  event = "VeryLazy",

  -- stylua: ignore start

  keys = {
    { "<Leader>ba", function() require("close_buffers").delete({ type = "all" }) end, desc = "Delete all buffers" },
    { "<Leader>bd", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
    { "<Leader>bh", function() require("close_buffers").delete({ type = "hidden" }) end, desc = "Delete hidden buffers" },
    { "<Leader>bo", function() require("close_buffers").delete({ type = "other" }) end, desc = "Delete other buffers" },
    { "<S-Esc>", function() require("close_buffers").delete({ type = "this" }) end, desc = "Delete buffer" },
  },

  -- stylua: ignore end

  opts = {
    filetype_ignore = { "neo-tree" },
    preserve_window_layout = { "this" },
  },
}
