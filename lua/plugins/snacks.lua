return {
  "folke/snacks.nvim",
  event = "VeryLazy",

  opts = {
    statuscolumn = {
      enabled = false,
    },
  },

  config = function(_, opts)
    require("snacks").setup(opts)

    _G.dd = function(...)
      require("snacks").debug.inspect(...)
    end

    _G.bt = function()
      require("snacks").debug.backtrace()
    end

    vim.print = _G.dd
  end,
}
