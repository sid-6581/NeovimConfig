local M = {}

M.fd_command = {
  "fd",
  "--no-ignore-vcs",
  "--hidden",
}

M.rg_command = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--multiline",
  "--smart-case",
  "--no-ignore-vcs",
  "--hidden",
}

return M
