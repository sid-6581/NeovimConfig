return {
  "tpope/vim-scriptease",
  event = "VeryLazy",

  config = function()
    vim.api.nvim_create_autocmd({ "BufReadPost" }, {
      pattern = { "*.scriptease*" },
      callback = function(event)
        vim.keymap.set("n", "q", "<CMD>bwipeout<CR>", { buffer = event.buf, silent = true, desc = "Close window" })
        vim.opt_local.winfixheight = false
      end,
    })
  end,
}
