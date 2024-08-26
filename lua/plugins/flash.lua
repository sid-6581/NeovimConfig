return {
  "folke/flash.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<Leader>u/",
      function()
        vim.notify(require("flash.plugins.search").enabled and "Disabled flash search" or "Enabled flash search")
        require("flash").toggle()
      end,
      desc = "Toggle Flash search [flash]",
    },
    {
      "gn",
      function() require("flash").treesitter({ jump = { pos = "end" } }) end,
      desc = "Go to treesitter node end [flash]",
    },
    {
      "gN",
      function() require("flash").treesitter({ jump = { pos = "start" } }) end,
      desc = "Go to treesitter node start [flash]",
    },
    {
      "gw",
      function() require("flash").jump({ search = { mode = "search", max_length = 0 }, pattern = "\\<" }) end,
      desc = "Go to word start [flash]",
    },
    {
      "n",
      function() require("flash").treesitter() end,
      mode = { "o", "x" },
      desc = "Treesitter node [flash]",
    },
    {
      "N",
      function() require("flash").treesitter_search() end,
      mode = { "o", "x" },
      desc = "Treesitter node search [flash]",
    },
    {
      "r",
      function() require("flash").remote() end,
      mode = { "o" },
      desc = "Remote [flash]",
    },
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
