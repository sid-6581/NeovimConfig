return {
  "folke/snacks.nvim",

  keys = {
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>gL", function() require("snacks").git.blame_line() end, desc = "Git history (line) [snacks]" },
    { "[[", function() require("snacks").words.jump(-vim.v.count1) end, desc = "Previous reference [snacks]" },
    { "]]", function() require("snacks").words.jump(vim.v.count1) end, desc = "Next reference [snacks]" },
    {
      "<C-->",
      function() require("snacks").terminal("nu -li", { env = { ["SNACKS_TERMINAL"] = "bottom" }, win = { position = "bottom" } }) end,
      mode = { "n", "t" },
      desc = "Horizontal terminal [snacks]",
    },
    {
      "<C-=>",
      function() require("snacks").terminal("nu -li", { env = { ["SNACKS_TERMINAL"] = "float" }, win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "Float terminal [snacks]",
    },
    {
      "<C-\\>",
      function() require("snacks").terminal("nu -li", { env = { ["SNACKS_TERMINAL"] = "right" }, win = { position = "right" } }) end,
      mode = { "n", "t" },
      desc = "Vertical terminal [snacks]",
    },
    { "<Leader>ty", function() require("snacks").terminal("yazi") end, desc = "Yazi [snacks]" },
  },

  --- @type snacks.Config
  opts = {
    lazygit = {
      --- @diagnostic disable-next-line: missing-fields
      theme = {
        activeBorderColor = { fg = "MoreMsg" },
      },
    },
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    terminal = {
      win = {
        wo = {
          winbar = "",
        },
      },
    },
    win = {
      backdrop = false,
    },
    words = {
      enabled = true,
      debounce = 0,
    },
    styles = {
      lazygit = {
        border = "rounded",
      },
      terminal = {
        border = "rounded",
      },
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
