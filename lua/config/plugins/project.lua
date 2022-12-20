local M = {
  "ahmedkhalf/project.nvim",
}

function M.config()
  local project = require("project_nvim")

  project.setup({
    detection_methods = { "lsp", "pattern" },
    manual_mode = false,
    ignore_lsp = { "null-ls" },
    on_config_done = nil,
    patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore" },
    show_hidden = true,
    silent_chdir = true,
  })

  local telescope = require("telescope")

  telescope.load_extension("projects")
end

return M
