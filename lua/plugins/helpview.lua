return {
  "OXY2DEV/helpview.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<Leader>uvh",
      function()
        require("helpview").commands.toggleAll()
        vim.notify("Toggled helpview (global)")
      end,
      desc = "Toggle helpview (global) [helpview]",
    },
    {
      "<Leader>uvH",
      function()
        require("helpview").commands.toggle()
        vim.notify("Toggled helpview (buffer)")
      end,
      desc = "Toggle helpview (buffer) [helpview]",
    },
  },

  opts = {},
}
