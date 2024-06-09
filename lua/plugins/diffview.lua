return {
  "sindrets/diffview.nvim",
  event = "VeryLazy",

  keys = {
    { "<Leader>gdv", "<CMD>DiffviewOpen<CR>", desc = "Diffview" },
    { "<Leader>gdh", "<CMD>DiffviewFileHistory %<CR>", desc = "Diffview file history" },
  },

  opts = {},

  init = function()
    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "DiffViewFileHistory", "DiffViewFiles" },
      callback = function(event)
        vim.keymap.set("n", "q", "<CMD>tabclose<CR>", { buffer = event.buf, silent = true })
      end,
    })
  end,
}
