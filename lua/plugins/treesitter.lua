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
      -- "comment",
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
      "regex",
      "rust",
      "scss",
      "toml",
      "sql",
      "tsx",
      "typescript",
      "vim",
      "vue",
      "yaml",
      "zig",
    },
    highlight = {
      enable = true,
      disable = { "comment", "help" },
      additional_vim_regex_highlighting = false,
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
      enable = false,
    },
    textobjects = {
      lookahead = false,
      select = {
        enable = true,
        lookahead = true,
        include_surrounding_whitespace = true,
        keymaps = {
          ["aa"] = { query = "@parameter.outer", desc = "an argument" },
          ["ia"] = { query = "@parameter.inner", desc = "inner argument" },
          ["af"] = { query = "@function.outer", desc = "a function" },
          ["if"] = { query = "@function.inner", desc = "inner function" },
          ["ac"] = { query = "@class.outer", desc = "a class" },
          ["ic"] = { query = "@class.inner", desc = "inner class" },
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]m"] = "@function.outer",
          ["]]"] = "@class.outer",
          [")"] = { query = { "@parameter.inner", "@statement.outer" } },
        },
        goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
        goto_previous_start = {
          ["[m"] = "@function.outer",
          ["[["] = "@class.outer",
          ["("] = { query = { "@parameter.inner", "@statement.outer" } },
        },
        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
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
