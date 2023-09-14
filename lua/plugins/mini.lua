return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",

  config = function()
    require("mini.misc").setup_auto_root()

    require("mini.ai").setup({
      custom_textobjects = {
        a = false,
      },
      search_method = "cover",
    })

    require("mini.align").setup({})

    require("mini.bracketed").setup({
      comment = { suffix = "C" },
    })

    require("mini.comment").setup({})

    require("mini.move").setup({
      mappings = {
        line_left = "<S-Tab>",
        line_right = "<Tab>",
      },
    })

    require("mini.operators").setup({})

    local gen_hook = require("mini.splitjoin").gen_hook
    local brackets = { brackets = { "%b{}" } }

    require("mini.splitjoin").setup({
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
    })

    require("mini.surround").setup({
      mappings = {
        add = "<Leader>sa",
        delete = "<Leader>sd",
        find = "<Leader>sf",
        find_left = "<Leader>sF",
        highlight = "<Leader>sh",
        replace = "<Leader>sr",
        update_n_lines = "<Leader>sn",
        suffix_last = "l",
        suffix_next = "n",
      },
    })
  end,
}
