return {
  "kylechui/nvim-surround",
  event = "VeryLazy",

  keys = {
    { "<Leader>'", "csq'", desc = "Replace surround with ''", remap = true },
    { "<Leader>(", "ds(", desc = "Remove surrounding ()", remap = true },
    { "<Leader>)", "csb)", desc = "Replace surround with ()", remap = true },
    { "<Leader><", "ds<", desc = "Remove surrounding <>", remap = true },
    { "<Leader>>", "csb>", desc = "Replace surround with <>", remap = true },
    { "<Leader>[", "ds[", desc = "Remove surrounding []", remap = true },
    { "<Leader>]", "csb]", desc = "Replace surround with []", remap = true },
    { "<Leader>{", "ds{", desc = "Remove surrounding {}", remap = true },
    { "<Leader>}", "csb{", desc = "Replace surround with { }", remap = true },
    { '<Leader>"', 'csq"', desc = 'Replace surround with ""', remap = true },
    { mode = { "v" }, "<Leader>'", "S'", desc = "Surround with ''", remap = true },
    { mode = { "v" }, "<Leader>)", "S)", desc = "Surround with ()", remap = true },
    { mode = { "v" }, "<Leader>>", "S>", desc = "Surround with <>", remap = true },
    { mode = { "v" }, "<Leader>]", "S]", desc = "Surround with []", remap = true },
    { mode = { "v" }, "<Leader>}", "S{", desc = "Surround with { }", remap = true },
    { mode = { "v" }, '<Leader>"', 'S"', desc = 'Surround with ""', remap = true },
  },

  opts = {
    aliases = {
      ["b"] = { ")", "]", "}", ">" },
      ["q"] = { '"', "'", "`" },
      ["s"] = { ")", "]", "}", ">", '"', "'", "`" },
    },
    move_cursor = false,
  },
}
