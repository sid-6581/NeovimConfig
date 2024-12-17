return {
  "echasnovski/mini.splitjoin",
  event = "VeryLazy",

  opts = function()
    local gen_hook = require("mini.splitjoin").gen_hook
    local brackets = { brackets = { "%b{}" } }

    return {
      mappings = {
        toggle = "gM",
        join = "gJ",
        split = "gS",
      },
      detect = {
        separator = "[,;]",
      },
      split = {
        hooks_post = {
          gen_hook.add_trailing_separator(brackets),
        },
      },
      join = {
        hooks_post = {
          gen_hook.del_trailing_separator(brackets),
          gen_hook.pad_brackets(brackets),
        },
      },
    }
  end,
}
