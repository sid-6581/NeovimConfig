return {
  "chrishrb/gx.nvim",
  event = "VeryLazy",

  keys = {
    { "gX", "<CMD>Browse<CR>", mode = { "n", "x" }, desc = "Browse" },
  },

  opts = {
    open_browser_app = (vim.fn.has("wsl") == 1) and "wslview" or nil,
  },
}
