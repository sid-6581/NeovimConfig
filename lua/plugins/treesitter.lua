return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = "VeryLazy",
  cmd = { "TSUpdateSync" },

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
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
        scope_incremental = "<Tab>",
      },
    },

    indent = {
      enable = true,
    },

    textobjects = {
      select = {
        enable = true,
        lookahead = false,
        include_surrounding_whitespace = true,
        keymaps = {},
      },

      swap = {
        enable = true,
        swap_next = {
          ["<A-l>"] = {
            query = { "@parameter.inner", "@statement.outer", "@*" },
            desc = "Swap with next node",
          },
        },
        swap_previous = {
          ["<A-h>"] = {
            query = { "@parameter.inner", "@statement.outer", "@*" },
            desc = "Swap with previous node",
          },
        },
      },
    },
  },

  config = function(_, opts)
    if vim.fn.has("win32") == 1 then require("nvim-treesitter.install").compilers = { "clang" } end
    require("nvim-treesitter.install").prefer_git = false
    require("nvim-treesitter.configs").setup(opts)
  end,
}
