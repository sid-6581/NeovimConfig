return {
  "folke/flash.nvim",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { "gn", function() require("flash").treesitter({ jump = { pos = "start" } }) end, desc = "Flash treesitter" },
    { "gN", function() require("flash").treesitter({ jump = { pos = "end" } }) end, desc = "Flash treesitter" },
    { mode = { "o", "x" }, "n", function() require("flash").treesitter() end, desc = "Flash treesitter" },
    { mode = { "o", "x" }, "N", function() require("flash").treesitter_search() end, desc = "Flash treesitter search" },
    { mode = { "o", "x" }, "R", function() require("flash").remote() end, desc = "Remote flash" },
  },

  opts = {
    label = {
      style = "inline",
    },
    modes = {
      char = {
        config = function(opts)
          -- autohide flash when in operator-pending mode
          ---@diagnostic disable-next-line: undefined-field
          opts.autohide = vim.fn.mode(true):find("no") and (vim.v.operator == "y" or vim.v.operator == "d")
          -- disable jump labels when enabled and when using a count
          opts.jump_labels = opts.jump_labels and vim.v.count == 0
        end,
      },
      search = {
        label = {
          before = true,
          after = false,
        },
        highlight = {
          backdrop = true,
        },
      },
      treesitter = {
        highlight = {
          backdrop = true,
        },
      },
    },
  },

  config = function(_, opts)
    require("flash").setup(opts)
    local colors = require("util.colors")
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = colors.gray })
  end,
}
