return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VeryLazy",

  keys = {
    { "<Leader>D", "<CMD>DBUI<CR>", desc = "Database [dadbod]" },
    { "<C-Enter>", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, ft = "sql", desc = "Execute query [dadbod]" },
  },

  dependencies = {
    "tpope/vim-dadbod",

    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },
    },
  },

  init = function()
    vim.g.db_ui_execute_on_save = 0
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_ui_use_nvim_notify = 1
  end,

  config = function()
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "dbout" },
      callback = function()
        vim.opt_local.winfixheight = false
        vim.cmd.wincmd("=")
      end,
    })

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "dbui" },
      callback = function() vim.opt_local.winfixheight = false end,
    })
  end,
}
