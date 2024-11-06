local set_buffer_mappings = function()
  local mc = require("multicursor-nvim")

  require("which-key").add(
    {
      buffer = true,
      {
        "<Esc>",
        function()
          if not mc.cursorsEnabled() then
            mc.enableCursors()
          elseif mc.hasCursors() then
            require("util.key").delete_buffer_mappings(
              function(m)
                return m.desc and m.desc:match("%[multicursor%]") ~= nil or false
              end
            )
            mc.clearCursors()
          end
        end,
        desc = "Exit [multicursor]",
      },
      { "<C-x>", function() mc.matchSkipCursor(1) end, mode = { "n", "x" }, desc = "Skip match cursor [multicursor]" },
      { "<C-p>", function() mc.deleteCursor() end, mode = { "n", "x" }, desc = "Delete cursor [multicursor]" },
      { "<C-j>", function() mc.nextCursor() end, mode = { "n", "x" }, desc = "Next cursor [multicursor]" },
      { "<C-k>", function() mc.prevCursor() end, mode = { "n", "x" }, desc = "Previous cursor [multicursor]" },
      { "<C-=>", function() require("multicursor-nvim").alignCursors() end, mode = { "n", "x" }, desc = "Align cursors [multicursor]" },

      { "<Esc>", "<Esc>", mode = "i", desc = "Exit [multicursor]" },

      { "I", function() require("multicursor-nvim").insertVisual() end, mode = { "x" }, desc = "Insert [multicursor]" },
      { "A", function() require("multicursor-nvim").appendVisual() end, mode = { "x" }, desc = "Append [multicursor]" },
      { "<A-j>", function() mc.transposeCursors(1) end, mode = { "x" }, desc = "Transpose cursors down [multicursor]" },
      { "<A-k>", function() mc.transposeCursors(-1) end, mode = { "x" }, desc = "Transpose cursors up [multicursor]" },
    }
  )
end

return {
  "jake-stewart/multicursor.nvim",
  event = "VeryLazy",

  keys = {
    {
      "<C-n>",
      function()
        require("multicursor-nvim").matchAddCursor(1)
        set_buffer_mappings()
      end,
      mode = { "n", "x" },
      desc = "Add match cursor [multicursor]",
    },
    {
      "<C-Space>",
      function()
        require("multicursor-nvim").toggleCursor()
        set_buffer_mappings()
      end,
      mode = { "n", "x" },
      desc = "Toggle cursor [multicursor]",
    },
    {
      "<C-Down>",
      function()
        require("multicursor-nvim").lineAddCursor(1)
        set_buffer_mappings()
      end,
      desc = "Add cursor down [multicursor]",
    },
    {
      "<C-Up>",
      function()
        require("multicursor-nvim").lineAddCursor(-1)
        set_buffer_mappings()
      end,
      desc = "Add cursor up [multicursor]",
    },
    {
      "<C-\\>",
      function()
        require("multicursor-nvim").splitCursors()
        set_buffer_mappings()
      end,
      mode = { "x" },
      desc = "Split cursors [multicursor]",
    },
    {
      "<C-/>",
      function()
        require("multicursor-nvim").matchCursors()
        set_buffer_mappings()
      end,
      mode = { "x" },
      desc = "Add regex cursors [multicursor]",
    },
  },

  opts = {
    signs = true,
    shallowUndo = true,
  },
}
