return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  keys = {
    { "[c", function() require("gitsigns").prev_hunk() end, desc = "Previous change (git)" },
    { "]c", function() require("gitsigns").next_hunk() end, desc = "Next change (git)" },
    { "<Leader>gD", function() require("gitsigns").diffthis() end, desc = "Diff" },
    { "<Leader>gj", function() require("gitsigns").next_hunk() end, desc = "Next hunk" },
    { "<Leader>gk", function() require("gitsigns").prev_hunk() end, desc = "Prev hunk" },
    { "<Leader>gl", function() require("gitsigns").blame_line() end, desc = "Blame" },
    { "<Leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Preview hunk" },
    { "<Leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Reset buffer" },
    { "<Leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Reset hunk" },
    { "<Leader>gS", function() require("gitsigns").stage_hunk() end, desc = "Stage hunk" },
    { "<Leader>gu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
  },

  opts = {
    -- sign_priority = 100,
  },
}
