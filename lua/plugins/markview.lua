return {
  "OXY2DEV/markview.nvim",
  event = "VeryLazy",
  ft = "markdown",

  keys = {
    {
      "<Leader>uvm",
      function()
        require("markview").commands.toggleAll()
        vim.notify("Toggled markview (global)")
      end,
      desc = "Toggle markview (global) [markview]",
    },
    {
      "<Leader>uvM",
      function()
        require("markview").commands.toggle()
        vim.notify("Toggled markview (buffer)")
      end,
      desc = "Toggle markview (buffer) [markview]",
    },
  },

  opts = {
    modes = { "n", "i", "no", "c" },
    hybrid_modes = { "n", "i" },

    headings = {
      shift_width = 0,
      heading_1 = {
        icon = "󰉫 ",
      },
      heading_2 = {
        icon = "󰉬 ",
      },
      heading_3 = {
        icon = "󰉭 ",
      },
      heading_4 = {
        icon = "󰉮 ",
      },
      heading_5 = {
        icon = "󰉯 ",
      },
      heading_6 = {
        icon = "󰉰 ",
      },
    },

    callbacks = {
      on_enable = function(_, win)
        vim.wo[win].conceallevel = 2
        vim.wo[win].concealcursor = ""
      end,
    },
  },
}
