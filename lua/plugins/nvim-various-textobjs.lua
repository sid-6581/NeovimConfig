return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",

  -- stylua: ignore start
  keys = {
    { "!", function() require("various-textobjs").diagnostic() end, mode = { "o", "x" }, desc = "diagnostic" },
    { "ii", function() require("various-textobjs").indentation("inner", "inner") end, mode = { "o", "x" }, desc = "indentation level (no line above/below)" },
    { "ai", function() require("various-textobjs").indentation("outer", "outer") end, mode = { "o", "x" }, desc = "indentation level (and line above/below)" },
    { "is", function() require("various-textobjs").subword("inner") end, mode = { "o", "x" }, desc = "inner subword" },
    { "as", function() require("various-textobjs").subword("outer") end, mode = { "o", "x" }, desc = "a subword" },
    { "|", function() require("various-textobjs").column() end, mode = { "o", "x" }, desc = "column down" },
    { "iv", function() require("various-textobjs").value("inner") end, mode = { "o", "x" }, desc = "inner value (assignment or key/value)" },
    { "av", function() require("various-textobjs").value("outer") end, mode = { "o", "x" }, desc = "a value (assignment or key/value)" },
    { "ik", function() require("various-textobjs").key("inner") end, mode = { "o", "x" }, desc = "inner key (assignment or key/value)" },
    { "ak", function() require("various-textobjs").key("outer") end, mode = { "o", "x" }, desc = "a key (assignment or key/value)" },
    { "im", function() require("various-textobjs").chainMember("inner") end, mode = { "o", "x" }, desc = "inner chain member" },
    { "am", function() require("various-textobjs").chainMember("outer") end, mode = { "o", "x" }, desc = "a chain member" },
    { "iL", function() require("various-textobjs").lineCharacterwise("inner") end, mode = { "o", "x" }, desc = "inner line characterwise" },
    { "aL", function() require("various-textobjs").lineCharacterwise("outer") end, mode = { "o", "x" }, desc = "a line characterwise" },
    { "R", function() require("various-textobjs").restOfIndentation() end, mode = { "o", "x" }, desc = "rest of indentation" },
  },
  -- stylua: ignore end

  opts = {
    lookForwardSmall = 0,
    lookForwardBig = 0,
  },
}
