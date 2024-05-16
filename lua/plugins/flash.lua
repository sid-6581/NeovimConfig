return {
  "folke/flash.nvim",
  event = "VeryLazy",

  -- stylua: ignore start
  keys = {
    { "gn", function() require("flash").treesitter({ jump = { pos = "start" } }) end, desc = "Go to treesitter node start" },
    { "gN", function() require("flash").treesitter({ jump = { pos = "end" } }) end, desc = "Go to treesitter node end" },
    { "gw", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, pattern = "\\<" }) end, desc = "Go to word start" },
    { "<Leader>u/", function()
      vim.notify(require("flash.plugins.search").enabled and "Disabled flash search" or "Enabled flash search")
      require("flash").toggle()
    end, desc = "Toggle Flash search" },
    { "n", function() require("flash").treesitter() end, mode = { "o", "x" }, desc = "Treesitter node" },
    { "N", function() require("flash").treesitter_search() end, mode = { "o", "x" }, desc = "Treesitter node search" },
    { "r", function() require("flash").remote() end, mode = { "o", "x" }, desc = "Remote flash" },
  },
  -- stylua: ignore end

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
        enabled = false,
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
        enabled = true,
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
    remote_op = {
      restore = true,
      motion = true,
    },
  },

  config = function(_, opts)
    require("flash").setup(opts)
    local colors = require("util.colors").colors
    vim.api.nvim_set_hl(0, "FlashLabel", { fg = "#ffffff" })
    vim.api.nvim_set_hl(0, "FlashBackdrop", { fg = colors.gray })
  end,
}
