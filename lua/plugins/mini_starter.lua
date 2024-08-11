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
          { name = "Edit new buffer", action = "enew", section = "Actions" },
          { name = "Configuration", action = "e $MYVIMRC", section = "Actions" },
          { name = "Projects", action = "call feedkeys(' fp')", section = "Actions" },
          { name = "Find files", action = "call feedkeys(' ff')", section = "Actions" },
          { name = "Search text", action = "call feedkeys(' ft')", section = "Actions" },
          (vim.fn.has("win32") == 1) and { name = "Notes (Obsidian)", action = "call feedkeys(' O')", section = "Actions" } or nil,
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

        starter.sections.recent_files(10, false),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing("all", { "Actions" }),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
