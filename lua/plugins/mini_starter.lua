return {
  "echasnovski/mini.starter",

  config = function()
    local starter = require("mini.starter")
    starter.setup({
      header = [[
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
░    ░░░░░   ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
▒  ▒   ▒▒▒   ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒  ▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒   ▒   ▒▒   ▒▒▒▒   ▒▒▒▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒   ▒▒▒▒▒    ▒   ▒   ▒▒
▓   ▓▓   ▓   ▓▓  ▓▓▓   ▓▓▓   ▓▓   ▓▓▓   ▓▓▓   ▓▓   ▓▓   ▓▓  ▓▓   ▓
▓   ▓▓▓  ▓   ▓         ▓▓   ▓▓▓▓   ▓▓▓   ▓   ▓▓▓   ▓▓   ▓▓  ▓▓   ▓
▓   ▓▓▓▓  ▓  ▓  ▓▓▓▓▓▓▓▓▓▓   ▓▓   ▓▓▓▓▓     ▓▓▓▓   ▓▓   ▓▓  ▓▓   ▓
█   ██████   ███     ███████   █████████   █████   █    ██  ██   █
██████████████████████████████████████████████████████████████████
        ]],
      evaluate_single = true,
      items = {
        {
          { name = "Edit new buffer", action = "enew", section = "Builtin actions" },
          { name = "Configuration", action = "e $MYVIMRC", section = "Builtin actions" },
          { name = "Open project", action = "call feedkeys(' fp')", section = "Builtin actions" },
          { name = "Notes (Obsidian)", action = "call feedkeys(' O')", section = "Builtin actions" },
          { name = "Quit Neovim", action = "qall", section = "Builtin actions" },
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
                  require("neo-tree.command").execute({ action = "show", dir = path })
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
        starter.gen_hook.indexing("all", { "Builtin actions" }),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
