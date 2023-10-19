return {
  "rmagatti/goto-preview",
  event = "VeryLazy",

  -- stylua: ignore
  keys = {
    { "<Leader>cpd", function() require("goto-preview").goto_preview_definition({}) end, desc = "Preview definition" },
    { "<Leader>cpt", function() require("goto-preview").goto_preview_type_definition({}) end, desc = "Preview type definition", },
    { "<Leader>cpi", function() require("goto-preview").goto_preview_implementation({}) end, desc = "Preview implementation", },
    { "<Leader>cpP", function() require("goto-preview").close_all_win({}) end, desc = "Close all preview windows" },
    { "<Leader>cpr", function() require("goto-preview").goto_preview_references({}) end, desc = "Preview references" },
  },

  opts = {},
}
