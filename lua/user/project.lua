local util = require("user.util")

local project = util.safe_require("project_nvim")
if not project then return end

project.setup({
  on_config_done = nil,
  manual_mode = false,
  detection_methods = { "lsp", "pattern" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore" },
  show_hidden = true,
  silent_chdir = true,
})

local telescope = util.safe_require("telescope")
if not telescope then return end

telescope.load_extension("projects")
