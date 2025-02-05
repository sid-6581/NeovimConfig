return {
  "chrisgrieser/nvim-various-textobjs",
  event = "VeryLazy",

  keys = {
    {
      "!",
      function() require("various-textobjs").diagnostic("wrap") end,
      mode = { "o", "x" },
      desc = "Diagnostic [various-textobjs]",
    },
    {
      "is",
      function() require("various-textobjs").subword("inner") end,
      mode = { "o", "x" },
      desc = "Inner subword [various-textobjs]",
    },
    {
      "as",
      function() require("various-textobjs").subword("outer") end,
      mode = { "o", "x" },
      desc = "A subword [various-textobjs]",
    },
    {
      "|",
      function() require("various-textobjs").column() end,
      mode = { "o", "x" },
      desc = "Column down [various-textobjs]",
    },
    {
      "iv",
      function() require("various-textobjs").value("inner") end,
      mode = { "o", "x" },
      desc = "Inner value (assignment or key/value) [various-textobjs]",
    },
    {
      "av",
      function() require("various-textobjs").value("outer") end,
      mode = { "o", "x" },
      desc = "A value (assignment or key/value) [various-textobjs]",
    },
    {
      "ik",
      function() require("various-textobjs").key("inner") end,
      mode = { "o", "x" },
      desc = "Inner key (assignment or key/value) [various-textobjs]",
    },
    {
      "ak",
      function() require("various-textobjs").key("outer") end,
      mode = { "o", "x" },
      desc = "A key (assignment or key/value) [various-textobjs]",
    },
    {
      "im",
      function() require("various-textobjs").chainMember("inner") end,
      mode = { "o", "x" },
      desc = "Inner chain member [various-textobjs]",
    },
    {
      "am",
      function() require("various-textobjs").chainMember("outer") end,
      mode = { "o", "x" },
      desc = "A chain member [various-textobjs]",
    },
    {
      "iL",
      function() require("various-textobjs").lineCharacterwise("inner") end,
      mode = { "o", "x" },
      desc = "Inner line characterwise [various-textobjs]",
    },
    {
      "aL",
      function() require("various-textobjs").lineCharacterwise("outer") end,
      mode = { "o", "x" },
      desc = "A line characterwise [various-textobjs]",
    },
    {
      "R",
      function() require("various-textobjs").restOfIndentation() end,
      mode = { "o", "x" },
      desc = "Rest of indentation [various-textobjs]",
    },
  },

  opts = {
    forwardLooking = {
      small = 0,
      big = 0,
    },
  },
}
