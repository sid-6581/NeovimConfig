return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",

  dependencies = {
    -- markview needs to run before nvim-treesitter according to docs.
    "OXY2DEV/markview.nvim",
  },

  config = function()
    require("nvim-treesitter").setup()

    require("nvim-treesitter").install({
      "bash",
      "c",
      "c_sharp",
      "cmake",
      "cpp",
      "css",
      "diff",
      "dockerfile",
      "editorconfig",
      "git_rebase",
      "gitattributes",
      "gitignore",
      "go",
      "hcl",
      "hjson",
      "html",
      "http",
      "java",
      "javascript",
      "jsdoc",
      "json",
      "json5",
      "jsonc",
      "kotlin",
      "llvm",
      "lua",
      "make",
      "markdown",
      "markdown_inline",
      "nu",
      "pug",
      "python",
      "r",
      "qmljs",
      "query",
      "regex",
      "rust",
      "scheme",
      "scss",
      "toml",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "vue",
      "yaml",
      "zig",
    })

    vim.api.nvim_create_autocmd(
      { "FileType" },
      {
        callback = function(event)
          if vim.treesitter.get_parser(event.buf, nil, { error = false }) == nil then
            return
          end

          vim.treesitter.start(event.buf)
          vim.bo.indentexpr = "v:lua.require('nvim-treesitter').indentexpr()"
        end,
      })
  end,
}
