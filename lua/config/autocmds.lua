-- Check if we need to reload the file when it changed
vim.cmd([[
  autocmd FocusGained * checktime
]])

-- Show cursor line only in active window
vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  callback = function()
    local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
    if ok and cl then
      vim.wo.cursorline = true
      vim.api.nvim_win_del_var(0, "auto-cursorline")
    end
  end,
})
vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
  callback = function()
    local cl = vim.wo.cursorline
    if cl then
      vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
      vim.wo.cursorline = false
    end
  end,
})

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Highlight on yank
vim.cmd([[
  autocmd TextYankPost * lua vim.highlight.on_yank({ higroup = 'Visual', timeout = 200 })
]])

-- Use q to close non-editor windows, and hide them from the buffer list
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function()
    vim.cmd([[
      nnoremap <silent> <buffer> q <CMD>close<CR> 
      set nobuflisted 
    ]])
  end,
})

-- Turn off comment-related formatting and automatic inserting of comment leaders
vim.cmd([[
  autocmd BufWinEnter * set formatoptions-=cro
]])

vim.cmd([[
  highlight link FloatBorder Normal
  highlight link NormalFloat Normal
]])
