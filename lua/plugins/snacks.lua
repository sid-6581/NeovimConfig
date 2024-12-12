return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,

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
      dashboard = {
        wo = {
          winhighlight = "SnacksDashboardIcon:Title",
        },
      },
    },

    dashboard = {
      preset = {
        keys = {
          { icon = " ", key = "n", desc = "New File", action = ":enew" },
          { icon = " ", key = "c", desc = "Configuration", action = ":e $MYVIMRC" },
          { icon = "󰙅 ", key = "b", desc = "Browse Files", action = ":enew|call feedkeys(\"\\<M-1>\")" },
          { icon = " ", key = "p", desc = "Project Search", action = ":enew|call feedkeys(' fp')" },
          { icon = "󰱼 ", key = "f", desc = "File Search", action = ":enew|call feedkeys(' ff')" },
          { icon = "󱎸 ", key = "t", desc = "Text Search", action = ":enew|call feedkeys(' ft')" },
          { icon = "󰊢 ", key = "gg", desc = "Git", action = ":enew|call feedkeys(' gg')" },
          vim.fn.has("win32") == 1 and { icon = "󰺿 ", key = "o", desc = "Obsidian", action = ":enew|call feedkeys(' O')" } or nil,
          { icon = " ", key = "q", desc = "Quit", action = ":qall" },
        },
        header = [[
 ███▄    █  ▓█████ ▒█████   ██▒   █▓  ██▓ ███▄ ▄███▓
 ██ ▀█   █  ▓█   ▀▒██▒  ██▒▓██░   █▒▒▓██▒▓██▒▀█▀ ██▒
▓██  ▀█ ██▒ ▒███  ▒██░  ██▒ ▓██  █▒░▒▒██▒▓██    ▓██░
▓██▒  ▐▌██▒ ▒▓█  ▄▒██   ██░  ▒██ █░░░░██░▒██    ▒██
▒██░   ▓██░▒░▒████░ ████▓▒░   ▒▀█░  ░░██░▒██▒   ░██▒
░ ▒░   ▒ ▒ ░░░ ▒░ ░ ▒░▒░▒░    ░ ▐░   ░▓  ░ ▒░   ░  ░
░ ░░   ░ ▒░░ ░ ░    ░ ▒ ▒░    ░ ░░  ░ ▒ ░░  ░      ░
   ░   ░ ░     ░  ░ ░ ░ ▒        ░  ░ ▒ ░░      ░
         ░ ░   ░      ░ ░        ░    ░         ░
        ]],
      },

      formats = {
        file = function(item, ctx)
          local fname = vim.fn.fnamemodify(item.file, ":~")
          fname = ctx.width and #fname > ctx.width and vim.fn.pathshorten(fname) or fname
          if #fname > ctx.width then
            local dir = vim.fn.fnamemodify(fname, ":h")
            local file = vim.fn.fnamemodify(fname, ":t")
            if dir and file then
              file = file:sub(-(ctx.width - #dir - 2))
              fname = dir .. "/…" .. file
            end
          end

          local dir, file = fname:match("^(.*)[\\/](.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },

      sections = {
        { section = "header" },
        { section = "keys", padding = 1 },
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },

        function()
          local in_git = require("snacks").git.get_root() ~= nil

          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "gi",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "gp",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }

          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,

        { section = "startup" },
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

    vim.api.nvim_create_autocmd(
      { "User" },
      {
        pattern = "SnacksDashboardOpened",
        callback = function()
          vim.o.laststatus = 3
        end,
      })
  end,
}
