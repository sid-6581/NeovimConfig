return {
  "echasnovski/mini.misc",
  priority = 1000,

  config = function()
    require("mini.misc").setup_auto_root(
      { ".git", "Makefile", ".obsidian" },
      function(path) return vim.fs.dirname(path) end
    )
  end,
}
