return {
  "3rd/image.nvim",
  event = "VeryLazy",
  build = false,

  opts = {
    processor = "magick_cli",
    window_overlap_clear_enabled = true,
    window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "snacks_notif", "scrollview", "scrollview_sign", "incline" },
  },
}
