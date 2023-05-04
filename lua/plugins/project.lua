return {
  "ahmedkhalf/project.nvim",

  config = function()
    require("project_nvim").setup({
      ignore_lsp = { "null-ls" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore", "*" },
      scope_chdir = "tab",
      show_hidden = true,
      silent_chdir = true,
    })
  end,
}
