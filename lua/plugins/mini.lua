return {
  "echasnovski/mini.nvim",
  event = "VeryLazy",

  config = function()
    require("mini.ai").setup({
      custom_textobjects = {
        a = false,
      },
    })

    require("mini.operators").setup({})
  end,
}
