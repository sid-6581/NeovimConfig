return {
  "folke/flash.nvim",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { "gn", function() require("flash").treesitter({ jump = { pos = "start" } }) end, desc = "Go to treesitter node start" },
    { "gN", function() require("flash").treesitter({ jump = { pos = "end" } }) end, desc = "Go to treesitter node end" },
    { "<Leader>uF", function()
      vim.notify(require("flash.plugins.search").enabled and "Disabled flash search" or "Enabled flash search")
      require("flash").toggle()
    end, desc = "Toggle Flash search" },
    { mode = { "o", "x" }, "n", function() require("flash").treesitter() end, desc = "Treesitter node" },
    { mode = { "o", "x" }, "N", function() require("flash").treesitter_search() end, desc = "Treesitter node search" },
    { mode = { "o", "x" }, "R", function() require("flash").remote() end, desc = "Remote flash" },
  },

  opts = {
    search = {
      multi_window = false,
    },
    highlight = {
      backdrop = false,
    },
    label = {
      before = true,
      after = false,
      style = "overlay",
    },
    modes = {
      char = {
        config = function(opts)
          -- autohide flash when in operator-pending mode
          opts.autohide = vim.fn.mode(true):find("no") and (vim.v.operator == "y" or vim.v.operator == "d")
          -- disable jump labels when not enabled, when using a count, or when recording/executing registers
          opts.jump_labels = opts.jump_labels
            and vim.v.count == 0
            and vim.fn.reg_executing() == ""
            and vim.fn.reg_recording() == ""
        end,
        highlight = {
          backdrop = false,
        },
      },
      search = {
        incremental = true,
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
        label = {
          exclude = "abcdefghijklmnopqrstuvwxyz",
          uppercase = true,
          style = "overlay",
          before = true,
          after = false,
        },
      },
    },
  },

  config = function(_, opts)
    require("flash").setup(opts)
    local colors = require("util.colors").colors
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = colors.gray })
  end,
}
