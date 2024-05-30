return {
  "kristijanhusak/vim-dadbod-ui",
  event = "VeryLazy",

  keys = {
    { "<C-Enter>", "<Plug>(DBUI_ExecuteQuery)", mode = { "n", "v" }, ft = "sql", desc = "Execute query" },
  },

  dependencies = {
    "tpope/vim-dadbod",

    {
      "kristijanhusak/vim-dadbod-completion",
      ft = { "sql", "mysql", "plsql" },

      config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = { "sql", "mysql", "plsql" },
          callback = function()
            require("cmp").setup.buffer({
              sources = {
                { name = "vim-dadbod-completion" },
              },
            })
          end,
        })
      end,
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
