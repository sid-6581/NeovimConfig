return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",

  keys = {
    { "<C-i>", function() require("multicursor-nvim").jumpForward() end, mode = { "n", "v" }, desc = "Jump forward [multicursor]" },
    { "<C-o>", function() require("multicursor-nvim").jumpBackward() end, mode = { "n", "v" }, desc = "Jump backward [multicursor]" },
    { "<C-n>", function() require("multicursor-nvim").matchAddCursor(1) end, mode = { "n", "x" }, desc = "Add match cursor [multicursor]" },
    { "g<C-n>", function() require("multicursor-nvim").matchAllAddCursors() end, mode = { "n", "x" }, desc = "Add all match cursors [multicursor]" },
    { "<C-Space>", function() require("multicursor-nvim").toggleCursor() end, mode = { "n", "x" }, desc = "Toggle cursor [multicursor]" },
    { "<C-Down>", function() require("multicursor-nvim").lineAddCursor(1) end, desc = "Add cursor down [multicursor]" },
    { "<C-Up>", function() require("multicursor-nvim").lineAddCursor(-1) end, desc = "Add cursor up [multicursor]" },
    { "<C-\\>", function() require("multicursor-nvim").splitCursors() end, mode = { "x" }, desc = "Split cursors [multicursor]" },
    { "<C-/>", function() require("multicursor-nvim").matchCursors() end, mode = { "x" }, desc = "Add regex cursors [multicursor]" },
    { "gC", function() require("multicursor-nvim").addCursorOperator() end, desc = "Add cursor operator [multicursor]" },
  },

  opts = {},

  config = function(_, opts)
    local mc = require("multicursor-nvim")
    mc.setup(opts)

    mc.addKeymapLayer(
      function(layerSet)
        layerSet({ "n" }, "<Esc>", function() if mc.cursorsEnabled() then mc.clearCursors() else mc.enableCursors() end end)
        layerSet({ "n", "x" }, "<C-x>", function() mc.matchSkipCursor(1) end, { desc = "Skip match cursor [multicursor]" })
        layerSet({ "n", "x" }, "<C-p>", function() mc.deleteCursor() end, { desc = "Delete cursor [multicursor]" })
        layerSet({ "n", "x" }, "<C-j>", function() mc.nextCursor() end, { desc = "Next cursor [multicursor]" })
        layerSet({ "n", "x" }, "<C-k>", function() mc.prevCursor() end, { desc = "Previous cursor [multicursor]" })
        layerSet({ "n", "x" }, "<C-=>", function() require("multicursor-nvim").alignCursors() end, { desc = "Align cursors [multicursor]" })
        layerSet({ "i" }, "<Esc>", "<Esc>", { desc = "Exit [multicursor]" })
        layerSet({ "x" }, "I", function() require("multicursor-nvim").insertVisual() end, { desc = "Insert [multicursor]" })
        layerSet({ "x" }, "A", function() require("multicursor-nvim").appendVisual() end, { desc = "Append [multicursor]" })
        layerSet({ "x" }, "<A-j>", function() mc.transposeCursors(1) end, { desc = "Transpose cursors down [multicursor]" })
        layerSet({ "x" }, "<A-k>", function() mc.transposeCursors(-1) end, { desc = "Transpose cursors up [multicursor]" })
      end)
  end,
}
