return {
  "mrcjkb/rustaceanvim",

  config = function()
    vim.g.rustaceanvim = {
      tools = {
        float_win_config = {
          border = "single",
        },
      },
    }
  end,
}
