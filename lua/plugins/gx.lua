return {
  "chrishrb/gx.nvim",
  event = "VeryLazy",
  submodules = false,

  keys = {
    { "gX", "<CMD>Browse<CR>", mode = { "n", "x" }, desc = "Browse [gx]" },
    { "<C-CR>", "<CMD>Browse<CR>", mode = { "n", "x" }, desc = "Browse [gx]" },
  },

  opts = {
    open_browser_app = (vim.fn.has("wsl") == 1) and "wslview" or nil,
  },
}
