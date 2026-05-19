return {
  "folke/snacks.nvim",

  -- keys = {
  --   {
  --     "Q",
  --     function()
  --       require("util.winbuf").buffers_run({}, function(bufnr) vim.api.nvim_buf_delete(bufnr, {}) end)
  --       require("snacks").dashboard({ win = vim.api.nvim_get_current_win(), buf = vim.api.nvim_get_current_buf() })
  --     end,
  --     desc = "Show dashboard and delete all buffers [snacks]",
  --   },
  -- },

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
          { icon = " ", key = "n", desc = "New file", action = ":enew" },
          { icon = " ", key = "c", desc = "Configuration", action = ":e $MYVIMRC" },
          { icon = "󰙅 ", key = "b", desc = "Browse files", action = ":enew|call feedkeys(\"\\<M-1>\")" },
          { icon = " ", key = ".", desc = "Browse directory", action = ":e ." },
          { icon = "󰺄 ", key = "p", desc = "Project search", action = ":enew|call feedkeys(' fp')" },
          { icon = "󰱼 ", key = "f", desc = "Search files", action = ":enew|call feedkeys(' ff')" },
          { icon = "󱎸 ", key = "s", desc = "Search text", action = ":enew|call feedkeys(' fs')" },
          { icon = "󰊢 ", key = "g", desc = "Git", action = ":enew|call feedkeys(' gg')" },
          { icon = "󰺿 ", key = "o", desc = "Obsidian", action = ":enew|call feedkeys(' O')" },
          { icon = " ", key = "q", desc = "Quit", action = ":qall" },
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
          fname = require("snacks.picker.util").truncate(fname, ctx.width, true)
          local dir, file = fname:match("^(.*)[\\/](.+)$")
          return dir and { { dir .. "/", hl = "dir" }, { file, hl = "file" } } or { { fname, hl = "file" } }
        end,
      },

      sections = {
        { section = "header" },
        { section = "keys", padding = 1 },
        { icon = " ", title = "Recent Files", section = "recent_files", limit = 10, indent = 2, padding = 1 },
        -- { icon = " ", title = "Projects", section = "projects", limit = 5, session = false, indent = 2, padding = 1 },

        -- function()
        --   local in_git = require("snacks").git.get_root() ~= nil
        --
        --   local cmds = {
        --     {
        --       title = "Open Issues",
        --       cmd = "PAGER= gh issue list -L 3 || true",
        --       key = "I",
        --       action = function()
        --         vim.fn.jobstart("gh issue list --web", { detach = true })
        --       end,
        --       icon = " ",
        --       height = 10,
        --     },
        --     {
        --       icon = " ",
        --       title = "Open PRs",
        --       cmd = "PAGER= gh pr list -L 3 || true",
        --       key = "P",
        --       action = function()
        --         vim.fn.jobstart("gh pr list --web", { detach = true })
        --       end,
        --       height = 10,
        --     },
        --     {
        --       icon = " ",
        --       title = "Git Status",
        --       cmd = "PAGER= git --no-pager diff --stat -B -M -C || true",
        --       height = 10,
        --     },
        --   }
        --
        --   return vim.tbl_map(function(cmd)
        --     return vim.tbl_extend("force", {
        --       pane = 2,
        --       section = "terminal",
        --       enabled = in_git,
        --       padding = 1,
        --       ttl = 5 * 60,
        --       indent = 3,
        --     }, cmd)
        --   end, cmds)
        -- end,

        { section = "startup" },
      },
    },
  },
}
