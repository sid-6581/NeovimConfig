return {
  "stevearc/aerial.nvim",
  event = "VeryLazy",

  opts = {
    backends = { "lsp", "treesitter", "markdown", "man" },

    layout = {
      min_width = 30,
      placement = "edge",
    },

    attach_mode = "global",
    highlight_mode = "last",
    highlight_closest = false,
    highlight_on_hover = true,
    show_guides = true,

    filter_kind = {
      ["_"] = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        "Package",
        "Property",
        "String",
        "Struct",
        "TypeParameter",
        "Variable",
      },
      lua = {
        "Array",
        "Boolean",
        "Class",
        "Constant",
        "Constructor",
        "Enum",
        "EnumMember",
        "Event",
        "Field",
        "File",
        "Function",
        "Interface",
        "Key",
        "Method",
        "Module",
        "Namespace",
        "Null",
        "Number",
        "Object",
        "Operator",
        -- "Package", -- remove package since luals uses it for control flow structures
        "Property",
        "String",
        "Struct",
        "TypeParameter",
        "Variable",
      },
    },
  },

  keys = {
    { "<Leader>co", function() require("aerial").toggle({ focus = false }) end, desc = "Symbols outline [aerial]" },
  },

  config = function(_, opts)
    require("aerial").setup(opts)
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "Comment" })
  end,
}
