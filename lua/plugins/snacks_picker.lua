return {
  "folke/snacks.nvim",
  event = "VeryLazy",

  keys = {
    { "<A-1>", function() require("snacks").explorer() end, desc = "File explorer [snacks]" },
    { "<C-'>", function() require("snacks").picker.recent({ filter = { cwd = true } }) end, desc = "Search recent project files [snacks]" },
    { "<C-.>", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<C-/>", function() require("snacks").picker.grep() end, desc = "Search text [snacks]" },
    { "<F1>", function() require("snacks").picker.help() end, desc = "Search help [snacks]" },
    { "<F3>", function() require("snacks").picker.keymaps() end, desc = "Search keymaps [snacks]" },
    { "<Leader>f:", function() require("snacks").picker.command_history() end, desc = "Search command history [snacks]" },
    { "<Leader>f/", function() require("snacks").picker.lines() end, desc = "Search buffer lines [snacks]" },
    { "<Leader>fC", function() require("snacks").picker.autocmds() end, desc = "Search autocommands [snacks]" },
    { "<Leader>fl", function() require("snacks").picker.loclist() end, desc = "Search loclist [snacks]" },
    { "<Leader>fL", function() require("snacks").picker.lazy() end, desc = "Search for Lazy plugin spec [snacks]" },
    { "<Leader>fR", function() require("snacks").picker.resume() end, desc = "Search resume [snacks]" },
    { "<Leader>fS", function() require("snacks").picker.icons() end, desc = "Search symbols [snacks]" },
    { "<Leader>fb", function() require("snacks").picker.buffers() end, desc = "Search buffers [snacks]" },
    { "<Leader>fc", function() require("snacks").picker.commands() end, desc = "Search commands [snacks]" },
    { "<Leader>fe", function() require("snacks").explorer() end, desc = "File explorer [snacks]" },
    { "<Leader>ff", function() require("snacks").picker.files() end, desc = "Search files [snacks]" },
    { "<Leader>fg", function() require("snacks").picker.git_status() end, desc = "Search git status [snacks]" },
    { "<Leader>fh", function() require("snacks").picker.highlights() end, desc = "Search highlights [snacks]" },
    { "<Leader>fj", function() require("snacks").picker.jumps() end, desc = "Search jumps [snacks]" },
    { "<Leader>fk", function() require("snacks").picker.keymaps() end, desc = "Search keymaps [snacks]" },
    { "<Leader>fn", function() require("snacks").picker.notifications() end, desc = "Search notification history [snacks]" },
    { "<Leader>fp", function() require("snacks").picker.projects() end, desc = "Search projects [snacks]" },
    {
      "<Leader>fP",
      function()
        require("snacks").picker.files({
          dirs = vim.fn.has("win32") == 1
            and { "D:/Code", vim.fn.expand("~/.local/share/nvim-data"), vim.fn.expand("~/.dotfiles") }
            or { vim.fn.expand("~/Code"), vim.fn.expand("~/.local/share/nvim") },
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
      enabled = true,

      layouts = {
        default = {
          layout = {
            backdrop = false,
            box = "horizontal",
            width = 0.9,
            min_width = 120,
            height = 0.9,
            {
              box = "vertical",
              border = "rounded",
              title = "{title} {live} {flags}",
              { win = "input", height = 1, border = "bottom" },
              { win = "list", border = "none" },
            },
            { win = "preview", title = "{preview}", border = "rounded", width = 0.5 },
          },
        },
        sidebar = {
          preview = "main",
          layout = {
            backdrop = false,
            width = 40,
            min_width = 40,
            height = 0,
            position = "left",
            title = "{title} {live} {flags}",
            title_pos = "center",
            border = "top",
            box = "vertical",
            {
              win = "input",
              height = 1,
              border = "bottom",
            },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
        vscode = {
          preview = false,
          layout = {
            backdrop = false,
            width = 0.5,
            min_width = 80,
            height = 0.4,
            min_height = 3,
            box = "vertical",
            border = "rounded",
            title = "{title}",
            title_pos = "center",
            { win = "input", height = 1, border = "bottom" },
            { win = "list", border = "none" },
            { win = "preview", title = "{preview}", height = 0.4, border = "top" },
          },
        },
      },

      sources = {
        explorer = {
          hidden = true,
          git_status_open = true,
        },
        files = {
          hidden = true,
        },
        grep = {
          hidden = true,
        },
        projects = {
          dev = vim.fn.has("win32") == 1
            and {
              "~/.local/share/nvim-data/lazy",
              "~/.dotfiles",
              --- @diagnostic disable-next-line: param-type-mismatch
              unpack(vim.fn.expand("D:/Code/*", nil, true)),
            }
            or {
              "~/.local/share/nvim/lazy",
              --- @diagnostic disable-next-line: param-type-mismatch
              unpack(vim.fn.expand("~/Code/*", nil, true)),
            },
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
