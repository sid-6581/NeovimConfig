return {
  "lervag/vimtex",
  event = "VeryLazy",
  ft = "tex",

  init = function()
    vim.g.vimtex_syntax_enabled = 0
    vim.g.vimtex_syntax_conceal_disable = 1

    vim.g.vimtex_view_method = "zathura_simple"
    vim.g.vimtex_syntax_conceal = {
      sections = 1,
    }
    vim.g.vimtex_compiler_latexmk = {
      aux_dir = "build",
      out_dir = "build",
    }

    vim.api.nvim_create_autocmd({ "FileType" }, {
      pattern = { "tex" },
      callback = function(_event)
        -- vim.opt_local.conceallevel = 2
        vim.opt_local.foldmethod = "expr"
        vim.opt_local.foldexpr = "vimtex#fold#level(v:lnum)"
      end,
    })
  end,
}
