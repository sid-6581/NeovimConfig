return {
  "folke/snacks.nvim",

  keys = {
    {
      "Q",
      function()
        require("util.winbuf").buffers_run({}, function(bufnr) vim.api.nvim_buf_delete(bufnr, {}) end)
        require("snacks").dashboard({ win = vim.api.nvim_get_current_win(), buf = vim.api.nvim_get_current_buf() })
      end,
      desc = "Show dashboard and delete all buffers [snacks]",
    },
  },

  --- @type snacks.Config
  opts = {
    --- @type table<string, snacks.win.Config>
    styles = {
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
          { icon = "󰱼 ", key = "f", desc = "Search Files", action = ":enew|call feedkeys(' ff')" },
          { icon = "󱎸 ", key = "s", desc = "Search Text", action = ":enew|call feedkeys(' ft')" },
          { icon = "󰊢 ", key = "gg", desc = "Git", action = ":enew|call feedkeys(' gg')" },
          { icon = "󰺿 ", key = "o", desc = "Obsidian", action = ":enew|call feedkeys(' O')" },
          { icon = "󰙅 ", key = "y", desc = "Yazi", action = ":enew|call feedkeys(' .')" },
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
}
