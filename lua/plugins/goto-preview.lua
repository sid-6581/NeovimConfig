return {
  "rmagatti/goto-preview",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { "gpd", function() require("goto-preview").goto_preview_definition({}) end, desc = "Preview definition" },
    { "gpt", function() require("goto-preview").goto_preview_type_definition({}) end, desc = "Preview type definition", },
    { "gpi", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview implementation", },
    { "gpP", function() require("goto-preview").close_all_win({}) end, desc = "Close all preview windows" },
    { "gpr", function() require("goto-preview").goto_preview_references({}) end, desc = "Preview references" },
  },

  opts = {},
}
