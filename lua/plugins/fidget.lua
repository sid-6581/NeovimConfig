return {
  "j-hui/fidget.nvim",
  opts = {
    progress = {
      ignore_done_already = true,
      ignore_empty_message = true,
      display = {
        overrides = {
          rust_analyzer = {
            update_hook = function(item)
              require("fidget.notification").set_content_key(item)
              if item.annote:match("clippy") then item.hidden = true end
              if item.annote:match("Roots") then item.hidden = true end
              if item.annote:match("Loading") then item.hidden = true end
            end,
          },
        },
      },
    },
    notification = {
      filter = vim.log.levels.DEBUG,
      override_vim_notify = true,
    },
  },
}
