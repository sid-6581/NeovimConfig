return {
  "tpope/vim-scriptease",
  event = "VeryLazy",

  config = function()
    vim.api.nvim_create_autocmd({ "BufReadPost" }, {
      pattern = { "*.scriptease*" },
      callback = function()
        vim.opt_local.winfixheight = false
      end,
    })
  end,
}
