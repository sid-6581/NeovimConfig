return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",

  -- stylua: ignore start
  keys = {
    { mode = { "o", "x" }, "!", function() require("various-textobjs").diagnostic() end, desc = "diagnostic" },
    { mode = { "o", "x" }, "ii", function() require("various-textobjs").indentation("inner", "inner") end, desc = "indentation level (no line above/below)" },
    { mode = { "o", "x" }, "ai", function() require("various-textobjs").indentation("outer", "outer") end, desc = "indentation level (and line above/below)" },
    { mode = { "o", "x" }, "is", function() require("various-textobjs").subword("inner") end, desc = "inner subword" },
    { mode = { "o", "x" }, "as", function() require("various-textobjs").subword("outer") end, desc = "a subword" },
    { mode = { "o", "x" }, "|", function() require("various-textobjs").column() end, desc = "column down" },
    { mode = { "o", "x" }, "iv", function() require("various-textobjs").value("inner") end, desc = "inner value (assignment or key/value)" },
    { mode = { "o", "x" }, "av", function() require("various-textobjs").value("outer") end, desc = "a value (assignment or key/value)" },
    { mode = { "o", "x" }, "ik", function() require("various-textobjs").key("inner") end, desc = "inner key (assignment or key/value)" },
    { mode = { "o", "x" }, "ak", function() require("various-textobjs").key("outer") end, desc = "a key (assignment or key/value)" },
    { mode = { "o", "x" }, "im", function() require("various-textobjs").chainMember("inner") end, desc = "inner chain member" },
    { mode = { "o", "x" }, "am", function() require("various-textobjs").chainMember("outer") end, desc = "a chain member" },
    { mode = { "o", "x" }, "iL", function() require("various-textobjs").lineCharacterwise("inner") end, desc = "inner line characterwise" },
    { mode = { "o", "x" }, "aL", function() require("various-textobjs").lineCharacterwise("outer") end, desc = "a line characterwise" },
  },
  -- stylua: ignore end

  opts = {
    lookForwardSmall = 0,
    lookForwardBig = 0,
  },
}
