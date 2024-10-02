local winbuf = require("util.winbuf")

-- Normalize paths for Windows buffers
-- if vim.fn.has("win32") == 1 then
--   vim.api.nvim_create_autocmd({ "BufRead" }, {
--     callback = function()
--       vim.api.nvim_buf_set_name(0, util.normalize_path(vim.api.nvim_buf_get_name(0)))
--     end,
--   })
--   vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
--     callback = function()
--       util.clean_oldfiles()
--     end,
--   })
--   util.clean_oldfiles()
-- end

-- Check if we need to reload the file when it changed
vim.api.nvim_create_autocmd(
  { "FocusGained", "TermClose", "TermLeave" },
  {
    command = "checktime",
  }
)

-- Turn off filetype indent for vue, because it uses HTML indent which doesn't work with pug
vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "vue" },
    callback = function()
      vim.opt_local.indentkeys = nil
    end,
  }
)

-- Turn off comment-related formatting and automatic inserting of comment leaders
vim.api.nvim_create_autocmd(
  { "BufWinEnter", "FileType" },
  {
    callback = function()
      vim.opt.formatoptions:remove({ "c", "r", "o" })
    end,
  }
)

-- Delete hidden no name buffers every time a new one is opened
vim.api.nvim_create_autocmd(
  { "BufHidden" },
  {
    callback = function()
      winbuf.buffers_run(
        { noname = true, hidden = true },
        function(bufnr)
          vim.api.nvim_buf_delete(bufnr, { force = true })
        end
      )
    end,
  }
)

-- Turn off hlsearch automatically
vim.api.nvim_create_autocmd(
  { "CursorMoved", "CursorMovedI" },
  {
    group = vim.api.nvim_create_augroup("auto-hlsearch", { clear = true }),
    callback = function()
      if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
        vim.schedule(function() vim.cmd.nohlsearch() end)
      end
    end,
  }
)
