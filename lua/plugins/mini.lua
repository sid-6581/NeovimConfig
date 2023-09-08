return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",

  config = function()
    require("mini.ai").setup({
      custom_textobjects = {
        a = false,
      },
    })

    require("mini.bracketed").setup({})
    require("mini.operators").setup({
      comment = { suffix = "C" },
    })
  end,
}
