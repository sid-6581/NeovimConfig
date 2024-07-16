return {
  "chrisgrieser/nvim-recorder",
  event = "VeryLazy",

  opts = {
    slots = { "q", "w" },
    useNerdfontIcons = false,
    mapping = {
      startStopRecording = "Q",
      playMacro = "@",
      switchSlot = "<C-q>",
      editMacro = "cq",
      deleteAllMacros = "dq",
      yankMacro = "yq",
      addBreakPoint = "##",
    },
  },
}
