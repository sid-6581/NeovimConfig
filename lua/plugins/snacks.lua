return {
  "folke/snacks.nvim",
  lazy = false,
  priority = 1000,

  keys = {
    {
      "Q",
      function()
        require("util.winbuf").buffers_run({}, function(bufnr) vim.api.nvim_buf_delete(bufnr, {}) end)
        require("snacks").dashboard({ win = vim.api.nvim_get_current_win(), buf = vim.api.nvim_get_current_buf() })
      end,
      desc = "Show dashboard and delete all buffers [snacks]",
    },
    { "<A-s>", function() require("snacks").scratch() end, desc = "Toggle scratch buffer [snacks]" },
    { "<S-A-s>", function() require("snacks").scratch.select() end, desc = "Select scratch buffer [snacks]" },
    { "<Leader>gB", function() require("snacks").gitbrowse() end, desc = "Git browse [snacks]" },
    { "<Leader>gg", function() require("snacks").lazygit() end, desc = "Lazygit [snacks]" },
    { "<Leader>gl", function() require("snacks").git.blame_line() end, desc = "Git history (line) [snacks]" },
    { "[[", function() require("snacks").words.jump(-vim.v.count1) end, desc = "Previous reference [snacks]" },
    { "]]", function() require("snacks").words.jump(vim.v.count1) end, desc = "Next reference [snacks]" },
    {
      "<C-->",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "bottom" }, win = { position = "bottom" } }) end,
      mode = { "n", "t" },
      desc = "Horizontal terminal [snacks]",
    },
    {
      "<C-=>",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "float" }, win = { position = "float" } }) end,
      mode = { "n", "t" },
      desc = "Float terminal [snacks]",
    },
    {
      "<C-\\>",
      function() require("snacks").terminal("nu -i", { env = { ["SNACKS_TERMINAL"] = "right" }, win = { position = "right" } }) end,
      mode = { "n", "t" },
      desc = "Vertical terminal [snacks]",
    },
    { "<Leader>ty", function() require("snacks").terminal("yazi") end, desc = "Yazi [snacks]" },
  },

  --- @type snacks.Config
  opts = {
    indent = {
      enabled = true,

      animate = {
        enabled = false,
      },

      indent = {
        enabled = false,
        only_scope = true,
        only_current = true,
        hl = "Constant",
      },

      scope = {
        enabled = false,
        only_current = true,
        hl = "Constant",
      },

      chunk = {
        enabled = true,
        char = {
          corner_top = "╭",
          corner_bottom = "╰",
        },
        hl = "Constant",
      },
    },


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

    --- @type table<string, snacks.win.Config>
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
      float = {
        backdrop = false,
        border = "rounded",
      },
      zen = {
        border = "none",
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

  config = function(_, opts)
    local snacks = require("snacks")
    snacks.setup(opts)

    _G.dd = function(...)
      require("snacks").debug.inspect(...)
    end

    _G.bt = function()
      require("snacks").debug.backtrace()
    end

    vim.print = _G.dd

    --- Show a window.
    --- @param opts? snacks.win.Config
    --- @return snacks.win
    --- @diagnostic disable-next-line: redefined-local
    _G.win = function(opts)
      if opts then
        local text = type(opts.text) == "function" and opts.text() or opts.text
        text = type(text) == "string" and vim.split(text, "\n") or text
        opts = vim.tbl_extend("force", opts, { text = text })
      end

      return require("snacks").win.new(opts)
    end

    --- Show a lua object in a window.
    --- @param obj any
    --- @param opts? snacks.win.Config
    --- @return snacks.win
    --- @diagnostic disable-next-line: redefined-local
    _G.show = function(obj, opts)
      return win(vim.tbl_extend("force", opts or {}, { ft = "lua", text = vim.inspect(obj) }))
    end

    snacks.toggle.option("buflisted"):map("<Leader>bl")
    snacks.toggle.option("modified"):map("<Leader>bm")
    snacks.toggle.option("cursorcolumn"):map("<Leader>uC")
    snacks.toggle.option("cursorline"):map("<Leader>uc")
    snacks.toggle.option("wrap"):map("<Leader>uw")
    snacks.toggle.option("relativenumber"):map("<Leader>ur")
    snacks.toggle.inlay_hints({ name = "inlay hints" }):map("<Leader>uh")
    snacks.toggle.line_number({ name = "line numbers" }):map("<Leader>ul")
    snacks.toggle.diagnostics():map("<Leader>ud")
    snacks.toggle.zoom():map("<A-=>")

    snacks.toggle({
      name = "auto format (buffer)",
      get = function()
        return not vim.b[vim.api.nvim_get_current_buf()].disable_autoformat
      end,
      set = function(state)
        vim.b[vim.api.nvim_get_current_buf()].disable_autoformat = not state
      end,
    }):map("<Leader>uf")

    snacks.toggle({
      name = "auto format (global)",
      get = function()
        return not vim.g.disable_autoformat
      end,
      set = function(state)
        vim.g.disable_autoformat = not state
      end,
    }):map("<Leader>uF")
  end,
}
