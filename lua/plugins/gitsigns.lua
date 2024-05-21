return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gD", function() require("gitsigns").diffthis() end, desc = "Diff this" },
    { "<Leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
    { "<Leader>ghp", function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk inline" },
    { "<Leader>ghr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { "<Leader>ghs", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<Leader>ghu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
    { "<Leader>gl", function() require("gitsigns").blame_line({ full = true }) end, desc = "Blame line" },
    { "[H", function() require("gitsigns").nav_hunk("first") end, desc = "First git hunk" },
    { "[h", function() require("gitsigns").nav_hunk("prev") end, desc = "Previous git hunk" },
    { "]H", function() require("gitsigns").nav_hunk("last") end, desc = "Last git hunk" },
    { "]h", function() require("gitsigns").nav_hunk("next") end, desc = "Next git hunk" },
  },

  opts = {
    sign_priority = 100,
  },
}
