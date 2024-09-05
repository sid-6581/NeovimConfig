return {
  "stevearc/quicker.nvim",
  event = { "VeryLazy", "FileType qf" },

  --- @type quicker.SetupOptions
  opts = {
    keys = {
      { ">", function() require("quicker").expand({ before = 2, after = 2, add_to_existing = true }) end, desc = "Expand quickfix context [quicker]" },
      { "<", function() require("quicker").collapse() end, desc = "Collapse quickfix context [quicker]" },
    },
    highlight = {
      load_buffers = false,
    },
  },
}
