return {
  "echasnovski/mini.starter",

  config = function()
    local starter = require("mini.starter")
    starter.setup({
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

      evaluate_single = true,
      query_updaters = "abcdefghilmnopqrstuvwxyzABCDEFGHILMNOPQRSTUVWXYZ0123456789_-.",

      items = {
        {
          { name = "New file", action = "enew", section = "Actions" },
          { name = "Configuration", action = "e $MYVIMRC", section = "Actions" },
          { name = "Browse files", action = "enew|call feedkeys(\"\\<M-1>\")", section = "Actions" },
          { name = "Project search", action = "enew|call feedkeys(' fp')", section = "Actions" },
          { name = "File search", action = "enew|call feedkeys(' ff')", section = "Actions" },
          { name = "Text search", action = "enew|call feedkeys(' ft')", section = "Actions" },
          { name = "Git", action = "enew|call feedkeys(' gg')", section = "Actions" },
          vim.fn.has("win32") == 1 and { name = "Obsidian", action = "enew|call feedkeys(' O')", section = "Actions" } or nil,
          { name = "Quit", action = "qall", section = "Actions" },
        },

        starter.sections.recent_files(20, false, false),
      },

      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing("all", { "Actions" }),
        starter.gen_hook.aligning("center", "center"),
      },

      silent = true,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "MiniStarterOpened",

      callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "j", function() starter.update_current_item("next") end, { buffer = bufnr })
        vim.keymap.set("n", "k", function() starter.update_current_item("prev") end, { buffer = bufnr })
      end,
    })
  end,
}
