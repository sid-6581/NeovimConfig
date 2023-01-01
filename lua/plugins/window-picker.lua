return {
  "s1n7ax/nvim-window-picker",

  config = function()
    require("window-picker").setup({
      other_win_hl_color = "#1d2021",
      selection_display = function(char)
        return "  " .. char .. "  "
      end,
    })
  end,
}
