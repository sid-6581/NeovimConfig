local M = {
  "nvim-treesitter/nvim-treesitter",
  build = function()
    require("nvim-treesitter.install").update({ with_sync = true })
  end,
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
      "comment",
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
      enable = false,
    },
    highlight = {
      enable = true,
      disable = { "help" },
      additional_vim_regex_highlighting = false,
    },
    indent = {
      enable = true,
      disable = { "yaml" },
    },
  })
end

return M
