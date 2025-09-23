return {
  "nvim-mini/mini.icons",
  priority = 2000,

  opts = {},

  config = function(_, opts)
    require("mini.icons").setup(opts)
    require("mini.icons").mock_nvim_web_devicons()
  end,
}
