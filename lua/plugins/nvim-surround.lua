return {
  "kylechui/nvim-surround",
  event = "VeryLazy",

  keys = {
    { "<Leader>'", "csq'", remap = true, desc = "Replace surround with ''" },
    { "<Leader>(", "ds(", remap = true, desc = "Remove surrounding ()" },
    { "<Leader>)", "csb)", remap = true, desc = "Replace surround with ()" },
    { "<Leader><", "ds<", remap = true, desc = "Remove surrounding <>" },
    { "<Leader>>", "csb>", remap = true, desc = "Replace surround with <>" },
    { "<Leader>[", "ds[", remap = true, desc = "Remove surrounding []" },
    { "<Leader>]", "csb]", remap = true, desc = "Replace surround with []" },
    { "<Leader>{", "ds{", remap = true, desc = "Remove surrounding {}" },
    { "<Leader>}", "csb{", remap = true, desc = "Replace surround with { }" },
    { '<Leader>"', 'csq"', remap = true, desc = 'Replace surround with ""' },
    { "<Leader>'", "S'", mode = { "v" }, remap = true, desc = "Surround with ''" },
    { "<Leader>)", "S)", mode = { "v" }, remap = true, desc = "Surround with ()" },
    { "<Leader>>", "S>", mode = { "v" }, remap = true, desc = "Surround with <>" },
    { "<Leader>]", "S]", mode = { "v" }, remap = true, desc = "Surround with []" },
    { "<Leader>}", "S{", mode = { "v" }, remap = true, desc = "Surround with { }" },
    { '<Leader>"', 'S"', mode = { "v" }, remap = true, desc = 'Surround with ""' },
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
