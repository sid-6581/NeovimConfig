return {
  "andersevenrud/nvim_context_vt",
  event = "VeryLazy",

  keys = {
    { "<Leader>ut", "<CMD>NvimContextVtToggle<CR>", desc = "Toggle treesitter context" },
  },

  opts = {
    prefix = "",
    highlight = "GruvboxBg3",
    disable_virtual_lines = true,
    min_rows = 5,
  },
}
