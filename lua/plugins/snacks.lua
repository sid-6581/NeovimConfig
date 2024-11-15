return {
  "folke/snacks.nvim",

  keys = {
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>hc", function() require("snacks").lazygit.log() end, desc = "Lazygit history (cwd) [snacks]" },
    { "<Leader>hf", function() require("snacks").lazygit.log_file() end, desc = "Lazygit history (current file) [snacks]" },
    { "<Leader>hl", function() require("snacks").git.blame_line() end, desc = "Git history (line) [snacks]" },
    { "[[", function() require("snacks").words.jump(-vim.v.count1) end, mode = { "n", "t" }, desc = "Previous reference [snacks]" },
    { "]]", function() require("snacks").words.jump(vim.v.count1) end, mode = { "n", "t" }, desc = "Next reference [snacks]" },
  },

  --- @type snacks.Config
  opts = {
    notifier = {
      enabled = true,
      timeout = 5000,
    },
    win = {
      backdrop = false,
    },
    words = {
      enabled = true,
    },
    styles = {
      lazygit = {
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
