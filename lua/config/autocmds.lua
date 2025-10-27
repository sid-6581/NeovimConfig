local winbuf = require("util.winbuf")

-- Check if we need to reload the file when it changed.
vim.api.nvim_create_autocmd(
  { "FocusGained", "TermClose", "TermLeave" },
  {
    command = "checktime",
  }
)

-- Turn off comment-related formatting and automatic inserting of comment leaders.
-- vim.api.nvim_create_autocmd(
--   { "BufWinEnter", "FileType" },
--   {
--     callback = function()
--       vim.opt.formatoptions:remove({ "c", "r", "o" })
--     end,
--   }
-- )

-- Turn off filetype indent for vue, because it doesn't work great in templates with code.
vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "vue" },
    callback = function()
      vim.opt_local.indentkeys = nil
    end,
  }
)

-- Turn off filetype indent for yaml.
vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "yaml" },
    callback = function()
      vim.opt_local.indentkeys = nil
    end,
  }
)

-- Treat checkboxes as comments in markdown files for easy list continuation.
vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "markdown" },
    callback = function()
      vim.opt_local.comments:remove("fb:-")
      vim.opt_local.comments:append("b:- [ ]")
      vim.opt_local.comments:append("fb:-")
      vim.opt_local.formatoptions:append({ r = true, o = true })
    end,
  }
)

-- Delete hidden no name buffers and checkhealth buffers every time a buffer is hidden.
vim.api.nvim_create_autocmd(
  { "BufHidden", "BufNew" },
  {
    callback = function()
      winbuf.buffers_run(
        { hidden = true },
        function(bufnr)
          if winbuf.buf_filter({ noname = true }, bufnr) or winbuf.buf_filter({ filetype = "checkhealth" }, bufnr) then
            vim.api.nvim_buf_delete(bufnr, { force = true })
          end
        end
      )
    end,
  }
)

-- Turn off hlsearch automatically.
vim.api.nvim_create_autocmd(
  { "CursorMoved", "CursorMovedI" },
  {
    callback = function()
      if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
        vim.schedule(function() vim.cmd.nohlsearch() end)
      end
    end,
  }
)

-- Make sure <CR> isn't remapped in quickfix window.
vim.api.nvim_create_autocmd(
  { "FileType" },
  {
    pattern = { "qf" },
    callback = function()
      vim.keymap.set("n", "<CR>", "<CR>", { buffer = true })
    end,
  }
)
