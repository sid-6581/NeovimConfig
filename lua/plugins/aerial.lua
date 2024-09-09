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
  },

  keys = {
    { "<Leader>co", function() require("aerial").toggle({ focus = false }) end, desc = "Symbols outline [aerial]" },
  },

  config = function(_, opts)
    require("aerial").setup(opts)
    vim.api.nvim_set_hl(0, "AerialGuide", { link = "Comment" })
  end,
}
