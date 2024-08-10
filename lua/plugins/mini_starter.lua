return {
  "echasnovski/mini.starter",

  config = function()
    local starter = require("mini.starter")
    starter.setup({
      header = "",
      evaluate_single = true,
      items = {
        {
          { name = "Edit new buffer", action = "enew", section = "Builtin actions" },
          { name = "Configuration", action = "e $MYVIMRC", section = "Builtin actions" },
          { name = "Open project", action = "call feedkeys(' fp')", section = "Builtin actions" },
          { name = "Quit Neovim", action = "qall", section = "Builtin actions" },
        },
        starter.sections.recent_files(20, false),
      },
      content_hooks = {
        starter.gen_hook.adding_bullet(),
        starter.gen_hook.indexing("all", { "Builtin actions" }),
        starter.gen_hook.aligning("center", "center"),
      },
    })
  end,
}
