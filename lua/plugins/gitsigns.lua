return {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gR", function() require("gitsigns").reset_buffer() end, desc = "Git reset buffer [gitsigns]" },
    { "<Leader>gl", function() require("gitsigns").blame() end, desc = "Git blame file [gitsigns]" },
    { "<Leader>gp", function() require("gitsigns").preview_hunk() end, desc = "Git preview hunk [gitsigns]" },
    { "<Leader>gr", function() require("gitsigns").reset_hunk() end, desc = "Git reset hunk [gitsigns]" },
    {
      "]c",
      function()
        if vim.opt_local.diff:get() then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
      desc = "Next diff/git hunk [gitsigns]",
    },
    {
      "[c",
      function()
        if vim.opt_local.diff:get() then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
      desc = "Previous diff/git hunk [gitsigns]",
    },
    { "[C", function() require("gitsigns").nav_hunk("first") end, desc = "First git hunk [gitsigns]" },
    { "]C", function() require("gitsigns").nav_hunk("last") end, desc = "Last git hunk [gitsigns]" },
  },

  opts = {
    sign_priority = 100,
  },
}
