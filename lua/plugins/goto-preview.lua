return {
  "rmagatti/goto-preview",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { "gpc", function() require("goto-preview").close_all_win({}) end, desc = "Close all preview windows" },
    { "gpd", function() require("goto-preview").goto_preview_definition({}) end, desc = "Preview definition" },
    { "gpi", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview implementation", },
    { "gpr", function() require("goto-preview").goto_preview_references({}) end, desc = "Preview references" },
    { "gpt", function() require("goto-preview").goto_preview_type_definition({}) end, desc = "Preview type definition", },
  },

  opts = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
    preview_window_title = {
      enable = false,
    },
  },
}
