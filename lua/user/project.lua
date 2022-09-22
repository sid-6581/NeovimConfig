local status_ok, project = pcall(require, "project_nvim")
if not status_ok then
  return
end

project.setup({
  on_config_done = nil,
  manual_mode = false,
  detection_methods = { "pattern", "lsp" },
  patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".gitignore" },
  show_hidden = true,
  silent_chdir = true,
})

local telescope_status_ok, telescope = pcall(require, "telescope")
if not telescope_status_ok then
  return
end

telescope.load_extension("projects")
