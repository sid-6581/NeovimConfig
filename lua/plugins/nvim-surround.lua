return {
  "kylechui/nvim-surround",
  event = "VeryLazy",

  keys = {
    { "<Leader>'", "csq'", remap = true, desc = "Replace surround with '' [surround]" },
    { "<Leader>(", "ds(", remap = true, desc = "Remove surrounding () [surround]" },
    { "<Leader>)", "csb)", remap = true, desc = "Replace surround with () [surround]" },
    { "<Leader><", "ds<", remap = true, desc = "Remove surrounding <> [surround]" },
    { "<Leader>>", "csb>", remap = true, desc = "Replace surround with <> [surround]" },
    { "<Leader>[", "ds[", remap = true, desc = "Remove surrounding [] [surround]" },
    { "<Leader>]", "csb]", remap = true, desc = "Replace surround with [] [surround]" },
    { "<Leader>{", "ds{", remap = true, desc = "Remove surrounding {} [surround]" },
    { "<Leader>}", "csb{", remap = true, desc = "Replace surround with { } [surround]" },
    { '<Leader>"', 'csq"', remap = true, desc = 'Replace surround with "" [surround]' },
    { "<Leader>'", "S'", mode = { "x" }, remap = true, desc = "Surround with '' [surround]" },
    { "<Leader>)", "S)", mode = { "x" }, remap = true, desc = "Surround with () [surround]" },
    { "<Leader>>", "S>", mode = { "x" }, remap = true, desc = "Surround with <> [surround]" },
    { "<Leader>]", "S]", mode = { "x" }, remap = true, desc = "Surround with [] [surround]" },
    { "<Leader>}", "S{", mode = { "x" }, remap = true, desc = "Surround with { } [surround]" },
    { '<Leader>"', 'S"', mode = { "x" }, remap = true, desc = 'Surround with "" [surround]' },
  },

  opts = {
    aliases = {
      ["b"] = { ")", "]", "}", ">" },
      ["q"] = { '"', "'", "`" },
      ["s"] = { ")", "]", "}", ">", '"', "'", "`", "t" },
    },
    move_cursor = "sticky",
  },
}
