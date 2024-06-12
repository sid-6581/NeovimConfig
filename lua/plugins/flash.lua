return {
  "folke/flash.nvim",
  event = "VeryLazy",

  keys = {
    { "gn", function() require("flash").treesitter({ jump = { pos = "start" } }) end, desc = "Go to treesitter node start" },
    { "gN", function() require("flash").treesitter({ jump = { pos = "end" } }) end, desc = "Go to treesitter node end" },
    { "gw", function() require("flash").jump({ search = { mode = "search", max_length = 0 }, pattern = "\\<" }) end, desc = "Go to word start" },
    {
      "<Leader>u/",
      function()
        vim.notify(require("flash.plugins.search").enabled and "Disabled flash search" or "Enabled flash search")
        require("flash").toggle()
      end,
      desc = "Toggle Flash search",
    },
    { "n", function() require("flash").treesitter() end, mode = { "o", "x" }, desc = "Treesitter node" },
    { "N", function() require("flash").treesitter_search() end, mode = { "o", "x" }, desc = "Treesitter node search" },
    { "r", function() require("flash").remote() end, mode = { "o" }, desc = "Remote flash" },
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
      reuse = "all",
    },
    prompt = {
      win_config = {
        row = -2,
      },
    },

    modes = {
      char = {
        enabled = false,
      },

      search = {
        enabled = true,
        incremental = true,
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
      },

      treesitter_search = {
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
        remote_op = { restore = true, motion = true },
      },

      remote = {
        labels = "ASDFGHJKLQWERTYUIOPZXCVBNM",
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
