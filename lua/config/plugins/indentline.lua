local M = {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
}

function M.config()
  local indent_blankline = require("indent_blankline")

  vim.opt.list = true
  vim.opt.listchars:append("space:⋅")
  vim.opt.listchars:append("tab:» ")

  indent_blankline.setup({
    buftype_exclude = {
      "terminal",
      "nofile",
    },
    filetype_exclude = {
      "help",
      "startify",
      "dashboard",
      "packer",
      "neogitstatus",
      "NvimTree",
      "Trouble",
    },
    char = "▏",
    show_current_context = true,
    show_current_context_start = false,
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    use_treesitter = true,
    context_patterns = {
      "class",
      "return",
      "function",
      "method",
      "^if",
      "^while",
      "jsx_element",
      "^for",
      "^object",
      "^table",
      "block",
      "arguments",
      "if_statement",
      "else_clause",
      "jsx_element",
      "jsx_self_closing_element",
      "try_statement",
      "catch_clause",
      "import_statement",
      "operation_type",
    },
  })
end

return M
