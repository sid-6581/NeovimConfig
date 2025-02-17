return {
  "hat0uma/csvview.nvim",
  event = "VeryLazy",
  ft = "csv",

  --- @module "csvview"
  --- @type CsvView.Options
  opts = {
    parser = { comments = { "#", "//" } },
    keymaps = {
      textobject_field_inner = { "if", mode = { "o", "x" } },
      textobject_field_outer = { "af", mode = { "o", "x" } },
      jump_next_field_start = { "<Tab>", mode = { "n", "v" } },
      jump_prev_field_start = { "<S-Tab>", mode = { "n", "v" } },
      jump_next_row = { "<Enter>", mode = { "n", "v" } },
      jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
    },
  },

  config = function(_, opts)
    require("csvview").setup(opts)

    vim.api.nvim_create_autocmd(
      { "FileType" },
      {
        pattern = { "csv" },
        callback = function(event)
          require("which-key").add(
            {
              buffer = event.buf,
              { "<A-v>", "<CMD>CsvViewToggle<CR>", desc = "Toggle CSV view [csvview]" },
            }
          )
        end,
      })
  end,
}
