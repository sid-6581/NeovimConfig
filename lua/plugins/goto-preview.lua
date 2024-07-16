return {
  "rmagatti/goto-preview",
  event = "VeryLazy",

  keys = {
    { "gpc", function() require("goto-preview").close_all_win({}) end, desc = "Close all preview windows [goto-preview]" },
    { "gpd", function() require("goto-preview").goto_preview_definition({}) end, desc = "Preview definition [goto-preview]" },
    { "gpi", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview implementation [goto-preview]" },
    { "gpr", function() require("goto-preview").goto_preview_references({}) end, desc = "Preview references [goto-preview]" },
    { "gpt", function() require("goto-preview").goto_preview_type_definition({}) end, desc = "Preview type definition [goto-preview]" },
  },

  opts = {
    border = { "┌", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
    preview_window_title = {
      enable = false,
    },
  },
}
