return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "VeryLazy", "BufReadPre" },
  cmd = { "TSUpdateSync" },

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    -- "RRethy/nvim-treesitter-textsubjects",
  },

  keys = {
    { "<CR>", "v<CR>", remap = true, desc = "Select node [treesitter-textsubjects]" },
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
      "latex",
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
    },

    highlight = {
      enable = true,
    },

    indent = {
      enable = true,
      disable = {
        "vue",
      },
    },

    textsubjects = {
      enable = true,
      prev_selection = "<S-CR>",
      keymaps = {
        ["<CR>"] = { "textsubjects-smart", desc = "Select node [treesitter-textsubjects]" },
        [";"] = { "textsubjects-container-outer", desc = "Select outer container [treesitter-textsubjects]" },
        ["i;"] = { "textsubjects-container-inner", desc = "Select inner container [treesitter-textsubjects]" },
      },
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
