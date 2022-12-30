local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  cmd = { "TSUpdate", "TSUpdateSync" },
  event = "BufEnter",

  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-refactor",
    "mfussenegger/nvim-treehopper",
    {
      "nvim-treesitter/playground",
      cmd = "TSPlaygroundToggle",
    },
  },
}

function M.config()
  local configs = require("nvim-treesitter.configs")
  local install = require("nvim-treesitter.install")

  if vim.fn.has("win32") == 1 then install.compilers = { "clang" } end

  configs.setup({
    ensure_installed = {
      "bash",
      "c",
      "c_sharp",
      "cmake",
      -- "comment", -- comments are slowing down TS bigtime, so disable for now
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
    autopairs = {
      enable = true,
    },
    highlight = {
      enable = true,
      disable = { "help" },
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
      disable = { "yaml" },
    },
    refactor = {
      smart_rename = {
        enable = false,
        client = {
          smart_rename = "<leader>cr",
        },
      },
      navigation = {
        enable = true,
        keymaps = {
          -- goto_definition = "gd",
          -- list_definitions = "gnD",
          -- list_definitions_toc = "gO",
          -- goto_next_usage = "<a-*>",
          -- goto_previous_usage = "<a-#>",
        },
      },
    },
    textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = { ["]m"] = "@function.outer", ["]]"] = "@class.outer" },
        goto_next_end = { ["]M"] = "@function.outer", ["]["] = "@class.outer" },
        goto_previous_start = { ["[m"] = "@function.outer", ["[["] = "@class.outer" },
        goto_previous_end = { ["[M"] = "@function.outer", ["[]"] = "@class.outer" },
      },
      lsp_interop = {
        enable = false,
        peek_definition_code = {
          ["gD"] = "@function.outer",
        },
      },
    },
  })
end

return M
