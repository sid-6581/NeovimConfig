return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",

  -- stylua: ignore start
  keys = {
    { "!", function() require("various-textobjs").diagnostic("wrap") end, mode = { "o", "x" }, desc = "Diagnostic" },
    { "ii", function() require("various-textobjs").indentation("inner", "inner") end, mode = { "o", "x" }, desc = "Indentation level (no line above/below)" },
    { "ai", function() require("various-textobjs").indentation("outer", "outer") end, mode = { "o", "x" }, desc = "Indentation level (and line above/below)" },
    { "is", function() require("various-textobjs").subword("inner") end, mode = { "o", "x" }, desc = "Inner subword" },
    { "as", function() require("various-textobjs").subword("outer") end, mode = { "o", "x" }, desc = "A subword" },
    { "|", function() require("various-textobjs").column() end, mode = { "o", "x" }, desc = "Column down" },
    { "iv", function() require("various-textobjs").value("inner") end, mode = { "o", "x" }, desc = "Inner value (assignment or key/value)" },
    { "av", function() require("various-textobjs").value("outer") end, mode = { "o", "x" }, desc = "A value (assignment or key/value)" },
    { "ik", function() require("various-textobjs").key("inner") end, mode = { "o", "x" }, desc = "Inner key (assignment or key/value)" },
    { "ak", function() require("various-textobjs").key("outer") end, mode = { "o", "x" }, desc = "A key (assignment or key/value)" },
    { "im", function() require("various-textobjs").chainMember("inner") end, mode = { "o", "x" }, desc = "Inner chain member" },
    { "am", function() require("various-textobjs").chainMember("outer") end, mode = { "o", "x" }, desc = "A chain member" },
    { "iL", function() require("various-textobjs").lineCharacterwise("inner") end, mode = { "o", "x" }, desc = "Inner line characterwise" },
    { "aL", function() require("various-textobjs").lineCharacterwise("outer") end, mode = { "o", "x" }, desc = "A line characterwise" },
    { "R", function() require("various-textobjs").restOfIndentation() end, mode = { "o", "x" }, desc = "Rest of indentation" },
  },
  -- stylua: ignore end

  opts = {
    lookForwardSmall = 0,
    lookForwardBig = 0,
  },
}
