local util = require("user.util")

local project = util.safe_require("project_nvim")
if not project then return end

project.setup({
  detection_methods = { "lsp", "pattern" },
  manual_mode = false,
  ignore_lsp = { "null-ls" },
  on_config_done = nil,
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore" },
  show_hidden = true,
  silent_chdir = true,
})

local telescope = util.safe_require("telescope")
if not telescope then return end

telescope.load_extension("projects")
