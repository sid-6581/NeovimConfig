local util = require("util")

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

-- Highlight on yank
-- Not needed right now with Yanky enabled
-- vim.api.nvim_create_autocmd("TextYankPost", {
--   callback = function() vim.highlight.on_yank({ higroup = "Visual", timeout = 200 }) end,
-- })

-- Show cursor line only in active window
-- vim.api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
--   callback = function()
--     local ok, cl = pcall(vim.api.nvim_win_get_var, 0, "auto-cursorline")
--     if ok and cl then
--       vim.wo.cursorline = true
--       vim.api.nvim_win_del_var(0, "auto-cursorline")
--     end
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "InsertEnter", "WinLeave" }, {
--   callback = function()
--     local cl = vim.wo.cursorline
--     if cl then
--       vim.api.nvim_win_set_var(0, "auto-cursorline", cl)
--       vim.wo.cursorline = false
--     end
--   end,
-- })

-- Fix conceallevel for json & help files
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json", "jsonc" },
  callback = function()
    vim.wo.spell = false
    vim.wo.conceallevel = 0
  end,
})

-- Normalize paths for Windows buffers
if vim.fn.has("win32") == 1 then
  vim.api.nvim_create_autocmd({ "BufRead" }, {
    callback = function() vim.api.nvim_buf_set_name(0, util.normalize_path(vim.api.nvim_buf_get_name(0))) end,
  })
  vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
    callback = function() util.clean_oldfiles() end,
  })
  util.clean_oldfiles()
end

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
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<CMD>close<CR>", { buffer = event.buf, silent = true })
  end,
})

-- Turn off filetype indent for filetypes
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "vue" },
  callback = function() vim.opt_local.indentkeys = nil end,
})

-- Turn off comment-related formatting and automatic inserting of comment leaders
vim.api.nvim_create_autocmd("BufWinEnter", {
  callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end,
})
