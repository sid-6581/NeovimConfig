local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufAdd", "BufNew", "BufNewFile", "BufWinEnter" }, {
  group = vim.api.nvim_create_augroup("TS_FOLD_WORKAROUND", {}),
  callback = function()
    vim.opt.foldmethod = "expr"
    vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
  end,
})

configs.setup({
  ensure_installed = {
    "bash",
    "c",
    "c_sharp",
    "cmake",
    "comment",
    "cpp",
    "css",
    "dockerfile",
    "go",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "jsonc",
    "kotlin",
    "lua",
    "make",
    "markdown",
    "pug",
    "python",
    "r",
    "regex",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml",
  }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "phpdoc" }, -- List of parsers to ignore installing
  autopairs = {
    enable = false,
  },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
    disable = { "yaml" },
  },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
})
