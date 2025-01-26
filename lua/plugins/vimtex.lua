return {
  "lervag/vimtex",
  event = "VeryLazy",
  ft = "tex",

  init = function()
    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_syntax_conceal = {
      accents = 1,
      ligatures = 1,
      cites = 1,
      fancy = 1,
      spacing = 1,
      greek = 1,
      math_bounds = 1,
      math_delimiters = 1,
      math_fracs = 1,
      math_super_sub = 1,
      math_symbols = 1,
      sections = 1,
      styles = 1,
    }

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "tex" },
      callback = function(_event)
        vim.opt_local.conceallevel = 2
      end,
    })
  end,
}
