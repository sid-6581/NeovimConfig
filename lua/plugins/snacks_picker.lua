return {
  "folke/snacks.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-.>", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<C-/>", function() require("snacks").picker.grep() end, desc = "Search text [snacks]" },
    { "<F1>", function() require("snacks").picker.help() end, desc = "Search help [snacks]" },
    { "<F3>", function() require("snacks").picker.keymaps() end, desc = "Search keymaps [snacks]" },
    { "<Leader>:", function() require("snacks").picker.command_history() end, desc = "Search command history [snacks]" },
    { "<Leader>f/", function() require("snacks").picker.lines() end, desc = "Search buffer lines [snacks]" },
    { "<Leader>fC", function() require("snacks").picker.autocmds() end, desc = "Search autocommands [snacks]" },
    { "<Leader>fL", function() require("snacks").picker.lazy() end, desc = "Search for Lazy plugin spec [snacks]" },
    { "<Leader>fR", function() require("snacks").picker.resume() end, desc = "Search resume [snacks]" },
    { "<Leader>fS", function() require("snacks").picker.icons() end, desc = "Search symbols [snacks]" },
    { "<Leader>fb", function() require("snacks").picker.buffers() end, desc = "Search buffers [snacks]" },
    { "<Leader>fc", function() require("snacks").picker.commands() end, desc = "Search commands [snacks]" },
    { "<Leader>fe", function() require("snacks").explorer() end, desc = "File explorer [snacks]" },
    { "<Leader>ff", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<Leader>fg", function() require("snacks").picker.git_files() end, desc = "Search git files [snacks]" },
    { "<Leader>fh", function() require("snacks").picker.highlights() end, desc = "Search highlights [snacks]" },
    { "<Leader>fk", function() require("snacks").picker.keymaps() end, desc = "Search keymaps [snacks]" },
    { "<Leader>fn", function() require("snacks").picker.notifications() end, desc = "Search notification history [snacks]" },
    {
      "<Leader>fp",
      function()
        require("snacks").picker.files({
          dirs = vim.fn.has("win32") == 1
            and { "D:/Code", vim.fn.expand("~/.local/share/nvim-data"), vim.fn.expand("~/.dotfiles") }
            or { vim.fn.expand("~/") },
        })
      end,
      desc = "Search projects [snacks]",
    },
    { "<Leader>fr", function() require("snacks").picker.recent() end, desc = "Search recent [snacks]" },
    { "<Leader>fs", function() require("snacks").picker.grep() end, desc = "Search text [snacks]" },
    { "<Leader>fu", function() require("snacks").picker.undo() end, desc = "Search undo history [snacks]" },
    { "<Leader>fw", function() require("snacks").picker.grep_word() end, mode = { "n", "x" }, desc = "Search for word [snacks]" },
  },

  --- @type snacks.Config
  opts = {
    picker = {
      layouts = {
        default = {
          layout = {
            width = 0.9,
            height = 0.9,
            backdrop = false,
          },
        },
      },

      sources = {
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
      },

      win = {
        input = {
          keys = {
            ["<Esc>"] = { "close", mode = { "n", "i" } },
            ["<F1>"] = { "toggle_help_input", mode = { "n", "i" } },
          },
        },
      },
    },
  },
}
