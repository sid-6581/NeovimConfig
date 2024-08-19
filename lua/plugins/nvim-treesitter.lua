return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy", "BufReadPre" },
  cmd = { "TSUpdateSync" },

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nushell/tree-sitter-nu",
  },

  opts = {
    ensure_installed = {
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
    },

    highlight = {
      enable = true,
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "<CR>",
        node_decremental = "<S-CR>",
        node_incremental = "<CR>",
      },
    },

    indent = {
      enable = true,
    },
  },

  config = function(_, opts)
    if vim.fn.has("win32") == 1 then
      require("nvim-treesitter.install").compilers = { "clang" }
    end

    require("nvim-treesitter.install").prefer_git = false
    require("nvim-treesitter.configs").setup(opts)
  end,
}
