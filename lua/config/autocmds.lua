local util = require("util")

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

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
    "PlenaryTestPopup",
    "help",
    "lspinfo",
    "man",
    "notify",
    "qf",
    "query",
    "spectre_panel",
    "startuptime",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<CMD>close<CR>", { buffer = event.buf, silent = true })
  end,
})

vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "DiffViewFileHistory", "DiffViewFiles" },
  callback = function(event) vim.keymap.set("n", "q", "<CMD>tabclose<CR>", { buffer = event.buf, silent = true }) end,
})

-- Turn off filetype indent for vue, because it uses HTML indent which doesn't work with pug
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "vue" },
  callback = function() vim.opt_local.indentkeys = nil end,
})

-- Turn off comment-related formatting and automatic inserting of comment leaders
vim.api.nvim_create_autocmd({ "BufWinEnter", "FileType" }, {
  callback = function() vim.opt.formatoptions:remove({ "c", "r", "o" }) end,
})

-- vim.api.nvim_create_autocmd({ "CmdlineLeave" }, {
--   callback = function()
--     vim.defer_fn(function() vim.cmd('echon ""') end, 2000)
--   end,
-- })
