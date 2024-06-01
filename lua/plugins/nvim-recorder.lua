return {
  "chrisgrieser/nvim-recorder",
  event = "VeryLazy",

  opts = {
    slots = { "q", "w" },
    mapping = {
      startStopRecording = "Q",
      playMacro = "@",
      switchSlot = "<C-q>",
      editMacro = "cq",
      deleteAllMacros = "dq",
      yankMacro = "yq",
      -- This should be a string you don't use in insert mode during a macro
      addBreakPoint = "##",
    },
  },
}
