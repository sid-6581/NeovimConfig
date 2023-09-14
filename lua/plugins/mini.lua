return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",

  config = function()
    require("mini.ai").setup({
      custom_textobjects = {
        a = false,
      },
      search_method = "cover",
    })

    require("mini.misc").setup_auto_root()

    require("mini.bracketed").setup({
      comment = { suffix = "C" },
    })

    require("mini.comment").setup({})

    require("mini.operators").setup({})

    require("mini.move").setup({
      mappings = {
        line_left = "<S-Tab>",
        line_right = "<Tab>",
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
