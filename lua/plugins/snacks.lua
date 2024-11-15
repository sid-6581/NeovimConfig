return {
  "folke/snacks.nvim",

  keys = {
    { "]]", function() require("snacks").words.jump(vim.v.count1) end, mode = { "n", "t" }, desc = "Next reference [snacks]" },
    { "[[", function() require("snacks").words.jump(-vim.v.count1) end, mode = { "n", "t" }, desc = "Previous reference [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>ghf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit history (current file) [snacks]" },
    { "<Leader>ghl", function() require("snacks").git.blame_line() end, desc = "Lazygit history (line) [snacks]" },
    { "<Leader>ghc", function() require("snacks").lazygit.log() end, desc = "Lazygit history (cwd) [snacks]" },
  },

  opts = {
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    words = {
      enabled = true,
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
