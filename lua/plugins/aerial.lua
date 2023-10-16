return {
  "stevearc/aerial.nvim",

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
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        "Package",
        "Property",
        "Struct",
        "Trait",
      },
      lua = {
        "Class",
        "Constructor",
        "Enum",
        "Field",
        "Function",
        "Interface",
        "Method",
        "Module",
        "Namespace",
        -- "Package", -- remove package since luals uses it for control flow structures
        "Property",
        "Struct",
        "Trait",
      },
    },
  },

  keys = {
    { "<Leader>co", function() require("aerial").toggle({ focus = false }) end, desc = "Symbols outline" },
  },

  config = function(_, opts)
    require("aerial").setup(opts)
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "Comment" })
  end,
}
