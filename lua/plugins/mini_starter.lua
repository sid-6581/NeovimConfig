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
      query_updaters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_-.",

      items = {
        {
          { name = "New file", action = "enew", section = "Actions" },
          { name = "Configuration", action = "e $MYVIMRC", section = "Actions" },
          { name = "Project search", action = "enew|call feedkeys(' fp')", section = "Actions" },
          { name = "File search", action = "enew|call feedkeys(' ff')", section = "Actions" },
          { name = "Text search", action = "enew|call feedkeys(' ft')", section = "Actions" },
          { name = "Git", action = "enew|call feedkeys(' gg')", section = "Actions" },
          vim.fn.has("win32") == 1 and { name = "Obsidian", action = "enew|call feedkeys(' O')", section = "Actions" } or nil,
          { name = "Quit", action = "qall", section = "Actions" },
        },

        vim.list_slice(
          vim.tbl_map(
            function(path)
              path = vim.fn.fnamemodify(path, ":~")
              return {
                name = path,
                action = function()
                  vim.cmd.enew()
                  vim.cmd.lcd(path)
                  require("neo-tree.command").execute({ action = "show", dir = vim.fn.expand(path) })
                end,
                section = "Projects",
              }
            end,
            vim.tbl_keys(require("mini.visits").get_index())
          ),
          1, 10
        ),

        starter.sections.recent_files(10, false, false),
      },

      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing("all", { "Actions" }),
        starter.gen_hook.aligning("center", "center"),
      },

      silent = true,
    })
  end,
}
