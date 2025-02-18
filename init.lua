require("config.options")
require("config.autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  defaults = {
    lazy = false,
  },
  install = {
    colorscheme = {
      "gruvbox",
    },
  },
  headless = {
    process = false,
    log = false,
    task = false,
    colors = true,
  },
  ui = {
    border = "rounded",
  },
  checker = {
    enabled = true,
  },
  dev = {
    path = vim.fn.has("win32") == 1 and "D:/Code/Forks" or "~/code/forks",
  },
  performance = {
    rtp = {
      reset = false,
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
