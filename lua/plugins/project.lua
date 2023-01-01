return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",

  config = function()
    local project = require("project_nvim")

    project.setup({
      detection_methods = { "lsp", "pattern" },
      manual_mode = false,
      ignore_lsp = { "null-ls" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore" },
      scope_chdir = "tab",
      show_hidden = true,
      silent_chdir = true,
    })
  end,
}
