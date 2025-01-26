return {
  "lervag/vimtex",
  event = "VeryLazy",
  ft = "tex",

  init = function()
    vim.g.vimtex_view_method = "zathura_simple"

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "tex" },
      callback = function(_event)
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}
