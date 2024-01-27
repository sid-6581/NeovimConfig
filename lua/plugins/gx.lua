return {
  "chrishrb/gx.nvim",
  event = "VeryLazy",
  keys = { { "gX", "<cmd>Browse<cr>", mode = { "n", "x" } } },

  init = function()
    vim.g.netrw_nogx = 1 -- disable netrw gx
  end,

  opts = {
    open_browser_app = (vim.fn.has("win32") == 1) and "powershell.exe" or "wslview",
  },
}
