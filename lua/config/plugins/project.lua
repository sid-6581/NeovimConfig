local M = {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
}

function M.config()
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

  local telescope = require("telescope")
  telescope.load_extension("projects")
end

return M
